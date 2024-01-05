-- 데이터 정의어-DDL(Data Definition Language)
-- 1. CREATE
/*
-- CREATE 문법
CREATE TABLE $테이블명$
(   { $속성이름$ DataType
        [NULL | NOT NULL | UNIQUE | DEFAULT 기본값 | CHECK 체크 초건]
    }
        [PRIMARY KEY 속성이름(들)]
        [FOREIGN KEY 속성이름 REFERENCES 테이블이름(속성이름)]
            [ON DELETE {CASCADE | SET NULL}]
    )
*/

-- 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오
-- bookid(도서번호) - NUMBER
-- bookname(도서이름) - VARCHAR2(20)
-- publisher(출판사) - VARCHAR2(20)
-- price(가격) - VARCHAR2(20)

CREATE TABLE NewBook
(
    bookid    NUMBER PRIMARY KEY,
    bookname  VARCHAR2(20),
    publisher VARCHAR2(20),
    price     VARCHAR2(20)
);
/*
-- CHAR(n), VARCHAR(n), VARCHAR2(n)의 차이
CHAR(n) - n 바이트를 가진 문자형 타입. 저장되는 문자의 길이가 n보다 작으면 나머지는 공백으로 채워서 n 바이트를 만들어 저장한다.
VARCHAR2(n) - VARCHAR2도 마찬가지로 n 바이트를 가진 문자형 타입이지만 저장되는 문자의 길이만큼만 기억장소를 차지하는 가변형이다.
VARCHAR 와 VARCHAR@ 타입은 같지만 오라클에서는 미래에 다른 용도로 사용 하기 위하여 사용자에게 VARCHAR2를 권하고 있다.
*/


-- 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
-- custid(고객번호) - NUMBER, 기본키
-- name(이름) - VARCHAR2(40)
-- address(주소) - VARCHAR2(40)
-- phone(전화번호) - VARCHAR2(30)

CREATE TABLE NewCustomer
(
    custid  NUMBER,
    name    VARCHAR2(40),
    address VARCHAR2(40),
    phone   VARCHAR2(30),
    PRIMARY KEY (custid)
);

-- 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오
-- orderid(주문번호) - NUMBER, 기본키
-- custid(고객번호) - NUMBER, NOT NULL 제약 조건, 외래키(NewCustomer.custid. 연쇄삭제)
-- bookid(도서번호) - NUMBER, NOT NULL 제약 조건
-- saleprice(판매가격) - NUMBER
-- orderdate(판매일자) - DATE

CREATE TABLE NewOrders
(
    orderid   NUMBER,
    custid    NUMBER NOT NULL,
    bookid    NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES NewCustomer (custid) ON DELETE CASCADE
);

