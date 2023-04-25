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

--------------------------------------------------------------------------------
------------------------------------ MEMBER  -----------------------------------
--------------------------------------------------------------------------------
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('fff', 'hong@hong.com', '11', '홍길동', '010-9999-9999');
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('sss', 'song@song.com', '11', '송길동', '010-9999-8888');
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('bbb', 'back@back.com', '11', '백길동', '010-0100-0100');
INSERT INTO MEMBER (mID, mMAIL, mPW, mNAME, MTEL)
    VALUES ('aaa', 'aaa@naver.com', '111', '에이길동', '010-1111-1111');
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL, MVISIT)
     VALUES ('zzz', 'aaa@gmail.com', '111', '제트길동', '010-3333-3333', 11);
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('ccc', 'ccc@naver.com', '111', '시길동', '010-2222-2222');

--------------------------------------------------------------------------------
-------------------------------------- ADMIN -----------------------------------
--------------------------------------------------------------------------------
INSERT INTO ADMIN (ADID, ADPW, ADNAME, ADNUM, ADEMAIL)
    VALUES ('dbswls0209', '111', '장길동', '010-7777-7777', 'dbswls0209@naver.com');
--------------------------------------------------------------------------------
-------------------------------------- NOTICE  ---------------------------------
--------------------------------------------------------------------------------
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 이벤트 개최', '이벤트', 'dbswls0209');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 내용', '뉴스/공지', 'dbswls0209');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 뉴스', '이벤트', 'dbswls0209');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '놀라운 이벤트', '이벤트', 'dbswls0209');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '최고의', '이벤트', 'dbswls0209');
--------------------------------------------------------------------------------
------------------------------------- ZONE -------------------------------------
--------------------------------------------------------------------------------
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('익스트림존', '포곡읍 유운리 551-11', '37.29155203166443', '127.20072918697159');
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('쿼리어려워존', '포곡읍 가실리 167-3', '37.28899758228319', '127.19806096107786');
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('JAVA배워존', '포곡읍 전대리 506', '37.291065391982734', '127.20498180313548');
--------------------------------------------------------------------------------
----------------------------------- ATTRACTION ---------------------------------
--------------------------------------------------------------------------------
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atOLD, atHEIGHT, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, 'C익스프레스', '짜릿한 속도를 체감 할 수 있을겁니다', '경기 용인시 처인구 포곡읍 에버랜드로 199', 10, 150,  37.293099327122114, 127.20219040246639, 'dbswls0209', '익스트림존');
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atOLD, atHEIGHT, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, 'J후룸라이드', '여름엔 역시...!', '경기 용인시 처인구 포곡읍 에버랜드로 199', 10, 150,  37.293099327122114, 127.20219040246639, 'dbswls0209', 'JAVA배워존');
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, '귀신의 집 어려워', '으스스한 유령을 피해요', '경기 용인시 처인구 포곡읍 에버랜드로 199', 37.293099327122114, 127.20219040246639, 'dbswls0209', '쿼리어려워존');
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atOLD, atHEIGHT, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, '자이로드롭 어려워', '올라갈땐 1초 내려올땐 3분', '경기 용인시 처인구 포곡읍 에버랜드로 199', 10, 150,  37.293099327122114, 127.20219040246639, 'dbswls0209', '쿼리어려워존');
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atOLD, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, 'J미니트레일러', '잔잔한 롤러코스터 초급자 코스', '경기 용인시 처인구 포곡읍 에버랜드로 199', 7, 37.293099327122114, 127.20219040246639, 'dbswls0209', 'JAVA배워존');
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atOLD, atLAT, atLNG, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, '범퍼카', '스트레스 풀고 갈 수 있는 절호의 기회', '경기 용인시 처인구 포곡읍 에버랜드로 199', 10,  37.293099327122114, 127.20219040246639, 'dbswls0209', '익스트림존');
--------------------------------------------------------------------------------
------------------------------------- AT_RPLY ----------------------------------
--------------------------------------------------------------------------------
-- 글쓰기 
SELECT * FROM AT_RPLY;
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'aaa', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'fff', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');
-- 답변글
INSERT INTO AT_RPLY (APYNUM, ADID, MID, ATCODE, APYTITLE, APYCONTENT, APYRDATE, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES(AT_RPLY_SEQ.NEXTVAL, 'dbswls0209', 'aaa', '1', '제목임', '만6세 이 후 부터 이용 가능합니다 감사합니다', SYSDATE, 0, 0, 0, '123-123');

-- TICKET
INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '대인'
           , '68000');

INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '청소년'
           , '62000');
    
INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '소인/경로'
           , '52000');

INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권(삼성카드 할인)'
           , '대인'
           , '32000');

INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 오후권'
           , '대인'
           , '46000');

INSERT INTO TICKET (TCODE, TNAME, TTYPE, TPRICE)
     VALUES ('TI' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 오후권'
           , '청소년'
           , '42000');

-- TICKET_RES ------------------------------------------------------------------
INSERT INTO TICKET_RES (TRCODE, MID, TRTOTPRICE)
     VALUES ( TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(TICKET_RES_SEQ.NEXTVAL, 4, 0)
            , 'aaa'
            , 84000);

-- TICKET_RESDETAIL ------------------------------------------------------------
INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TCODE, TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
           , '202304190001'
           , 'TI0001'
           , 2
           , '2023/04/01');

INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TCODE, TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
           , '202304190001'
           , 'TI0002'
           , 1
           , '2023/04/01');
           
INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TCODE, TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
           , '202304190002'
           , 'TI0006'
           , 2
           , '2023/04/01');
           
-- QNABOARD --------------------------------------------------------------------
INSERT INTO QNABOARD
            (QANUM, MID, QACAT, QATITLE, QACONTENT
           , QAPW, QAIMG, QAGROUP, QASTEP, QAINDENT, QAIP)
     VALUES (QNABOARD_SEQ.NEXTVAL
           , 'sss'
           , '이용문의'
           , '문의드립니다'
           , '문의 내용'
           , '111'
           , NULL
           , QNABOARD_SEQ.CURRVAL
           , 0
           , 0
           , '195.0.0.1'); 

COMMIT;

SELECT * FROM MEMBER;