use new_smartfactory;

-- < CREATE >
-- 데이터베이스 생성
-- 한글 인코딩: 프로그래밍 언어는 영어 기반이므로 한글을 사용할 수 있도록!
create database new_smartfactory character set = utf8mb4 collate = utf8mb4_unicode_ci;

-- 테이블 생성
-- new_customer 테이블
-- custid(고객번호) CHAR(10), NOT NULL 제약조건, PK
-- custname(고객이름) VARCHAR(10), NOT NULL 제약조건
-- addr (주소) CHAR(10), NOT NULL 제약조건
-- phone (연락처) CHAR(11)
-- birth (생년월일) DATE

-- 1. 기본키 제약 조건
-- 기본키는 중복 불가능
-- NULL 불가능

create table new_customer(
	custid CHAR(10) primary key,
	custname VARCHAR(10) NOT NULL,
	addr CHAR(10) NOT NULL,
	phone CHAR(11),
	birth DATE
);
desc new_customer;
select * from new_customer;

-- 2. 외래키 제약조건
-- 두 테이븘 사이의 관계를 맺어줌 (=다른 테이블의 기본키를 현재 테이블의 외래키로 연결함)
-- 기본키를 갖는 테이블: "기준" 테이블
-- 외래키가 있는 테이블 : "참조" 테이블
-- 형식 : foreign key(열_이름) references 기준_테이블(열_이름)
-- ON UPDATE CASCADE: 기준 테이블의 데이터 변경시 -> 참조 테이블 데이터도 변경
-- ON DELETE CASCADE: 기준 테이블의 데이터 삭제시 -> 참조 테이블 데이터도 삭제
create table new_orders(
	orderid INT primary key auto_increment,
	custid CHAR(10) NOT NULL,
	prodname CHAR(6) NOT NULL,
	price INT NOT NULL,
	amount smallint NOT NULL,
    foreign key(custid) references new_customer(custid) ON UPDATE CASCADE ON DELETE CASCADE
);
desc new_orders;
select * from new_orders;

INSERT INTO new_customer VALUES ('kiwi', '김키위', '대한민국 서울', '01012341234', '1990-03-17');
INSERT INTO new_customer VALUES ('apple', '이사과', '대한민국 포항', '01012344321', '1992-06-17');
INSERT INTO new_orders VALUES (NULL, 'kiwi', '프링글스', '3000', 5);
INSERT INTO new_orders VALUES (NULL, 'apple', '프링글스', '3000', 1);
INSERT INTO new_orders VALUES (NULL, 'kiwi', '홈런볼', '2000', 3);

-- < ALTER >
select * from new_customer;

-- 속성 수정
-- (1) 속성의 데이터타입 수정
alter table new_customer modify nickname int;
-- 새로운 속성 추가
-- : 고객 테이블에 새로운 속성 'nickname'이 생겼음
alter table new_customer add nickname varchar(10);
-- (2) 속성명 변경
alter table new_customer change nickname n_name varchar(10);

-- 기존 속성 삭제
alter table new_customer drop n_name;

-- < DROP >
-- new_customer 테이블과 new_orders 테이블을 custid를 기준으로 pk-fk 관계맺고 있음
-- 즉, new_customer 테이블에 동록된 고객만 new_customer 테이블에 들어갈 수 있음
-- 만약, new_orders 테이블이 있는데 new_customer 테이블을 DROP 한다면?
-- new_orders 에서 특정 고객의 정보를 확인하고 싶어도, 이미 new_customer 테이블이 삭제되어 알 수 없음
-- pk-fk 관계로 연결된 테이블은 "외래키가 설정된 테이블"을 먼저 삭제해야 함.

-- new_customer 테이블 (기준 테이블, 기본키 테이블) -> (2) 나중 삭제
-- new_orders 테이블 (참조 테이블, 외래키 테이블) -> (1) 먼저 삭제