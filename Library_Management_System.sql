CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY,
    Publisher_Name VARCHAR(100) NOT NULL UNIQUE,
    Contact VARCHAR(100)
);

CREATE TABLE Author (
    Author_ID INT PRIMARY KEY,
    Author_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Librarian (
    Librarian_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Member (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200),
    Join_Date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Publication_Year INT CHECK (Publication_Year BETWEEN 1000 AND 2100),
    Copies INT NOT NULL DEFAULT 1 CHECK (Copies >= 0),
    Category_ID INT NOT NULL,
    Publisher_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Book_Author (
    Book_ID INT NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
);

CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Book_ID INT NOT NULL,
    Member_ID INT NOT NULL,
    Librarian_ID INT NOT NULL,
    Issue_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    CHECK (Due_Date >= Issue_Date),
    CHECK (Return_Date IS NULL OR Return_Date >= Issue_Date),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Librarian_ID) REFERENCES Librarian(Librarian_ID)
);
-- 1. Category
INSERT INTO Category VALUES
(1,'Programming'),
(2,'Database'),
(3,'Artificial Intelligence'),
(4,'Networks'),
(5,'Mathematics');

-- 2. Publisher
INSERT INTO Publisher VALUES
(1,'Pearson','contact@pearson.com'),
(2,'McGraw Hill','contact@mheducation.com'),
(3,'OReilly Media','contact@oreilly.com'),
(4,'Wiley','contact@wiley.com'),
(5,'Springer','contact@springer.com');

-- 3. Author
INSERT INTO Author VALUES
(1,'Herbert Schildt'),
(2,'Ramez Elmasri'),
(3,'Stuart Russell'),
(4,'Andrew S. Tanenbaum'),
(5,'Thomas H. Cormen');

-- 4. Librarian
INSERT INTO Librarian VALUES
(1,'Anita Rao','9000000001','anita@library.com'),
(2,'Kiran Kumar','9000000002','kiran@library.com');

-- 5. Member
INSERT INTO Member VALUES
(1,'Rahul','9100000001','rahul@gmail.com','Kakinada','2026-06-01'),
(2,'Priya','9100000002','priya@gmail.com','Rajahmundry','2026-06-03'),
(3,'Arjun','9100000003','arjun@gmail.com','Surampalem','2026-06-05'),
(4,'Sneha','9100000004','sneha@gmail.com','Vijayawada','2026-06-08'),
(5,'Vijay','9100000005','vijay@gmail.com','Visakhapatnam','2026-06-10');

-- 6. Book
INSERT INTO Book VALUES
(1,'C Programming','9781111111111',2020,4,1,1),
(2,'Database Systems','9782222222222',2021,3,2,2),
(3,'Artificial Intelligence','9783333333333',2022,5,3,3),
(4,'Computer Networks','9784444444444',2021,2,4,4),
(5,'Algorithms','9785555555555',2023,4,1,5);

-- 7. Book_Author
INSERT INTO Book_Author VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

-- 8. Loan
INSERT INTO Loan VALUES
(1,1,1,1,'2026-09-01','2026-09-15','2026-09-10'),
(2,2,2,1,'2026-09-03','2026-09-17',NULL),
(3,3,3,2,'2026-09-05','2026-09-19','2026-09-18'),
(4,4,4,2,'2026-09-08','2026-09-22',NULL),
(5,5,5,1,'2026-09-10','2026-09-24',NULL);