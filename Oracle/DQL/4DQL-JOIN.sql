-- 데이터 질의어 - DQL(Data Query Language)
/*Join*/

/*
조인 문법
내부조인
    SELECT  <속성들>
    FROM    테이블1, 테이블2
    WHERE   <조인조건> AND <검색조건>
    -------------------------------
    SELECT  <속성들>
    FROM    테이블1 INNER JOIN 테이블2 ON <조인조건>
    WHERE   <검색조건>
외부조인
    SELECT  <속성들>
    FROM    테이블1 {LEFT | RIGHT | FULL[OUTER]} JOIN 테이블 2 OM <조인조건>
    WHERE   <조인조건> AND <검색조건>
*/

SELECT *
FROM CUSTOMER,
     ORDERS;

/*고객과 고객의 주문에 관한 데이터를 모두 보이시오.*/
SELECT *
FROM CUSTOMER,
     ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID;

/*고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.*/
SELECT *
FROM CUSTOMER,
     ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

/*고객의 이름과 고객이 주문한 도서의 판매가격을 검색*/
SELECT NAME, SALEPRICE
FROM CUSTOMER,
     ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID;

/*고객별로 주문한 모든 도서의 총판매액을 구하고, 고객별로 정렬하시오. */
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,
     ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

/*고객의 이름과 고객이 주문한 도서의 이름을 구하시오*/
SELECT NAME, BOOKNAME
FROM CUSTOMER,
     ORDERS,
     BOOK
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID
  AND ORDERS.BOOKID = BOOK.BOOKID;

/* 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오*/
SELECT CUSTOMER.NAME, BOOK.BOOKNAME, BOOK.PRICE
FROM CUSTOMER,
     ORDERS,
     BOOK
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID
  AND ORDERS.BOOKID = BOOK.BOOKID
  AND PRICE >= 20000;

/*도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.*/
SELECT CUSTOMER.NAME, SALEPRICE
FROM CUSTOMER
         LEFT OUTER JOIN ORDERS
                         ON CUSTOMER.CUSTID = ORDERS.CUSTID;
