-- < LEFT OUTER JOIN, LEFT JOIN >
-- 1. 첫번째 테이블을 기준으로 두번째 테이블을 조합하는 JOIN
-- 테이블A JOIN 테이블B ON 조인조건
-- LEFT 테이블의 조건은 모두 출력이 됨!!
-- 조인 순서가 중요!
-- ON 조건을 불만족시; 테이블A 속성 값은 그대로 가져오고, 테이블B 속성 값은 NULL!

select * from authors;
select * from books;

INSERT INTO books VALUES (5, 'Lucky Day',null, '2023-03-01');

desc books;

-- inner join (books, authors)
select * from books inner join authors on books.author_id = authors.author_id;
-- books 테이블에 author_id가 NULL이었던 행은 제외되고 출력

-- LEFT JOIN(books, authors)
select * from books left join authors on books.author_id = authors.author_id;
-- books 테이블에 author_id가 NULL인 행이 있더라도 출력
select * from authors left join books on books.author_id = authors.author_id;
-- LEFT JOIN에는 순서가 존재함을 보여주는 예시

select * from authors right join books on books.author_id = authors.author_id;

-- < DCL >
-- Data Control Language
-- GRANT, REVOKE

-- 현재 root 사용자만 존재~
-- => 새로운 사용자(유저, 계정) 추가
-- create user [계정명]@[접속경로] identified by [비밀번호];
create user 'codee'@'localhost' identified by '1234';

-- 새로 생성한 사용자 확인;
select user from mysql.user; -- mysql.user : mysql db의 user table

-- < GRANT >
-- : 권한 부여
-- ex. codee2 사용자에게 모든 (데이터베이스의 모든 테이블에 모든) 권한 부여
-- 모든 데이터베이스의 모든 테이블: *.*
-- 모든 권한 부여: GRANT ALL PRIVILEGES
-- with grant option: 권한을 다른 사용자한테 부여 가능할 수 있는 옵션
-- root -> codee2
-- GRANT [권한 유형] ON [데이터베이스이름].[테이블이름]
-- 		to [계정명@접속경로] [with grant option]
grant all privileges on *.* to 'codee2'@'localhost' with grant option;

-- grant [권한 유형] on [데이터베이스이름].[테이블이름]
-- grant all privileges on [데이터베이스이름].*
-- => 특정 데이터베이스의 모든 테이블에 / 모든 권한 부여
-- grant all privileges on [데이터베이스이름].[테이블이름]
-- => 특정 데이터베이스의 특정 테이블에 / 모든 권한 부여
-- grant select on [데이터베이스이름].[테이블이름]
-- => 특정 데이터베이스의 특정 테이블에 / select 권한 부여

-- 계정 삭제
drop user 'codee2'@'localhost';
flush privileges;

CREATE USER 'codee2'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON new_smartfactory.* TO 'codee2'@'localhost' WITH GRANT OPTION;

alter user 'codee2'@'localhost' identified with mysql_native_password by '4321';

-- < REVOKE >
-- : 권한 박탈
-- revoke [권한 유형] on [데이터베이스이름].[테이블이름] from [계정명@접속경로];
revoke delete on *.* from 'codee2'@'localhost';
