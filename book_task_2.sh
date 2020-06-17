#!/bin/bash
psql -U postgres -h localhost << EOF

CREATE TABLE Book(BookID integer UNIQUE,Title text NOT NULL,Author text NOT NULL,AuthorID integer,AuthorBio text,Authors text,title_slug text,author_slug text,isbn13 BIGINT,isbn10 text,price text,format text,publisher text,pubdate text,edition text,subjects text,lexile text,pages integer,dimensions text,overview text,excerpt text,synopsis text,toc text,editorial_reviews text);

COPY book FROM PROGRAM 'curl "https://www.usabledatabases.com/database/books-isbn-covers/sample/files/book.csv"' HEADER CSV DELIMITER ',';

SELECT BookId FROM book;

CREATE TABLE Author(AuthorID integer,Author text NOT NULL,AuthorBio text,title_slug text);


INSERT INTO Author (AuthorID , Author , AuthorBio ,title_slug )
SELECT AuthorID ,Author ,AuthorBio ,title_slug
FROM book;

SELECT AuthorID FROM Author;

CREATE TABLE Book_Author(AuthorID integer,Author text NOT NULL,BookID integer);

INSERT INTO Book_Author (AuthorID , Author,BookID)
SELECT AuthorID , Author, BookID
FROM book;

SELECT Author FROM Book_Author;

CREATE TABLE Subject(subjects text,title_slug text);

INSERT INTO Subject (subjects,title_slug)
SELECT subjects, title_slug
FROM book;

SELECT subjects FROM Subject;

EOF

#DROP TABLE Book;
#DROP TABLE Author;
#DROP TABLE Book_Author;
#DROP TABLE Subject;
