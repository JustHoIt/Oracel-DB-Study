SELECT BOOKNAME, PUBLISHER, PRICE
FROM BOOK
WHERE BOOKNAME LIKE '축구의 역사';

SELECT  PHONE
FROM CUSTOMER
WHERE NAME= '김연아';
/*
SELECT  [ALL | DISTINCT] 속성이름(들)
FROM    테이블 이름(들)
[WHERE  검색조건(들)]
[GROUP BY 속성이름]
[HAVING     검색조건(들)]
[ORDER BY   속성이름[ASC|DESC]]
---------------------------------------------------
[ ] : 대괄호 안의 SQL 예약어들은 선택적으로 사용한다.
 |  : 선택 가능한 문법들 중 한 개를 사용할 수 있다..
*/
/*
SELECT
    [ALL | DISTINCT]
    [테이블 이름.]{* | 속성 이름[[AS] 속성 이름 별칭]}
[FROM
    {테이블 이름 [AS 테이블 이름 별칭]}
    [INNER JOIN | LEFT [OUTER] JOIN | RIGHT[OUTER] JOIN
    {테이블 이름[검색 조건]}
    |FULL [OUTER] JOIN {테이블 이름}]]
[WHERE 검색조건(들)]
[GROUP BY {속성이름, [..., n]}]
[HAVING 검색조건(들)]
[질의 UNION 질의 | 질의 UNION ALL 질의]
[ORDER BY {속성이름 [ASC | DESC],[..., n]}]
-----------------------------------------------------
[ ] : 대괄호 안의 SQL 예약어들은 선택적으로 사용한다.
{ } : 중괄호 안의 SQL 예약어들은 필수적으로 사용한다.
 |  : 선택 가능한 문법 중 한 개를 사용할 수 있다.

*/

