--------------------------------------------------------------------------------------------------------
--팀--
DROP SEQUENCE TEAMSEQ;
DROP TABLE TEAM cascade constraints;

CREATE SEQUENCE TEAMSEQ;
CREATE TABLE TEAM(
     TEAM_NO NUMBER,
     TEAM_NAME VARCHAR2(50) NOT NULL,
     TEAM_INTRO VARCHAR2(2000)
);

ALTER TABLE Team ADD CONSTRAINT PK_TEAM PRIMARY KEY (TEAM_NO);
ALTER TABLE Team ADD CONSTRAINT UK_TEAM unique (TEAM_Name);


INSERT INTO TEAM VALUES(1, 'WV', 'testtest' );

SELECT * FROM TEAM;

--------------------------------------------------------------------------------------------------------
--팀 멤버 정보테이블--
DROP SEQUENCE TeamMEMBERSEQ;
DROP TABLE TEAMMEMBER cascade constraints;

CREATE SEQUENCE TeamMEMBERSEQ;
CREATE TABLE TEAMMEMBER(
     TEAMmember_NO NUMBER,
     MEMBER_NO NUMBER NOT NULL,
     TEAM_no NUMBER NOT NULL,
     grade_inteam varchar2(10) default '팀원'
);

ALTER TABLE TeamMember ADD CONSTRAINT PK_TEAMMEMBER PRIMARY KEY (TEAMMEMBER_NO);
ALTER TABLE TeamMember ADD CONSTRAINT FK_Team_TO_TeamMember_1 FOREIGN KEY (TEAM_NO) REFERENCES Team (TEAM_NO);
ALTER TABLE TeamMember drop CONSTRAINT FK_Member_TO_TeamMember_1;
ALTER TABLE TeamMember ADD CONSTRAINT FK_Member_TO_TeamMember_1 FOREIGN KEY (MEMBER_NO) REFERENCES myMember (MEMBER_NO) on delete cascade;


INSERT INTO TEAMMEMBER VALUES(TeamMEMBERSEQ.NEXTVAL, 22, 1, '팀장' );

SELECT * FROM TEAMMEMBER;


--------------------------------------------------------------------------------------------------------
--TEAM CODE TABLE
select * from teamcode;
drop sequence teamcodenoseq;
drop table teamcode;
create sequence teamcodenoseq;
create table teamcode(
    Teamcode_no number primary key,
    Teammember_id varchar2(20) not null,
    Team_no number not null,
    code varchar2(200) not null,
    regdate date
);
