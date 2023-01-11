drop table BookCategory;
drop table book;
drop table Student;
drop table BookBorrow;

create table BookCategory(book_catg_id number, book_catg_name varchar(20));
desc BookCategory;

create table Book(book_id number, book_name varchar(20), author_id number, publisher varchar(20), branch_id number);
desc book;

create table Student(u_id varchar(10) primary key, sname varchar(20), address varchar(20), branch_id number, sem varchar(10));
desc Student;

create table BookBorrow(u_id varchar(10), book_id number, borrow_date varchar(10));
desc bookborrow;


Insert into BookCategory values(111, 'FICTION');
Insert into BookCategory values(102, 'SCIENCE');
Insert into BookCategory values(101, 'POLITICS');

Insert into Book values(201, 'OSWAL', 981, 'DR. KARTIK', 1);
Insert into Book values(211, 'NCERT', 971, 'DR. KANG', 2);
Insert into Book values(221, 'FROG AND TOTOISE', 951, 'DR. SHAAN', 3);


insert into Student values('9403', 'prashant', 'Meerut', 1, '1st');
insert into Student values('9360', 'Kartik', 'Modinagar', 2, '2nd');
insert into Student values('9400', 'abc', 'Delhi', 3, '1st');


insert into BookBorrow values('9403', 201, '2021-08-22');
insert into BookBorrow values('9360', 211, '2021-05-24');
insert into BookBorrow values('9400', 221, '2021-03-23');


-- Fetch Student’s id, name along with book id and book borrow id (student name with book id borrowed by the student).

select s.u_id, s.sname, b.book_id, bb.borrow_date from Student s, BookBorrow bb, Book b where s.u_id = bb.u_id and b.book_id = bb.book_id;

-- Fetch Book name with their Category.

select b.book_name, bc.book_catg_name from Book b, BookCategory bc where b.book_id = bc.book_catg_id;

-- Fetch student name, book name and book borrow id (the books borrowed by the student

select s.sname, b.book_name, bb.borrow_date from Student s, BookBorrow bb, Book b where s.u_id = bb.u_id and b.book_id = bb.book_id;

-- Fetch student name, book name, book category and book borrow id (the books with their category name, borrowed by the student).

select s.sname, b.book_name, bc.book_catg_name, bb.borrow_date from Student s, BookBorrow bb, Book b, BookCategory bc where s.u_id = bb.u_id and b.book_id = bb.book_id and b.book_id = bc.book_catg_id;

-- Count of books borrowed by student id

select s.u_id, count(b.book_id) from Student s, BookBorrow bb, Book b where s.u_id = bb.u_id and b.book_id = bb.book_id group by s.u_id;

-- Fetch book count against each book category

select bc.book_catg_name, count(b.book_id) from BookCategory bc, Book b where b.book_id = bc.book_catg_id group by bc.book_catg_name;

-- Fetch students name with their book borrows count.

select s.sname, count(b.book_id) from Student s, BookBorrow bb, Book b where s.u_id = bb.u_id and b.book_id = bb.book_id group by s.sname;

-- Fetch Student id who has borrowed at least 1 book

select s.u_id from Student s, BookBorrow bb, Book b where s.u_id = bb.u_id and b.book_id = bb.book_id;

-- Fetch book’s categories list containing more than 1 books

select bc.book_catg_name from BookCategory bc, Book b where b.book_id = bc.book_catg_id group by bc.book_catg_name having count(b.book_id) > 1;

-- Fetch student who has not borrowed any book(using not exists)

select s.u_id from Student s where not exists (select * from BookBorrow bb where s.u_id = bb.u_id);

-- Fetch student borrow book in different Category Count

select s.u_id, count(b.book_id) from Student s, BookBorrow bb, Book b, BookCategory bc where s.u_id = bb.u_id and b.book_id = bb.book_id and b.book_id = bc.book_catg_id group by s.u_id;

-- Fetch Student borrowed book in more than 1 categories

select s.u_id from Student s, BookBorrow bb, Book b, BookCategory bc where s.u_id = bb.u_id and b.book_id = bb.book_id and b.book_id = bc.book_catg_id group by s.u_id having count(b.book_id) > 1;

-- Fetch Student borrow book in different Category Name concatenated

select s.u_id, group_concat(bc.book_catg_name) from Student s, BookBorrow bb, Book b, BookCategory bc where s.u_id = bb.u_id and b.book_id = bb.book_id and b.book_id = bc.book_catg_id group by s.u_id;


