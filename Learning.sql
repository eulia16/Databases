CREATE TABLE department(dname varchar(20));

CREATE TABLE dept_locations(
Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY(Dnumber,Dlocation));

CREATE TABLE project(
pname varchar(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY(Pnumber),
UNIQUE(Pname));

CREATE TABLE sys.works_on(
Essn CHAR(9) NOT NULL,
pno INT NOT NULL,
Hours Decimal(3,1) NOT NULL,
PRIMARY KEY(Essn, pno) );


