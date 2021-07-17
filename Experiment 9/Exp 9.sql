DROP TABLE IF EXISTS Employee;
DROP PROCEDURE IF EXISTS myproc;
DROP PROCEDURE IF EXISTS myinputproc;
DROP PROCEDURE IF EXISTS myoutproc;
DROP PROCEDURE IF EXISTS myinoutproc;

CREATE TABLE Employee(eid INT, ename VARCHAR(20), salary INT);
INSERT INTO Employee VALUES(101, 'Vaishnavi', 50000);
INSERT INTO Employee VALUES(102, 'Pooja', 60000);
INSERT INTO Employee VALUES(103, 'Tejaswini', 70000);
INSERT INTO Employee VALUES(104, 'Bharani', 80000);
INSERT INTO Employee VALUES(105, 'Aparna', 90000);
INSERT INTO Employee VALUES(106, 'Sanjana', 50000);
INSERT INTO Employee VALUES(107, 'Shivani', 90000);
INSERT INTO Employee VALUES(108, 'Srilaxmi', 40000);
SELECT * FROM Employee;

delimiter //

CREATE PROCEDURE myproc()

BEGIN
Select * from Employee where ename like 's%';
END;

CALL myproc();//

delimiter //
CREATE PROCEDURE myinputproc(IN salarytocompare REAL)
BEGIN
Select * from Employee where salary < salarytocompare;
END;
CALL myinputproc(80000);//

delimiter //
CREATE PROCEDURE myoutproc(OUT countofemp int)
BEGIN
SELECT COUNT(*) INTO countofemp from Employee where salary > 80000;
END;
CALL myoutproc(@a);//  
SELECT @a;// 

delimiter //
CREATE PROCEDURE myinoutproc(IN salarytocompare REAL,OUT countofemp int)
BEGIN
Select COUNT(*) INTO countofemp from Employee where salary > salarytocompare;
END;
Call myinoutproc(70000,@cnt);//
Select @cnt;//                                                                                                 
