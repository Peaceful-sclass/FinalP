
DROP TABLE CHAT;

CREATE TABLE CHAT(
	CHATTING_NO NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE NOT NULL
);


----------------------------------------------------------------------------------
SELECT * FROM CHAT WHERE CHATTING_NO=1 ORDER BY REGDATE;

SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;

SELECT * FROM CHAT WHERE CHATTING_NO=1 AND REGDATE> TO_DATE('2021-1-25 17:35:1','YYYY-MM-DD HH24:MI:SS');

SELECT CHATTING_NO, MEMBER_ID, CONTENT, TO_CHAR(REGDATE, 'YYYY-MM-DD HH24:MI:SS') AS REGDATE
	 FROM CHAT WHERE CHATTING_NO=1 AND REGDATE> TO_DATE('2021-1-25 17:35:1','YYYY-MM-DD HH24:MI:SS') ORDER BY REGDATE;
	 
SELECT SYSTIMESTAMP, TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH:MM:SS.FF4') FROM DUAL;