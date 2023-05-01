-- 티켓 예약 --------------------------------------------------------------------

-- id = ticketList
-- 티켓 목록 출력
SELECT DISTINCT TNAME, TSUB, TIMG FROM TICKET;

-- id = getTicket
SELECT DISTINCT TNAME, TSUB, TCONTENT, TIMG 
           FROM TICKET
          WHERE TNAME = '헬로월드 종일권';

-- id = ticketDetail
-- 해당 티켓 구분(대인, 청소년, 소인/경로) 출력
SELECT * FROM TICKET
        WHERE TNAME = '헬로월드 종일권';

-- id = ticketReserve
-- 주문 추가
INSERT INTO TICKET_RES (TRCODE, MID, TRTOTPRICE)
     VALUES ( TO_CHAR(SYSDATE, 'YYYYMMDD') || LPAD(TICKET_RES_SEQ.NEXTVAL, 4, 0)
            , 'aaa'
            , 198000);
            
-- id = ticketReserveDetail
-- 예약한 티켓 정보 추가
INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TCODE, TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
           , '202304190001'
           , 'TI0001'
           , 2
           , '2023/04/01');

-- id = torderList 
-- 총 주문 LIST(관리자)
SELECT * FROM (SELECT ROWNUM RN, RES.* 
                 FROM (SELECT * FROM TICKET_RES) RES)
        WHERE RN BETWEEN 1 AND 4;
    
    -- id = tOrderListTotCnt 
    -- 총 주문 LIST 확인(관리자): 총 수량
    SELECT COUNT(*) FROM TICKET_RES;

-- id = tMemberOrderList
-- 나의 주문 LIST(회원)
SELECT * FROM (SELECT ROWNUM RN, RES.* 
                 FROM (SELECT * FROM TICKET_RES 
                        WHERE MID = 'aaa') RES)
        WHERE RN BETWEEN 1 AND 4;

    -- id = tMemberOrderListTotCnt
    -- 나의 주문 LIST(회원): 총 수량
    SELECT COUNT(*) FROM TICKET_RES WHERE MID = 'aaa';

-- id = getTicketDetail     
-- 주문 내역 상세보기
SELECT * FROM TICKET_RESDETAIL
        WHERE TRCODE = '202304190001';

-- id = tReserveCancel           
-- 주문 취소
UPDATE TICKET_RES 
   SET TRRESULT = 1
 WHERE TRCODE = '202304190001';

-- 총 수량 확인
-- SELECT RES.TRCODE, SUM(TRDCNT)
--          FROM TICKET_RES RES, TICKET_RESDETAIL DETAIL
--        WHERE RES.TRCODE = DETAIL.TRCODE
--        GROUP BY RES.TRCODE;
  
-- SELECT *
--  FROM TICKET_RES RES, 
--      (SELECT RES.TRCODE, SUM(TRDCNT)
--         FROM TICKET_RES RES, TICKET_RESDETAIL DETAIL
--        WHERE RES.TRCODE = DETAIL.TRCODE
--        GROUP BY RES.TRCODE) SUM
-- WHERE RES.TRCODE = SUM.TRCODE;


-- QNABOARD
-- id = registerQnA
-- 질문 등록
-- 이미지 첨부한 경우
INSERT INTO QNABOARD
            (QANUM, MID, ADID, QATITLE, QACONTENT
           , QAPW, QAIMG, QAGROUP, QASTEP, QAINDENT, QAIP)
     VALUES (QNABOARD_SEQ.NEXTVAL
           , 'aaa'
           , NULL
           , '문의드립니다'
           , '문의 내용'
           , '111'
           , NULL
           , QNABOARD_SEQ.CURRVAL
           , 0
           , 0
           , '195.0.0.1');
           
-- 이미지 첨부 안한 경우
INSERT INTO QNABOARD
            (QANUM, MID, ADID, QATITLE, QACONTENT
           , QAPW, QAGROUP, QASTEP, QAINDENT, QAIP)
     VALUES (QNABOARD_SEQ.NEXTVAL
           , 'aaa'
           , NULL
           , '문의드립니다'
           , '문의 내용'
           , '111'
           , QNABOARD_SEQ.CURRVAL
           , 0
           , 0
           , '195.0.0.1');
           
-- 조회수 증가
UPDATE QNABOARD
   SET QAHIT = QAHIT + 1
 WHERE QANUM = 1;

-- 질문 상세보기
SELECT * FROM QNABOARD
        WHERE QANUM = 1;

-- 질문 수정
-- id = modifyQnA
UPDATE QNABOARD 
   SET QATITLE = '수정테스트'
     , QACONTENT = '수정테스트입니다.'
     , QAIMG = NULL
     , QAIP = '201.0.0.1'
 WHERE QANUM = '2'; 

-- 답변 작성
    -- STEP 1
    UPDATE QNABOARD SET QASTEP = QASTEP + 1
                  WHERE QAGROUP = 2 AND QASTEP > 0;
    -- STEP 2
    INSERT INTO QNABOARD
            (QANUM, MID, ADID, QATITLE, QACONTENT
           , QAPW, QAIMG, QAGROUP, QASTEP, QAINDENT, QAIP)
     VALUES (QNABOARD_SEQ.NEXTVAL
           , NULL
           , 'dbswls0209'
           , '안녕하세요, 헬로월드입니다.'
           , '답변 내용'
           , '111'
           , NULL
           , 2
           , 1
           , 1
           , '195.0.0.1');
           
-- 목록 출력
SELECT * FROM (SELECT ROWNUM RN, QNA.* 
                 FROM (SELECT * FROM QNABOARD 
                        ORDER BY QAGROUP DESC, QASTEP) QNA)
        WHERE RN BETWEEN 1 AND 8;
    -- QNA 게시판 총 글 갯수
    SELECT COUNT(*) FROM QNABOARD;
    
-- 게시글 삭제(답변까지 삭제 되도록)
DELETE FROM QNABOARD
    WHERE QAGROUP = 2;
    -- 전체 출력
    SELECT LIST.*,
           (SELECT MID FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADID FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * FROM QNABOARD 
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
     WHERE RN BETWEEN 1 AND 8;
    
    -- 검색: All
    SELECT LIST.*,
           (SELECT MID FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADID FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * 
                      FROM QNABOARD 
                     WHERE MID LIKE '%'||''||'%'
                       AND QATITLE LIKE '%'||'문의'||'%'
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
    WHERE RN BETWEEN 1 AND 8;
    
    -- 검색: title
    SELECT LIST.*,
           (SELECT MID FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADID FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * 
                      FROM QNABOARD 
                     WHERE QATITLE LIKE '%'||'문의'||'%'
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
    WHERE RN BETWEEN 1 AND 8;
    
    -- 검색: writer
    SELECT LIST.*,
           (SELECT MID FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADID FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * 
                      FROM QNABOARD 
                     WHERE MID LIKE '%'||'aaa'||'%'
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
    WHERE RN BETWEEN 1 AND 8;

-- id = totCntQna        
-- QNA 게시판 총 글 갯수
    -- 전체 출력
    SELECT COUNT(*) FROM QNABOARD;
    
    -- 검색: ALL
    SELECT COUNT(*) 
      FROM QNABOARD
     WHERE MID LIKE '%'||''||'%'
       AND QATITLE LIKE '%'||'문의'||'%';
    -- 검색: TITLE
    SELECT COUNT(*) 
      FROM QNABOARD
     WHERE QATITLE LIKE '%'||'문의'||'%';
    -- 검색: WRITER
    SELECT COUNT(*) 
      FROM QNABOARD
     WHERE MID LIKE '%'||'aaa'||'%';
    
-- 게시글 삭제(답변까지 삭제 되도록)
DELETE FROM QNABOARD
 WHERE QAGROUP = 2;
