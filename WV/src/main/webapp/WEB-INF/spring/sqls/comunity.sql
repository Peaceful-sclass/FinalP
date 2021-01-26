----------------------------------------------------------------------------------------
--커뮤니티
DROP SEQUENCE comunitySEQ;
DROP TABLE comunity CASCADE CONSTRAINTS;

CREATE SEQUENCE ComunitySEQ;
CREATE TABLE Comunity (
	CNO			number		NOT NULL,
	CATEGORY	varchar2(20)		NOT NULL,
	TITLE		varchar2(255)		NOT NULL,
	CONTENT		Clob		NULL,
	views		number		NULL,
	REGDATE		date		NOT NULL,
	MEMBER_NO	number		NOT NULL
);

ALTER TABLE Comunity ADD CONSTRAINT PK_COMUNITY PRIMARY KEY (CNO);
ALTER TABLE Comunity drop CONSTRAINT FK_Member_TO_Comunity_1;
ALTER TABLE Comunity ADD CONSTRAINT FK_Member_TO_Comunity_1 FOREIGN KEY (MEMBER_NO) REFERENCES myMember(MEMBER_NO) on delete cascade;
select * from comunity order by regdate desc;

------------------------------------------------------------------------------
--커뮤니티 댓글
DROP SEQUENCE ComCmtSEQ;
DROP SEQUENCE ComCmtgroupSEQ;
DROP TABLE ComComment CASCADE CONSTRAINTS;

CREATE SEQUENCE ComCmtSEQ;
CREATE SEQUENCE ComCmtgroupSEQ;
CREATE TABLE ComComment (
	ComCmtNO		number		NOT NULL,
	ComCmtgroupNO	number		NOT NULL,
	ComCmtgrpNO		number		NOT NULL,
	ComCOMMENT		varchar2(2000)		NOT NULL,
	REGDATE			date		NOT NULL,
	CNO				number		NOT NULL,
	member_no		number		NOT NULL
);

ALTER TABLE ComComment ADD CONSTRAINT PK_ComComment PRIMARY KEY (ComCmtNO);
ALTER TABLE ComComment drop CONSTRAINT FK_Comunity_TO_ComComment_1;
ALTER TABLE ComComment drop CONSTRAINT FK_Member_TO_ComComment_1;
ALTER TABLE ComComment ADD CONSTRAINT FK_Comunity_TO_ComComment_1 FOREIGN KEY (CNO) REFERENCES Comunity (CNO) on delete cascade;
ALTER TABLE ComComment ADD CONSTRAINT FK_Member_TO_ComComment_1 FOREIGN KEY (member_no) REFERENCES myMember (member_no) on delete cascade;

select * from COMCOMMENT;


---------------------------------------------------------------------------------------------
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
	price		number		not null,
	Conclusion	varchar2(5)	default 'false' not null,
	TEAMNO		number		NOT NULL,
	REGDATE		date		NOT NULL,
	views		number		NULL
);

ALTER TABLE OutSourcing ADD CONSTRAINT PK_OUTSOURCING PRIMARY KEY (OUTNO);
--팀테이블 만들어지고 실행해주기.	
ALTER TABLE OutSourcing ADD CONSTRAINT FK_Team_TO_OutSourcing_1 FOREIGN KEY (TEAMNO) REFERENCES Team(TEAMNO);

insert into outsourcing(outno, category, title, content, teamno, regdate) values(1,'자유', '제목테스트', '내용테스트',  1, sysdate, 0);
insert into outsourcing values(2,'자유', '제목테스트2', '내용테스트2', 'false', 1, sysdate, 0);
select * from OUTSOURCING;
delete from outsourcing;

--------------------------------------------------------------------------------------------
--의뢰신청	
DROP SEQUENCE OutexSEQ;
DROP TABLE Outex CASCADE CONSTRAINTS;

CREATE SEQUENCE OutexSEQ;
CREATE TABLE Outex(
	OUTEXNO		number		NOT NULL,
	APPLIED		varchar2(5)	default 'false' not null,
	outexCOMMENT		varchar2(4000),
	OUTNO		number		NOT NULL,
	member_no	number		NOT NULL
);

ALTER TABLE Outex ADD CONSTRAINT PK_OUTEX PRIMARY KEY (OUTEXNO);
ALTER TABLE Outex ADD CONSTRAINT FK_OutSourcing_TO_Outex_1 FOREIGN KEY (OUTNO) REFERENCES OutSourcing(OUTNO);
ALTER TABLE Outex ADD CONSTRAINT FK_Member_TO_Outex_1 FOREIGN KEY (member_no) REFERENCES myMember (member_no);


---------------------------------------------------------------------------------------
--의뢰성립상세
drop sequence outestseq;
drop table outest cascade constraints;

create sequence outestseq;
create table outest (
	outestNo number primary key,
	outestContent varchar2(4000) not null,
	outestFile varchar2(4000),
	constraint fk_outest_to_outest_1 foreign key (outestNo) references outsourcing(outNo)
	
);








