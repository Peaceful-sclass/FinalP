DROP SEQUENCE CONTESTSEQ;
CREATE SEQUENCE CONTESTSEQ;

DROP TABLE CONTEST;
CREATE table contest(
    CONTESTNUM NUMBER PRIMARY KEY,
    CONTESTNAME VARCHAR2(50) NOT NULL,
    CONTESTAGENT VARCHAR2(50) NOT NULL,
    CONTESTSUPERVISION VARCHAR2(50),
    CONTESUPPORT VARCHAR2(50),
    CONTESTFIELD VARCHAR2(100) NOT NULL,
    CONTESTTARGET VARCHAR2(100) NOT NULL,
    CONTESTCOMPANY VARCHAR2(100) NOT NULL,
    CONTESTREWARD VARCHAR2(100) NOT NULL, 
    CONTESTSTART VARCHAR2(200) NOT NULL,
    CONTESTEND VARCHAR2(200) NOT NULL,
    CONTESTCONTENT LONG NOT NULL,
    CONTESTPOSTER VARCHAR2(200),
    CONTESTSVAEFILENAME VARCHAR2(200),
    CONTESTORIFILENAME VARCHAR2(200),  
    CONTESTPAGE VARCHAR2(200),
    CONTESTPERSON VARCHAR2(200) NOT NULL,
    CONTESTPHONE VARCHAR2(200) NOT NULL,
    CONTESTEMAIL VARCHAR2(200) NOT NULL,	
    MEMBERNO NUMBER NOT NULL
);

ALTER TABLE CONTEST
ADD CONSTRAINTS FK_CONTEST_MNO FOREIGN KEY (MEMBERNO)
REFERENCES MYMEMBER(MEMBER_NO) ON DELETE CASCADE;