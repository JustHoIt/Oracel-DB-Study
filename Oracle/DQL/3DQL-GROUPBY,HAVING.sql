-- 데이터 질의어 - DQL(Data Query Language)
/* 정렬 ORDER BY*/
/* 도서 이름순 검색*/
SELECT *
FROM BOOK
ORDER BY BOOKNAME;

/*가격순으로 검색, 가격이 같다면 이름순으로 정렬*/
SELECT *
FROM BOOK
ORDER BY PRICE, BOOKNAME;

/*도서의 가격을 내림차순으로 검색, 가격이 같다면 출판사 오름차순 으로 정렬(DESC : 내림차순, ASC : 오름차순)*/
SELECT *
FROM BOOK
ORDER BY PRICE DESC, PUBLISHER ASC;

/*집계 함수
SUM     SUM([ALL | DISTINCT ] 속성이름) EX) SUM(PRICE)
AVG     AVG([ALL | DISTINCT ] 속성이름) EX) AVG(PRICE)
COUNT   COUNT({[[ ALL | DISTINCT ] 속성이름 ] |* }) EX) COUNT(*)
MAX     MAX([ALL | DISTINCT ] 속성이름) EX) MAX(PRICE)
MIN     MIN([ALL | DISTINCT ] 속성이름) EX) MIN(PRICE)
*/


/*고객이 주문한 도서의 총판매액을 구하시오*/
SELECT *
FROM ORDERS;

SELECT SUM(SALEPRICE)
FROM ORDERS;

/* AS */
SELECT SUM(SALEPRICE) AS 총매출
FROM ORDERS;

/* 2번 김연아 라는 이름으로 주문한 도서의 총 판매액*/
SELECT SUM(SALEPRICE) AS 총판매
FROM ORDERS
WHERE CUSTID = 2;

/* 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가, 판매건수*/
SELECT  SUM(SALEPRICE) AS TOTAL,
        AVG(SALEPRICE) AS AVERAGE,
        MIN(SALEPRICE) AS MINIMUN,
        MAX(SALEPRICE) AS MAXIMUM,
        COUNT(SALEPRICE) AS COUNT
FROM ORDERS;

/*마당서점의 도서 판매 건수*/
SELECT COUNT(*)
FROM ORDERS;

/*같은 속성 묶어서 출력 GROUP BY*/

/*고객별로 주문한 도서의 총수량과 총판매액을 구하시오*/
SELECT CUSTID AS 사용자아이디, COUNT(*) AS 총판매, SUM(SALEPRICE) AS 총판매액
FROM ORDERS
GROUP BY CUSTID;


/*가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량을 검색 단 2권 이상인 고객만 검색하기(HAVAING)*/
SELECT CUSTID, COUNT(*) AS 도서수량
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;


/*
GRUOP BY 가 포함된 SQL 문 실행 순서
SELECT    CUSTID, COUNT(*) AS 도서수량       -⑤
FROM      ORDERS                            -①
WHERE     SALEPRICE >= 8000                 -②
GROUP BY  CUSTID                            -③
HAVING    COUNT(*) > 1                      -④
ORDER BY  CUSTID;                           -⑥
*/


/*
GROUP BY 와 HAVING 절의 문법과 주의 사항
-------------------------------------
GROUP BY <속성>
주의 사항 :
    GROUP BY로 투플을 구릅으로 묶은 후 SELECT 절에는 GROUP BY에서 사용한 <속성>과 집계 함수만 나올 수 있다.
올바른 예 :
    SELECT      CUSTID, SUM(SALEPRICE) AS 도서수량
    FROM        ORDERS
    GROUP BY    CUSTID;
잘못된 예 :
    SELECT      BOOKID, SUM(SALEPRICE) AS 도서수량
    ※ SELECT 절에 BOOKID 속성이 올 수 없다.
    FROM        ORDERS
    GROUP BY    CUSTID;
-------------------------------------
HAVING <검색조건>
주의 사항 :
    WHERE 절과 HAVING 절이 같이 포함된 SQL 문은 검색조건이 모호해질 수 있다.
    HAVING 절은 ① 반드시 GROUP BY 절과 같이 작성해야한다.
    ② WHERE 절 보다 뒤에  나와야한다.
    ③ <검색조건>에는 SUM, AVG, MIN, MAX, COUNT와 같은 집계 함수가 와야 한다.
올바른 예 :
    SELECT      CUSTID, SUM(SALEPRICE) AS 도서수량
    FROM        ORDERS
    WHERE       SALEPRICE >= 8000
    GROUP BY    CUSTID
    HAVING      COUNT(*) >= 2;
잘못된 예 :
    SELECT      CUSTID, SUM(SALEPRICE) AS 도서수량
    FROM        ORDERS
    HAVING      COUNT(*) >= 2;
    WHERE       SALEPRICE >= 8000 <- 순서가 틀림 
    GROUP BY    CUSTID
*/