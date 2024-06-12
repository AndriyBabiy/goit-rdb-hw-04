CREATE SCHEMA LibraryManagement

USE LibraryManagement

CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(255)
)

INSERT INTO authors (author_name) VALUES 
	('J.K. Rowling'),
	('George R.R. Martin'),
	('J.R.R. Tolkien'),
	('Agatha Christie'),
	('Stephen King')

CREATE TABLE genres (
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
	genre_name VARCHAR(255)
)

INSERT INTO genres (genre_name) VALUES
	('Fantasy'),
	('Science Fiction'),
	('Mystery'),
	('Thriller'),
	('Horror')

CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255),
	publication_year YEAR,
	author_id INT,
	genre_id INT,
	FOREIGN KEY (author_id) REFERENCES authors(author_id),
	FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
)

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
 ('Harry Potter', 2002, 1, 1),
 ('Game of Thrones', 2003, 2, 1),
 ('Lord of the Rings', 2010, 3, 1)

CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255),
	email VARCHAR(255)
)

INSERT INTO users (username, email) VALUES 
	('bob123', 'bob12345@email.com'),
	('jane_d', 'janedoe@example.com'),
	('jim_smith5', 'jhon-smith@mail.com')

CREATE TABLE borrowed_books (
	borrow_id INT AUTO_INCREMENT PRIMARY KEY,
	book_id INT,
	user_id INT,
	borrow_date DATE,
	return_date DATE,
	FOREIGN KEY (book_id) REFERENCES books(book_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
)

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
	(1, 3, '2024-01-01', '2024-02-03'),
	(2, 2, '2024-04-01', '2024-06-10'),
	(3, 3, '2024-02-03', '2024-04-10')
