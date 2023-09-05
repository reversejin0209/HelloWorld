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
        
-- 티켓 예약: 예약 진행 ----------------------------------------------------------
-- id = tOrderReserve
-- 주문 추가
INSERT INTO TICKET_RES (TRCODE, MID, TRTOTPRICE)
     VALUES ( TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(TICKET_RES_SEQ.NEXTVAL, 4, 0)
            , 'aaa'
            , 198000);
            
-- id = addTOrderDetail
-- 예약한 티켓 정보 추가
INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TRDNAME, TRDTYPE ,TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
           , TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(TICKET_RES_SEQ.CURRVAL, 4, 0)
           , '헬로월드 종일권'
           , '소인'
           , 2
           , TO_DATE('2023-04-01', 'YYYY-MM-DD'));
           
-- SELECT MAX(TRCODE) FROM TICKET_RES;

INSERT INTO TICKET_RESDETAIL (TRDCODE, TRCODE, TRDNAME, TRDTYPE ,TRDCNT, TRDDATE)
     VALUES (TICKET_RESDETAIL_SEQ.NEXTVAL
          , (SELECT MAX(TRCODE) FROM TICKET_RES)
          , '헬로월드 종일권'
          , '소인'
          , 2
          , TO_DATE('2023-04-01', 'YYYY-MM-DD'));

-- id = torderList 
-- 총 주문 LIST(관리자)
SELECT * FROM (SELECT ROWNUM RN, RES.* 
                 FROM (SELECT * FROM TICKET_RES) RES)
        WHERE RN BETWEEN 1 AND 4;
    
    -- id = tOrderListTotCnt 
    -- 총 주문 LIST 확인(관리자): 총 수량
    SELECT COUNT(*) FROM TICKET_RES;

-- id = tMemberOrderList
SELECT * FROM TICKET_RES;

-- 관리자
SELECT * 
  FROM (SELECT ROWNUM RN, RES.* 
          FROM (SELECT DISTINCT TR.*, T.*
  FROM TICKET_RES TR
     , TICKET_RESDETAIL TRD
     , (SELECT DISTINCT TNAME, TIMG FROM TICKET) T
 WHERE TR.TRCODE = TRD.TRCODE
   AND TRDNAME = T.TNAME
 ORDER BY TR.TRCODE DESC) RES)
        WHERE RN BETWEEN 1 AND 10;

-- 나의 주문 LIST(회원)
SELECT * 
  FROM (SELECT ROWNUM RN, RES.* 
          FROM (SELECT DISTINCT TR.*, T.*
  FROM TICKET_RES TR
     , TICKET_RESDETAIL TRD
     , (SELECT DISTINCT TNAME, TIMG FROM TICKET) T
 WHERE TR.TRCODE = TRD.TRCODE
   AND TRDNAME = T.TNAME
   AND MID = 'aaa'
 ORDER BY TR.TRCODE DESC) RES)
        WHERE RN BETWEEN 1 AND 10;

SELECT DISTINCT TR.*, T.*
  FROM TICKET_RES TR, TICKET_RESDETAIL TRD, (SELECT DISTINCT TNAME, TIMG FROM TICKET) T
 WHERE TR.TRCODE = TRD.TRCODE
   AND MID = 'aaa'
   AND TRDNAME = T.TNAME;

    -- id = tMemberOrderListTotCnt
    -- 나의 주문 LIST(회원): 총 수량
    SELECT COUNT(*) FROM TICKET_RES WHERE MID = 'aaa';

-- 주문 정보 가져오기
-- id = getOrderDetail
    -- trcode로 조회
    SELECT * FROM TICKET_RES
            WHERE TRCODE = '2305070003';
            
    -- 회원 정보까지 조회
    SELECT RES.*, MNAME, MTEL, MMAIL FROM TICKET_RES RES, MEMBER
            WHERE RES.MID = MEMBER.MID
              AND TRCODE = '2305070003';
            
    -- 구매 직후 정보 조회        
    SELECT * FROM TICKET_RES
            WHERE TRCODE = (SELECT MAX(TRCODE) FROM TICKET_RES);        

-- id = getTOrderDetail     
-- 주문 내역 상세보기
SELECT * FROM TICKET_RESDETAIL
        WHERE TRCODE = '2305070003';

SELECT DISTINCT TRD.*, TIMG FROM TICKET_RESDETAIL TRD, TICKET
        WHERE TRCODE = '2305070003'
          AND TRD.TRDNAME = TNAME;
        
-- id = tReserveCancel           
-- 주문 취소
UPDATE TICKET_RES 
   SET TRRESULT = 1
 WHERE TRCODE = '2305030003';

-- id = TOrderDetailList
-- 상품 정보 전체 출력(입장 확인 용)
SELECT *
  FROM (SELECT ROWNUM RN, LIST.* 
          FROM (SELECT TD.*, MID, TRRESULT FROM TICKET_RESDETAIL TD, TICKET_RES TR
         WHERE TD.TRCODE = TR.TRCODE
         ORDER BY TD.TRDCODE DESC) LIST)
 WHERE RN BETWEEN 1 AND 10;
 
-- 상품 정보 전체 글 갯수
SELECT COUNT(*) FROM TICKET_RESDETAIL;

-- id = usedTicket           
-- 사용 티켓으로 변경
UPDATE TICKET_RESDETAIL
   SET TRDRESULT = 1
 WHERE TRDCODE = '1';

UPDATE MEMBER
   SET MVISIT = MVISIT + 1
 WHERE MID = 'aaa';

-- QNABOARD --------------------------------------------------------------------
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
SELECT QNA.*,
       (SELECT MNAME FROM MEMBER WHERE QNA.MID = MID) ||
       (SELECT ADNAME FROM ADMIN WHERE QNA.ADID = ADID) WRITER
  FROM (SELECT QNABOARD.*
          FROM QNABOARD
         WHERE QANUM = 6) QNA;


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
    
    -- 최근 다섯개만 출력
    SELECT * FROM QNABOARD
     WHERE QASTEP = 0
     ORDER BY QANUM DESC;
    
    -- 전체 출력
    SELECT LIST.*,
           (SELECT MNAME FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADNAME FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * FROM QNABOARD 
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
     WHERE RN BETWEEN 1 AND 8;
     
    -- 검색: All
    SELECT LIST.*,
           (SELECT MNAME FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADNAME FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * 
                      FROM QNABOARD 
                     WHERE MID LIKE '%'||''||'%'
                       AND QATITLE LIKE '%'||'문의'||'%'
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
    WHERE RN BETWEEN 1 AND 8;
    
    -- 검색: title
    SELECT LIST.*,
           (SELECT MNAME FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADNAME FROM ADMIN WHERE LIST.ADID = ADID) WRITER
      FROM (SELECT ROWNUM RN, QNA.* 
              FROM (SELECT * 
                      FROM QNABOARD 
                     WHERE QATITLE LIKE '%'||'문의'||'%'
                     ORDER BY QAGROUP DESC, QASTEP) QNA) LIST
    WHERE RN BETWEEN 1 AND 8;
    
    -- 검색: writer
    SELECT LIST.*,
           (SELECT MNAME FROM MEMBER WHERE LIST.MID = MID) ||
           (SELECT ADNAME FROM ADMIN WHERE LIST.ADID = ADID) WRITER
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

-- 마이페이지: 내가 작성한 글 + 답변
SELECT QANUM FROM QNABOARD WHERE MID = 'aaa';

SELECT * FROM (SELECT ROWNUM RN, LIST.* 
  FROM (SELECT * FROM QNABOARD, (SELECT QANUM REPLY FROM QNABOARD WHERE MID = 'aaa')
         WHERE QAGROUP = REPLY
         ORDER BY QAGROUP DESC, QASTEP) LIST)
 WHERE RN BETWEEN 1 AND 3;
 
 -- 글 갯수
 SELECT COUNT(*) FROM QNABOARD, (SELECT QANUM REPLY FROM QNABOARD WHERE MID = 'aaa')
     WHERE QAGROUP = REPLY;

rollback;
--------------------------------------------------------------------------------
SELECT * FROM TICKET;
SELECT * FROM TICKET_RES;
SELECT * FROM TICKET_RESDETAIL;