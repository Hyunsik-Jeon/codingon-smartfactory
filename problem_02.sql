create table new_user(
	id varchar(10) primary key,
	pw varCHAR(20) NOT NULL,
	name CHAR(5) NOT NULL,
	gender date,
	birthday date NOT NULL,
    age int not null
);

desc new_user;
ALTER TABLE new_user MODIFY gender char(1);