-- 부속질이 (Sub Query)

-- 가격이 가장 비싼 도서의 가격을 출력 하시오.
SELECT MAX(price)
FROM Book;

-- 만약 가격을 알고있다면 다음과 같이 검색 할 수 있다.
SELECT BOOKNAME, PRICE
FROM BOOK
WHERE PRICE = 35000;

-- 가장 비싼 도서의 이름을 출력 하시오
SELECT BOOKNAME
FROM BOOK
where PRICE = (SELECT MAX(PRICE) FROM BOOK);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT NAME
FROM CUSTOMER
where CUSTID in (SELECT CUSTID FROM ORDERS);

-- '대한 미디어'에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID
                 FROM ORDERS
                 WHERE BOOKID IN (SELECT BOOKID
                                  FROM BOOK
                                  WHERE PUBLISHER = '대한미디어'));

-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오
SELECT b1.BOOKNAME
FROM BOOK b1
WHERE b1.PRICE > (SELECT avg(b2.PRICE)
               FROM BOOK b2
               WHERE b1.PUBLISHER = b2.PUBLISHER);

/*
   투플 변수
   테이블 이름이 길거나 한 개의 테이블이 SQL 문에 두번 사용될 때 혼란을 피하고자 테이블의 별칠을 붙여 사용한다.
   이를 투플 변수(Tuple)이라 한다. 투플 변수는 FROM절의 테이블 이름 뒤에 표기한다.
*/
-- 집합연산

-- 도서를 주문하지 않은 고객
SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN(SELECT CUSTID
                FROM ORDERS);

-- 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT NAME, ADDRESS
FROM CUSTOMER cs
WHERE EXISTS(SELECT *
             FROM ORDERS od
             WHERE cs.CUSTID = od.CUSTID);