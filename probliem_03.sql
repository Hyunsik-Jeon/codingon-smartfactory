create table authors(
	author_id int primary key,
	first_name VARCHAR(50),
	last_name varCHAR(50),
	email varCHAR(50)
    );
    

select * from authors;

INSERT INTO authors VALUES 
	(1, 'J.K.', 'Rowling', 'jkrowling@gmail.com'),
	(2, 'George R.R.', 'Martin', 'grmartin@yahoo.com'),
    (3, 'Stephen', 'King', 'sking@hotmail.com');

create table books(
	book_id int primary key,
	title VARCHAR(100),
	author_id int,
	publication_date date,
    foreign key(author_id) references authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
select * from books;

INSERT INTO books VALUES 
	(1, 'Harry Potter and the Philosopher''s Stone', 1, '1997-06-26'),
	(2, 'A Game of Thones', 2, '1996-08-06'),
    (3, 'The Shining', 3, '1977-01-28');
    
create table orders(
	order_id int primary key,
	book_id int,
	customer_name varchar(50),
	order_date date,
    foreign key(book_id) references books(book_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
INSERT INTO orders VALUES 
	(1, 1, 'John Smith', '2022-02-15'),
	(2, 2, 'Jane Doe', '2022-02-16'),
    (3, 3, 'Bob Johnson', '2022-02-17');
    
select * from orders;

UPDATE authors SET email = 'jkrowling@yahoo.com' WHERE author_id = 1;
select * from authors;

DELETE FROM books WHERE book_id = 2;
select * from books;

INSERT INTO books VALUES (4, '스탠드', 3, '1978-01-01');
select * from books;

UPDATE books SET publication_date = '1997-06-30' WHERE book_id = 1;
select * from books;

set sql_safe_updates=0;
DELETE FROM orders WHERE order_date < '2022-02-17';
select * from orders;

INSERT INTO orders VALUES (4, 1, '사라 존슨', '2022-02-18');
select * from orders;

UPDATE orders SET customer_name = 'Jack Smith' WHERE order_id = 1;
select * from orders;

INSERT INTO authors VALUES (4, '아가사', '크리스티', 'agatha.christie@example.com');
select * from authors;

UPDATE authors SET last_name = 'Martinez' WHERE author_id = 2;
select * from authors;

delete from books where author_id =3;
select * from books;