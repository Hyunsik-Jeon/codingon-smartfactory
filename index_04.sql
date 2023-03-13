-- DML: SELECT, INSERT, UPDATE, DELETE

USE new_smartfactory;
SELECT * FROM new_customer;
SELECT * FROM new_orders;
DESC new_customer;


-- < INSERT > 
-- 1) 첫번째 방법: 긴 명령어 버전
INSERT INTO new_customer (custid, custname, addr, phone, birth) 
	VALUES ('lucky', '강해원', '미국 뉴욕', '01022223333', '2002-03-05');

-- 속성 순서를 바꿔서 추가하고 싶다면요? 
-- 순서 바꿀 수 있음! 단, 속성명과 속성값 순서가 차례대로 대응되어야 함
INSERT INTO new_customer (birth, custid, custname, addr, phone) 
	VALUES ('2007-04-28', 'wow', '이지은', '대한민국 부산', '01098765432');

-- 2) 두번째 방법: 짧은 명령어 버전
INSERT INTO new_customer VALUES ('happy', '최시은', '일본 오키나와', '01033331234', '1970-10-31');

-- 여러 고객 정보를 동시에 추가하고 싶으면 INSERT 문을 여러번 작성하면 되겠네요? 
-- YES 그러나 더 간편한 방법이 있음!
INSERT INTO new_customer VALUES 
	('asdf', '강세희', '대한민국 부산', '01033331235', '2004-11-11'),
	('sdfg', '윤지성', '일본 도쿄', '01033331236', '1995-02-15'),
    ('dfgh', '이재은', '미국 뉴욕', '01033331237', '2004-06-07');


-- < UPDATE >
UPDATE new_customer SET addr = '대한민국 서울' WHERE custid = 'apple';
UPDATE new_customer SET addr = '대한민국 서울' WHERE custid LIKE '%y';

DESC new_customer;
SET sql_safe_updates=0;


-- < DELETE >
DELETE FROM new_customer WHERE custid = 'happy'; 

-- 외래키 연결되어 있는 경우, 연쇄 삭제
DELETE FROM new_customer WHERE custid = 'kiwi';

SELECT * FROM new_orders;
SELECT * FROM new_customer;