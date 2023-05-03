
-- MEMBER ----------------------------------------------------------------------
-- MEMBER GRADE
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('WELCOME', 0, 9, 0);     
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('FAMILY', 10, 29, 20);
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('VIP', 30, 999, 40);
    
-- MEMBER
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
     VALUES ('aaa', 'aaa.gmail.com', '111', '김길동', '010-2381-2378');
INSERT INTO MEMBER (mID, mMAIL, mPW, mNAME, mTEL)
    VALUES ('bbb', 'bbb@naver.com', '111', '이길동', '010-4902-9483');
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('ccc', 'ccc@gmail.com', '111', '삼길동', '010-3849-4104');
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
    VALUES ('ddd', 'ddd@naver.com', '111', '사길동', '010-4908-2898');
    
-- ADMIN -----------------------------------------------------------------------
INSERT INTO ADMIN (ADID, ADPW, ADNAME, ADNUM, ADEMAIL)
    VALUES ('ADMIN', '111', '김스콧', '010-3948-3048', 'dbswls0209@naver.com');
    
-- THEATER ---------------------------------------------------------------------
-- 1. THEATER: 공연 추가
INSERT INTO THEATER (thCODE, thNAME, thCONTENT, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '로티의 사이버 어드벤처', '귀여운 로티와 함께하는 사이버 어드벤처', '60'||'분', '익스트림 존', 40, 7000, 'theater1.png', 0);
INSERT INTO THEATER (thCODE, thNAME, thCONTENT, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '코코의 모험: 코딩 어드벤처', '위험에 빠진 딩딩이를 구하러 가는 코코의 모험!', '80'||'분', '어드벤처 존', 40, 9000, 'cocoAdven.png', 1);
INSERT INTO THEATER (thCODE, thNAME, thCONTENT, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '락큰롤 빅 밴드 쇼', '락큰롤 빅 밴드 쇼', '40'||'분', '매지컬 랜드', 40, 5000, 'theater3.png', 0);

-- 2. THEATER_RES: 공연 예매
INSERT INTO THEATER_RES (thrCODE, mID, thCODE, thrCNT, thrORDERDATE, thrREVIEW, thrTOTPRICE, thrDATE)
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH1'||THRCODE_SEQ.NEXTVAL, 'aaa', 'TH1', 2, SYSDATE, 0, 10000, SYSDATE);

-- 3. THREVIEW: 공연 리뷰 글 쓰기
INSERT INTO THREVIEW (thrNUM, thrCODE, mID, thrTITLE, thrCONTENT, thrRDATE) 
    VALUES (THREVIEW_SEQ.NEXTVAL, '230420TH11', 'aaa', '하이하이', '본문임', SYSDATE);

-- NOTICE  ---------------------------------------------------------------------

INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 이벤트 개최', '이벤트', 'ADMIN');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 내용', '뉴스/공지', 'ADMIN');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 뉴스', '이벤트', 'ADMIN');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '놀라운 이벤트', '이벤트', 'ADMIN');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '최고의', '이벤트', 'ADMIN');


-- 놀이동산 관련 DATA ------------------------------------------------------------
-- 1. ZONE: 구역
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('익스트림존', '포곡읍 유운리 551-11', '37.29155203166443', '127.20072918697159');
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('매지컬랜드', '포곡읍 전대리 506', '37.291065391982734', '127.20498180313548');
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('어드벤처존', '포곡읍 전대리 506', '37.291065391982734', '127.20498180313548');
INSERT INTO ZONE (ZNAME, ZPLACE, ZLAT, ZLNG) 
    VALUES('워터월드존', '포곡읍 전대리 506', '37.291065391982734', '127.20498180313548');

-- 2. ATTRACTION: 어트랙션
INSERT INTO ATTRACTION (atCODE, atNAME, atCONTENT, atADDR, atPOST, atIMAGE, atOLD, atHEIGHT, atWEIGHT, atLAT, atLNG, atYOUTUBE, atNOP, adID, zNAME )
    VALUES (ATTRACTION_SEQ.NEXTVAL, 'C익스프레스', '짜릿한 속도를 체감 할 수 있을겁니다', '경기 용인시 처인구 포곡읍 에버랜드로 199', 17023, 'coster.jpg', 10, 150, 100, 37.293099327122114, 127.20219040246639, 'https://www.youtube.com/embed//Y9hvLFOAX38', 20,'dbswls0209', '익스트림존');
INSERT INTO ATTRACTION (ATCODE, ATNAME, ATCONTENT, ATADDR, ATPOST, ATIMAGE, ATOLD, ATHEIGHT, ATWEIGHT, ATLAT, ATLNG, ATYOUTUBE, ATNOP, ADID, ZNAME)
    VALUES (ATTRACTION_SEQ.NEXTVAL, '범퍼카', '스트레스 풀고 갈 수 있는 절호의 기회', '경기 용인시 처인구 포곡읍 에버랜드 199', 17023, 'bumber.jpg', 10, 190, 110, 37.293099327122114, 127.20219040246639, 'https://www.youtube.com/embed//l7jAhHjBT_k', 40,'dbswls0209', '워터월드존');

-- 3. AT_RPLY: 어트랙션 질문
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'aaa', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'bbb', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');

-- 3. AT_RPLY: 어트랙션 답변글
INSERT INTO AT_RPLY (APYNUM, ADID, MID, ATCODE, APYTITLE, APYCONTENT, APYRDATE, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES(AT_RPLY_SEQ.NEXTVAL, 'ADMIN', 'aaa', '1', '제목임', '만6세부터 이용 가능합니다 감사합니다', SYSDATE, 0, 0, 0, '123-123');

-- TICKET ----------------------------------------------------------------------
-- 1. TICKET: 티켓 종류
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '헬로월드에서의 즐거운 하루'
           , '대인'
           , '68000'
           , '헬로월드 종일권 본문'
           , 'ticket_timg_01.png');
           
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '헬로월드에서의 즐거운 하루'
           , '청소년'
           , '62000'
           , '헬로월드 종일권 본문'
           , 'ticket_timg_01.png'); 
           
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 종일권'
           , '헬로월드에서의 즐거운 하루'
           , '영유아'
           , '52000'
           , '헬로월드 종일권 본문'
           , 'ticket_timg_01.png');

INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 오후권'
           , '4시부터 폐장까지 짧고 굵게 놀자!'
           , '대인'
           , '46000'
           , '헬로월드 오후권 본문'
           , 'ticket_timg_02.png');

INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로월드 오후권'
           ,'4시부터 폐장까지 짧고 굵게 놀자!'
           , '청소년'
           , '42000'
           , '헬로월드 오후권 본문'
           , 'ticket_timg_02.png');

-- 2. TICKET_RES: 티켓 주문
INSERT INTO TICKET_RES (TRCODE, MID, TRTOTPRICE)
     VALUES ( TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(TICKET_RES_SEQ.NEXTVAL, 4, 0)
            , 'aaa'
            , 198000);
            
-- 3. TICKET_RESDETAIL: 주문 상세 목록 
INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TRDNAME, TRDTYPE ,TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
          , (SELECT MAX(TRCODE) FROM TICKET_RES)
          , '헬로월드 종일권'
          , '소인'
          , 2
          , TO_DATE('2023-06-01', 'YYYY-MM-DD'));
           
-- 1:1 문의 게시판 --------------------------------------------------------------
-- QNABOARD
INSERT INTO QNABOARD (QANUM, MID, QACAT, QATITLE, QACONTENT
           , QAPW, QAGROUP, QASTEP, QAINDENT, QAIP)
     VALUES (QNABOARD_SEQ.NEXTVAL
           , 'aaa'
           , '이용문의'
           , '문의드립니다'
           , '문의 내용'
           , '111'
           , QNABOARD_SEQ.CURRVAL
           , 0
           , 0
           , '195.0.0.1'); 

COMMIT;
