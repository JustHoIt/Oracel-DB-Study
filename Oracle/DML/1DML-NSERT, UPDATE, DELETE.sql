--데이터 조작어(삽입, 수정, 삭제) - DML(Data Manipulation Language)

--1. INSERT
/* INSERT 문법
   INSERT INTO $테이블이름[(속성리스트)]
    VALUES (값리스트)
   */
-- Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 90,000원이다.
INSERT INTO Book(bookid, bookname, publisher, price)
VALUES (11, '스포츠의학', '한솔의학서적', 90000);

-- 새로운 투플을 삽입할때 아래처럼 속성의 이름은 생략할 수 있다. 단 데이터의 입력순서는 속성의 순서와 일치해야한다.
INSERT INTO Book
VALUES (12, '스포츠의학', '한솔의학서적', 9000);

--데이터는 항상 속서의 순서대로 입력하지 않아도 된다. 만약 price를 먼저 입력하고 싶다면 속성의 이름과 데이터 순서를 바꿔서 입력하면 된다.
INSERT INTO Book(price, bookid, bookname, publisher)
VALUES (90000, 13, '스포츠의학', '한솔의학서적');

-- INSERT 문은 SELECT 문을 사용하여 작성할 수 있다. 한꺼번에 여러 개의 투플을 삽입하는 방법을 대량삽입(Bulk insert)라고도 한다.
-- Imported_book 이라는 테이블을 조회 후 Book 테이블에 삽입하려면 아래처럼 하면된다. 단. 두 테이블에는 같은 타입의 데이터가 저장되어 있어야한다.

SELECT *
FROM BOOK;

INSERT INTO BOOK(bookid, bookname, publisher, price)
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM IMPORTED_BOOK;
-- zen golf, soccer skills라는 책이 추가 됨

--2. UPDATE
/* UPDATE문법
   UPDATE $테이블명$
   SET 속성이름 1 = 값 1[, 속성이름 2 = 값 2, ...]
   [WHERE <검색조건>];
   */

--Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
UPDATE CUSTOMER
SET ADDRESS = '대한민국 부산'
WHERE CUSTID = 5;

SELECT *
FROM CUSTOMER;

--Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오
-- WHERE 절에서 조건을 제대로 설정하지않으면 모든데이터가 변경되니 조심하기!!
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS
               FROM CUSTOMER
               WHERE NAME = '김연아')
WHERE NAME = '박세리';

-- 3. DELETE
/* DELETE 문법
   DELETE FROM $테이블명$
   [WHERE 검색조건];
*/

-- Customer에서 custid(고객번호)가 5인 사람을 삭제하기
DELETE
FROM CUSTOMER
WHERE CUSTID = 5;

--모든 고객을 삭제하시오(그러나, Orders 테이블에서 참조중이므로 제약을 해제되지 않으면 삭제 되지않는다.)
DELETE
FROM CUSTOMER;

-- 되돌리기
ROLLBACK;
-- 저장하기
COMMIT;
