DROP SEQENCE MYNOSEQ;
DROP TABLE MYBOARD;

CREATE SEQUENCE MYNOSEQ;
CREATE TABLE MYBOARD(
   MYNO NUMBER PRIMARY KEY,
   MYNAME VARCHAR2(1000) NOT NULL,
   MYTITLE VARCHAR2(2000) NOT NULL,
   MYCONTENT VARCHAR2(4000) NOT NULL,
   MYDATE DATE NOT NULL
);

INSERT INTO MYBOARD VALUES(MYNOSEQ.NEXTVAL,'관리자','스프링 테스트','Spring mvc',SYSDATE);
SELECT *FROM MYBOARD ORDER BY MYNO DESC;



-------------------------------------------------------
DROP SEQUENXE MEMBERSEQ;
DROP TABLE MYMEMBER;

CREATE SEQUENCE MEMBERSEQ;
CREATE TABLE MYMEMBER(
     MEMBERNO NUMBER PRIMARY KEY,
     MEMBERID VARCHAR2(1000) NOT NULL,
     MEMBERPW VARCHAR2(1000) NOT NULL,
     MEMBERNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO MYMEMBER VALUES(MEMBERSEQ.NEXTVAL, 'admin','1234','관리자');

SELECT*FROM MYMEMBER;
