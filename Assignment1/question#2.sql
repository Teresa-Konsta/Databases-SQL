CREATE TABLE CATEGORY
(CatCode varchar2(2),
CatDesc varchar2(10)
);

CREATE TABLE EMPLOYEES
(Emp# number(5),
Lastname varchar2(15),
Firstname varchar2(15),
Job_class varchar2(4) NOT NULL
);

ALTER TABLE EMPLOYEES ADD EmpDate DATE --! GETDATE() method gave error

ALTER TABLE EMPLOYEES ADD EndDate DATE

ALTER TABLE EMPLOYEES MODIFY Job_class varchar2(2)

ALTER TABLE EMPLOYEES DROP COLUMN EndDate

ALTER TABLE EMPLOYEES
RENAME TO JL_EMPS;

CREATE TABLE BOOKS
(ISBN varchar2(15) UNIQUE, 
Cost number(3, 2), 
Retail varchar2(15), 
Category varchar2(15)
);

ALTER TABLE BOOKS
RENAME TO BOOK_PRICING;

ALTER TABLE BOOK_PRICING
DROP COLUMN Category

INSERT INTO BOOK_PRICING
VALUES ('123456789', '123,45', 'null');

TRUNCATE TABLE BOOK_PRICING

DELETE TABLE BOOK_PRICING
COMMIT