----------------------------------- MEMBER -------------------------------------
-- 1. 회원가입
    --> 1-1. 회원가입
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL)
     VALUES ('aaa', 'aaa.gmail.com', '111', 'SCOTT', '010-1111-1111');
    --> 1-2. ID Confirm
SELECT COUNT(*) FROM MEMBER WHERE mID = 'aaa';
    --> 1-3. Tel Confirm
SELECT COUNT(*) FROM MEMBER WHERE mTEL = '010-1111-1111';
    --> 1-4. Emial Confirm
SELECT COUNT(*) FROM MEMBER WHERE mMAIL = 'aaa.gmail.com';

-- 2. 로그인
SELECT COUNT(*) FROM MEMBER WHERE mID = 'aaa' AND mPW = '111';

-- 3. 정보수정
UPDATE MEMBER 
    SET mMAIL = 'bbb@naver.com',
        mNAME = '수정길동',
        mTEL = '010-2222-2222'
    WHERE mID = 'aaa';

-- 4. 내가 쓴 공연 리뷰 게시판(페이징)
    --> 3-1. 내가 쓴 공연 리뷰 총 갯수
SELECT COUNT(*) FROM THREVIEW WHERE mID = 'aaa';
    --> 3-2. 내가 쓴 공연 리뷰 게시판
SELECT * FROM (SELECT ROWNUM RW, A.* FROM (SELECT * FROM THREVIEW WHERE mID = 'aaa' ORDER BY thrRDATE) A)
    WHERE RW BETWEEN 1 AND 5;

-- 5. 회원 등급 조정
SELECT M.*, G.GRADE FROM MEMBER M, MEMBER_GRADE G
    WHERE M.MVISIT > G.LOWVI AND M.mVISIT < G.HIGHVI;
    
-- 6. 회원 탈퇴
DELETE MEMBER WHERE mID = 'aaa';

SELECT * FROM MEMBER;
---------------------------------- THEATER -------------------------------------
-- 1. 공연 추가
INSERT INTO THEATER (thCODE, thNAME, thPART, thTIME, thLOC, thSEAT, thPRICE, thIMG1, thSCHEDULE)
    VALUES ('TH'||THCODE_SEQ.NEXTVAL, '돌고래 쇼', SYSDATE, '60'||'분', '익스트림 존', 40, 7000, 'NOIMG.JPG', 0);
    
-- 2. 스케쥴별로 공연 출력
SELECT * FROM THEATER 
    WHERE thSCHEDULE = 0;
    
-- 3. 공연 상세보기
SELECT * FROM THEATER 
    WHERE thCODE = 'TH1';

-- 4. 공연 삭제
DELETE THEATER WHERE thCode = 'TH1';

SELECT * FROM THEATER;
--------------------------------- THEATER_RES ----------------------------------
-- 1. 예매 진행
    --> 1-1. 예매 진행
INSERT INTO THEATER_RES (thrCODE, mID, thCODE, thrCNT, thrORDERDATE, thrREVIEW, thrTOTPRICE, thrDATE)
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH1'||THRCODE_SEQ.NEXTVAL, 'aaa', 'TH1', 2, SYSDATE, 0, 10000, SYSDATE);
    --> 1-2. 예매 완료 시 공연 좌석 차감
UPDATE THEATER 
    SET thSEAT = thSEAT - 2
    WHERE thCODE = 'TH1';
    --> 1-3. 예매 완료 시 구매 좌석 추가
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('A1', '230420TH11');
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('A2', '230420TH11');
    --> 1-4. 예매 완료된 좌석 막기
SELECT SEATCODE 
    FROM THEATER_SEAT TS, THEATER_RES TR, THEATER T 
    WHERE TS.thrCODE = TR.thrCODE AND TR.thCODE = T.thCODE AND
          T.thCODE = 'TH1' AND (TO_CHAR(thrDATE, 'YYMMDD')=230420);

-- 2. 예매 내역 리스트(페이징)
    --> 2-1. 예매 내역 총 갯수
SELECT COUNT(*) FROM THEATER_RES WHERE mID = 'aaa';    
    --> 2-2. 예매 내역 리스트 뿌리기
SELECT *    
    FROM (SELECT ROWNUM RW, A.* FROM (SELECT TR.*, T.thNAME, T.thLOC 
                                        FROM THEATER_RES TR, THEATER T 
                                        WHERE TR.thCODE = T.thCODE AND mID = 'aaa' 
                                        ORDER BY T.thDATE) A)
    WHERE RW BETWEEN 1 AND 5;

-- 3. 예매 내역 상세보기
SELECT *
    FROM THEATER_RES TR, THEATER T, THEATER_SEAT TS
    WHERE TR.thCODE = T.thCODE AND TR.thrCODE = TS.thrCODE AND TR.thrCODE = '230419TH11';

-- 4. 예매 취소 (시간이 지난 예매권은 삭제 불가)
    --> 4-1. 좌석 테이블 데이터 삭제
DELETE THEATER_SEAT 
    WHERE thrCODE = '230419TH11';
    --> 4-2. 예약 내역 삭제
DELETE THEATER_RES 
    WHERE thrCODE = '230419TH11';

SELECT * FROM THEATER_RES;
---------------------------------- THREVIEW ------------------------------------
-- 1. 공연 리뷰 작성
INSERT INTO THREVIEW (thrNUM, thrCODE, thCODE, mID, thrTITLE, thrCONTENT) 
    VALUES (THREVIEW_SEQ.NEXTVAL, '230419TH12', 'TH1', 'aaa', '하이하이', '본문임');
    
-- 2. 마이페이지 공연 리뷰 리스트(페이징)
    --> 2-1. 마이페이지 공연 리뷰전체 갯수
SELECT COUNT(*) 
    FROM THREVIEW TV, THEATER_RES TR 
    WHERE TV.thrCODE = TR.thrCODE AND TR.mID = 'aaa';
    --> 2-2. 공연 리뷰 리스트 뿌리기
SELECT * FROM (SELECT ROWNUM RW, A.*
                    FROM (SELECT TV.*
                            FROM THREVIEW TV, THEATER_RES TR 
                            WHERE TV.thrCODE = TR.thrCODE AND TR.mID = 'aaa') A)
    WHERE RW BETWEEN 1 AND 3;

-- 3. 특정 공연 전체 리뷰
    --> 3-1. 공연 리뷰전체 갯수
SELECT COUNT(*) 
    FROM THREVIEW TV, THEATER_RES TR 
    WHERE TV.thrCODE = TR.thrCODE AND thCODE = 'TH1';
    --> 3-2. 공연 리뷰 리스트 뿌리기
SELECT * FROM (SELECT ROWNUM RW, A.*
                    FROM (SELECT TV.*
                             FROM THREVIEW TV, THEATER_RES TR 
                             WHERE TV.thrCODE = TR.thrCODE AND thCODE = 'TH1') A)
    WHERE RW BETWEEN 1 AND 3;
-- 4. 공연 리뷰 상세보기
SELECT * FROM THREVIEW WHERE thrNUM = '1';

-- 5. 공연 리뷰 삭제
DELETE THREVIEW WHERE thrNUM = '2';

SELECT * FROM THREVIEW;

