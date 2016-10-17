create table books
(book_id number,
 book_desc varchar2(30));
--
1|RMAN Recipes
2|Linux for DBAs
3|SQL Recipes
--
load data
INFILE 'books.dat'
INTO TABLE books
APPEND
FIELDS TERMINATED BY '|'
(book_id,
 book_desc)

