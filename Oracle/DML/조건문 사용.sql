/*
조건 검색
비교  [ =, <>, >, <=, >, >= ] ex) price < 20000
범위  [ BETWEEN ] ex) price BETWEEN 10000 and 20000
집합  [ IN, NOT IN] ex) price IN(10000, 20000, 30000)
패턴  [ LIKE ] ex) bookname LIKE'축구의 역사'
NULL    [IS NULL, IS NOT NULL] ex) price IS NULL
복합조건    [AND, OR, NOT] ex) (price < 20000) AND (bookname LIKE'축구의 역사')
---------------------------------------------------------------------------
*/

/* 모든 도서의 이름과 가격 검색하기 (SELECT, FROM)*/
SELECT BOOKNAME, PRICE
FROM BOOK;

/*모든 도서의 도서번호, 도서 이름, 출판사, 가격 검색*/
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM BOOK;

SELECT *
FROM BOOK;

/*도서 테이블에 있는 모든 출판사 검색*/
SELECT  PUBLISHER
FROM BOOK;

/*중복 제거하기*/
SELECT DISTINCT PUBLISHER
FROM BOOK;

/*20000원 미만인 도서 검색*/
SELECT *
FROM BOOK
WHERE PRICE < 20000;

/*10000원 이상 20000이하인 도서 검색*/

SELECT *
FROM BOOK
WHERE PRICE <= 20000 AND PRICE >= 10000;

SELECT *
FROM BOOK
WHERE PRICE between 10000 AND 20000;

/*출판사가 '굿스포츠'혹은 '대한미디어'가 아닌 책 검색(NOT IN())*/
SELECT  *
FROM  BOOK
WHERE PUBLISHER NOT IN('굿스포츠','대한미디어');

/*축구의 역사를 출간한 출판사 검색*/
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '축구의 역사';

/*도서이름에 '축구'가 포함된 출판사 검색(%단어%)*/
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '%축구%';

/*도서이름의 두 번째 위치에 있는 '구' 라는 문자열을 갖는 도서 검색('_구%')*/
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '_구%';

/* 축구라는 단어가 포함되며 20000원 이상인 책 검색*/
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '%축구%' AND PRICE >= 20000;

/*출판사가 '굿스포츠' 혹은 '대한미디어'인 책 검색*/
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE PUBLISHER LIKE '굿스포츠' OR PUBLISHER = '대한미디어';

