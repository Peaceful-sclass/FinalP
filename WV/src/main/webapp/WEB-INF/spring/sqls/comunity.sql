
------------------------------------------------------------
--임시회원
DROP SEQUENCE MEMBERSEQ;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE SEQUENCE MEMBERSEQ;
CREATE TABLE MEMBER(
     MEMBERNO NUMBER PRIMARY KEY,
     MEMBERID VARCHAR2(1000) NOT NULL,
     MEMBERPW VARCHAR2(1000) NOT NULL,
     MEMBERNAME VARCHAR2(1000) NOT NULL
);

INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL, 'admin','1234','관리자');

SELECT*FROM MEMBER;

----------------------------------------------------------------------------------------
--커뮤니티
DROP SEQUENCE comunitySEQ;
DROP TABLE comunity CASCADE CONSTRAINTS;

CREATE SEQUENCE ComunitySEQ;
CREATE TABLE Comunity (
	CNO			number		NOT NULL,
	CATEGORY	varchar2(20)		NOT NULL,
	TITLE		varchar2(255)		NOT NULL,
	CONTENT		varchar2(4000)		NULL,
	REGDATE		date		NOT NULL,
	MEMBERNO	number		NOT NULL
);
--COMMENT ON COLUMN Comunity.CATEGORY IS '자유/Q&A/의뢰';
ALTER TABLE Comunity ADD CONSTRAINT PK_COMUNITY PRIMARY KEY (CNO);
ALTER TABLE Comunity ADD CONSTRAINT FK_Member_TO_Comunity_1 FOREIGN KEY (MEMBERNO) REFERENCES Member(MEMBERNO);


------------------------------------------------------------------------------
--커뮤니티 댓글
DROP SEQUENCE ComuCommentSEQ;
DROP TABLE ComuComment CASCADE CONSTRAINTS;

CREATE SEQUENCE ComuCommentSEQ;
CREATE TABLE ComuComment (
	ComuCommentNO	number		NOT NULL,
	COMMENT			varchar2(2000)		NOT NULL,
	REGDATE			date		NOT NULL,
	CNO				number		NOT NULL,
	MEMBERNO		number		NOT NULL
);

ALTER TABLE ComuComment ADD CONSTRAINT PK_COMUCOMMENT PRIMARY KEY (ComuCommentNO);
ALTER TABLE ComuComment ADD CONSTRAINT FK_Comunity_TO_ComuComment_1 FOREIGN KEY (CNO) REFERENCES Comunity (CNO);
ALTER TABLE ComuComment ADD CONSTRAINT FK_Member_TO_ComuComment_1 FOREIGN KEY (MEMBERNO) REFERENCES Member (MEMBERNO);


---------------------------------------------------------------------------------------------	
--의뢰
DROP SEQUENCE OutSourcingSEQ;
DROP TABLE OutSourcing CASCADE CONSTRAINTS;

CREATE SEQUENCE OutSourcingSEQ;
CREATE TABLE OutSourcing (
	OUTNO		number		NOT NULL,
	CATEGORY	varchar2(20)		NOT NULL,
	TITLE		varchar2(155)		NOT NULL,
	CONTENT		varchar2(4000)		NOT NULL,
	ENROLL		boolean		NOT NULL,
	TEAMNO		number		NOT NULL,
	REGDATE		date		NOT NULL
);

--COMMENT ON COLUMN OutSourcing.CATEGORY IS 'default:의뢰 or 2';
--COMMENT ON COLUMN OutSourcing.ENROLL IS '등록유무(default:false)';
ALTER TABLE OutSourcing ADD CONSTRAINT PK_OUTSOURCING PRIMARY KEY (OUTNO);
ALTER TABLE OutSourcing ADD CONSTRAINT FK_Team_TO_OutSourcing_1 FOREIGN KEY (TEAMNO) REFERENCES Team(TEAMNO);
	

--------------------------------------------------------------------------------------------
--의뢰신청	
DROP SEQUENCE OutexSEQ;
DROP TABLE Outex CASCADE CONSTRAINTS;

CREATE SEQUENCE OutexSEQ;
CREATE TABLE Outex (
	OUTEXNO	number		NOT NULL,
	APPLIED		boolean		NOT NULL,
	COMMENT		varchar2(4000)		NULL,
	OUTNO		number		NOT NULL,
	MEMBERNO	number		NOT NULL
);

--COMMENT ON COLUMN Outex.APPLIED IS '신청승인여부(default: false)';
--COMMENT ON COLUMN Outex.COMMENT IS '소개?';
ALTER TABLE Outex ADD CONSTRAINT PK_OUTEX PRIMARY KEY (OUTEXNO);
ALTER TABLE Outex ADD CONSTRAINT FK_OutSourcing_TO_Outex_1 FOREIGN KEY (OUTNO) REFERENCES OutSourcing(OUTNO);
ALTER TABLE Outex ADD CONSTRAINT FK_Member_TO_Outex_1 FOREIGN KEY (MEMBERNO) REFERENCES Member (MEMBERNO);


---------------------------------------------------------------------------------------








