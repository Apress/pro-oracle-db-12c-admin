CREATE TABLE dept
(deptno     NUMBER(10)
,dname      VARCHAR2(14 CHAR)
,loc        VARCHAR2(14 CHAR)
,CONSTRAINT dept_pk PRIMARY KEY (deptno)
 USING INDEX TABLESPACE hr_index
) TABLESPACE hr_data;
--
COMMENT ON TABLE dept IS 'Department table';
--
CREATE UNIQUE INDEX dept_uk1 ON dept(dname)
TABLESPACE hr_index;
--
CREATE TABLE emp
(empno      NUMBER(10)
,ename      VARCHAR2(10 CHAR)
,job        VARCHAR2(9 CHAR)
,mgr        NUMBER(4)
,hiredate   DATE
,sal        NUMBER(7,2)
,comm       NUMBER(7,2)
,deptno     NUMBER(10)
,CONSTRAINT emp_pk PRIMARY KEY (empno)
 USING INDEX TABLESPACE hr_index
) TABLESPACE hr_data;
--
COMMENT ON TABLE emp IS 'Employee table';
--
ALTER TABLE emp ADD CONSTRAINT emp_fk1
FOREIGN KEY (deptno)
REFERENCES dept(deptno);
--
CREATE INDEX emp_fk1 ON emp(deptno)
TABLESPACE hr_index;

