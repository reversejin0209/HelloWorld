-------------------------------- MEMBER GRADE ----------------------------------
-- 1. 등급 종류 
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('WELCOME', 0, 9, 0);     
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('FAMILY', 10, 29, 20);
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('VIP', 30, 999, 40);
    
----------------------------------- MEMBER -------------------------------------
-- 1. 회원가입
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
     VALUES ('aaa', 'aaa.gmail.com', '111', 'SCOTT', '010-1111-1111');
INSERT INTO MEMBER (mID, mMAIL, mPW, mNAME, mTEL)
    VALUES ('bbb', 'bbb@naver.com', '111', '비길동', '010-2222-2222');
    
---------------------------------- THEATER -------------------------------------
-- 1. 공연 추가
INSERT INTO THEATER (thCODE, thNAME, thPART, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '돌고래 쇼', 1, '60'||'분', '익스트림 존', 40, 7000, 'NOIMG.JPG', 0);
INSERT INTO THEATER (thCODE, thNAME, thPART, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '물개 쇼', 0, '80'||'분', '익스트림 존', 40, 9000, 'NOIMG.JPG', 1);
INSERT INTO THEATER (thCODE, thNAME, thPART, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '나무와 정령', 1, '40'||'분', '패밀리 존', 40, 5000, 'NOIMG.JPG', 0);

--------------------------------- THEATER_RES ----------------------------------
-- 1. 공연 예매
INSERT INTO THEATER_RES (thrCODE, mID, thCODE, thrCNT, thrORDERDATE, thrREVIEW, thrTOTPRICE, thrDATE)
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH1'||THRCODE_SEQ.NEXTVAL, 'aaa', 'TH1', 2, SYSDATE, 0, 10000, SYSDATE);

---------------------------------- THREVIEW ------------------------------------
-- 1. 공연 리뷰 글 쓰기
INSERT INTO THREVIEW (thrNUM, thrCODE, thrTITLE, thrCONTENT, thrRDATE) 
    VALUES (THREVIEW_SEQ.NEXTVAL, '230420TH11', '하이하이', '본문임', SYSDATE);
    
COMMIT;



