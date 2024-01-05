-- 데이터 정의어-DDL(Data Definition Language)
-- 2. ALTER
/*ALTER 문법
  ALTER TABLE $테이블명$
  [ADD 속성이름 데이터 타입]
  [DROP COLUMN 속성이름]
  [ALTER COLUMN 속성이름 데이터타입]
  [ALTER COLUMN 속성이름 [NULL | NOT NULL]]
  [ADD PRIMARY KEY(속성이름)]
  [[ADD | DROP] 제약이름]
  */
-- 실습전 NewBook 테이블 생성하기
-- NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가 하시오.
ALTER TABLE NewBooK
    ADD isbn VARCHAR2(13);

-- NewBook 테이블에 isbn 속성의 데티 타입을 NUMBER 형으로 변경하시오
ALTER TABLE NewBooK
    MODIFY isbn NUMBER;

-- NewBook 테이블에 isbn 속성을 삭제하시오
ALTER TABLE NewBook
    DROP COLUMN isbn;

-- NewBook 테이블 중 bookid 속성에 NOT NULL 제약조건을 적용하시오
ALTER TABLE NewBook
    MODIFY bookid NUMBER NOT NULL;

-- NewBook 테이블의 bookid  속성을 기본키로 변경하시오.
ALTER TABLE NewBook
    ADD PRIMARY KEY (bookid);

-- 3. DROP
/* DROP 문법
   DROP TABLE $테이블명$
*/
-- NewBook 테이블을 삭제하시오.
DROP TABLE NEWBOOK;

-- NewCustomer 테이블을 삭제하시오. 만약 테이블 삭제가 거절된다면 원인을 파악하고 삭제하기 (NewOrders 테이블이 NewCustomer를 참조하고 있기때문에 삭제가 안됨)
DROP TABLE NewOrders;
DROP TABLE NewCustomer;

