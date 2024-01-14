-- 연습 문제

--도서번호가 1인 도서의 이름
SELECT BOOKNAME
FROM BOOK
WHERE BOOKID = 1;

--가격이 20,000원 이상인 도서의 이름
SELECT BOOKNAME
FROM BOOK
WHERE PRICE >= 20000;

-- 박지성의 총 구매액
-- SubQuery
SELECT SUM(SALEPRICE) AS TOTALPRICE
FROM ORDERS
where CUSTID = (SELECT CUSTID
                FROM CUSTOMER
                WHERE NAME = '박지성');

SELECT SUM(O.SALEPRICE) AS TOTALPRICE
FROM ORDERS O
         INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
WHERE C.NAME = '박지성';

SELECT SUM(SALEPRICE)
FROM ORDERS
WHERE CUSTID = 1;

-- 박지성이 구매한 도서의 수
SELECT COUNT(ORDERID) AS COUNTBOOK
FROM ORDERS O
         INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
WHERE C.NAME = '박지성';

SELECT COUNT(SALEPRICE)
FROM ORDERS
WHERE CUSTID = 1;


-- 박지성이 구매한 도서의 출판사 수
SELECT COUNT(PUBLISHER) AS COUNTPUBLISHER
FROM BOOK B
         INNER JOIN ORDERS O ON B.BOOKID = O.BOOKID
WHERE O.CUSTID = (SELECT CUSTID
                  FROM CUSTOMER
                  WHERE NAME = '박지성');


SELECT COUNT(PUBLISHER)
FROM BOOK,
     ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID
  AND ORDERS.CUSTID = 1;

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT B.BOOKNAME, B.PRICE, B.PRICE - O.SALEPRICE AS DIFF
FROM BOOK B,
     CUSTOMER C,
     ORDERS O
WHERE B.BOOKID = O.BOOKID
  AND O.CUSTID = C.CUSTID
  AND C.NAME = '박지성';


-- 박지성이 구매하지 않은 도서의 이름
-- DISTINCT : 중복 데이터 제거
SELECT DISTINCT B.BOOKNAME
FROM BOOK B,
     ORDERS O,
     CUSTOMER C
WHERE B.BOOKID = O.BOOKID
  AND O.CUSTID = C.CUSTID
  AND C.NAME != '박지성';

-- 마다서점의 도서의 총수
SELECT COUNT(*)
FROM BOOK;

-- 마당서점에 도서를 출고하는 출판사의 총수
SELECT COUNT(DISTINCT PUBLISHER)
FROM BOOK;

-- 모든 고객의 이름, 주소
SELECT NAME, ADDRESS
FROM CUSTOMER;

-- 특정기간 사이에 주문받은 도서의 주문번호
SELECT ORDERID
FROM ORDERS
WHERE ORDERDATE BETWEEN '20.07.04' AND '20.7.7';

-- 특정기간을 제외한 주문받은 도서의 주문번호
SELECT ORDERID
FROM ORDERS
MINUS
SELECT ORDERID
FROM ORDERS
WHERE ORDERDATE BETWEEN '20.07.04' AND '20.7.7';

SELECT ORDERID
FROM ORDERS
WHERE ORDERDATE NOT BETWEEN '20.07.04' AND '20.7.7';

-- 성이 김씨인 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '김%';

-- 성이 김씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '김%아';

-- 주문하지 않은 고객의 이름(부속질의 사용)
SELECT NAME
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID
                     FROM ORDERS);

-- 주문금액의 총액과 주문의 평균 금액
SELECT SUM(SALEPRICE) AS 총액, AVG(SALEPRICE) AS 평균액
FROM ORDERS;

--고객의 이름과 고객별 구매액
SELECT C.NAME, SUM(O.SALEPRICE)
FROM CUSTOMER C,
     ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME;

-- 고객의 이름과 구매한 도서 목록
SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,
     ORDERS O,
     BOOK B
WHERE C.CUSTID = O.CUSTID
  AND O.BOOKID = B.BOOKID;

-- 도서의 가격(BOOK 테이블)과 판매가격(ORDERS 테이블)의 차이가 가장 많은 주문
SELECT O.*
FROM BOOK B,
     ORDERS O
WHERE B.BOOKID = O.BOOKID
  AND B.PRICE - O.SALEPRICE = (SELECT MAX(B.PRICE - O.SALEPRICE)
                               FROM BOOK B,
                                    ORDERS O
                               WHERE B.BOOKID = O.BOOKID);

--도서의 판매액 편균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT C.NAME
FROM ORDERS O,
     CUSTOMER C
WHERE O.CUSTID = C.CUSTID
GROUP BY NAME
HAVING AVG(SALEPRICE) > (SELECT AVG(SALEPRICE)
                         FROM ORDERS);

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT C.NAME
FROM ORDERS O,
     CUSTOMER C,
     BOOK B
WHERE O.CUSTID = C.CUSTID AND O.BOOKID = B.BOOKID
  AND NAME NOT LIKE '박지성'
  AND B.PUBLISHER IN (SELECT B.PUBLISHER
                      FROM CUSTOMER C,
                           BOOK B,
                           ORDERS O
                      WHERE C.CUSTID = O.CUSTID
                        AND B.BOOKID = O.BOOKID
                        AND NAME LIKE '박지성');