-- MEMBER ----------------------------------------------------------------------
-- MEMBER GRADE
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('WELCOME', 0, 9, 1);     
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('FAMILY', 10, 29, 10);
INSERT INTO MEMBER_GRADE (GRADE, LOWVI, HIGHVI, DISC)
     VALUES ('VIP', 30, 999, 20);
    
-- MEMBER
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL, MVISIT)
     VALUES ('aaa', 'aaa.gmail.com', '111', '김길동', '010-2381-2378', 1);
INSERT INTO MEMBER (mID, mMAIL, mPW, mNAME, MTEL, MVISIT)
    VALUES ('bbb', 'bbb@naver.com', '111', '이길동', '010-4902-9483', 10);
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL, MVISIT)
    VALUES ('ccc', 'ccc@gmail.com', '111', '삼길동', '010-3849-4104', 25);
INSERT INTO MEMBER (MID, MMAIL, MPW, MNAME, MTEL, MVISIT)
    VALUES ('ddd', 'ddd@naver.com', '111', '사길동', '010-4908-2898', 35);
    
-- ADMIN -----------------------------------------------------------------------
INSERT INTO ADMIN (ADID, ADPW, ADNAME, ADNUM, ADEMAIL)
    VALUES ('admin', '111', '김스콧', '010-3948-3048', 'dbswls0209@naver.com');
    
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
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH1'||THRCODE_SEQ.NEXTVAL, 'aaa', 'TH1', 2, SYSDATE, 0, 14000, SYSDATE);
    --> 예매 좌석 추가
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('A1', '230508TH11');
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('A2', '230508TH11');
INSERT INTO THEATER_RES (thrCODE, mID, thCODE, thrCNT, thrORDERDATE, thrREVIEW, thrTOTPRICE, thrDATE)
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH2'||THRCODE_SEQ.NEXTVAL, 'bbb', 'TH2', 1, SYSDATE, 0, 9000, SYSDATE);
    --> 예매 좌석 추가
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('C5', '230508TH22');
INSERT INTO THEATER_RES (thrCODE, mID, thCODE, thrCNT, thrORDERDATE, thrREVIEW, thrTOTPRICE, thrDATE)
    VALUES (TO_CHAR(SYSDATE, 'YYMMDD')||'TH3'||THRCODE_SEQ.NEXTVAL, 'ccc', 'TH3', 1, SYSDATE, 0, 5000, SYSDATE);
    --> 예매 좌석 추가
INSERT INTO THEATER_SEAT (SEATCODE, thrCODE)
    VALUES ('D4', '230508TH33');

-- 3. THREVIEW: 공연 리뷰 글 쓰기
INSERT INTO THREVIEW (thrNUM, thrCODE, mID, thrTITLE, thrCONTENT, thrRDATE) 
    VALUES (THREVIEW_SEQ.NEXTVAL, '230508TH11', 'aaa', '놀이공원보다 재밌는 공연', '본문임', SYSDATE);
INSERT INTO THREVIEW (thrNUM, thrCODE, mID, thrTITLE, thrCONTENT, thrRDATE) 
    VALUES (THREVIEW_SEQ.NEXTVAL, '230508TH33', 'ccc', '너무 재밌는 공연이었습니다', '본문임', SYSDATE);
   
-- NOTICE  ---------------------------------------------------------------------
-- 1. 공지사항 등록
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 이벤트 개최', '이벤트', 'admin');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 내용', '뉴스/공지', 'admin');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '새로운 뉴스', '이벤트', 'admin');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '놀라운 이벤트', '이벤트', 'admin');
INSERT INTO NOTICE (NNO, NTITLE, NTYPE, ADID)
    VALUES (NOTICE_SEQ.NEXTVAL, '최고의', '이벤트', 'admin');


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
    VALUES (ATTRACTION_SEQ.NEXTVAL, 'C익스프레스', '짜릿한 속도를 체감 할 수 있을겁니다', '경기 용인시 처인구 포곡읍 에버랜드로 199', 17023, 'coster.jpg', 10, 150, 100, 37.293099327122114, 127.20219040246639, 'https://www.youtube.com/embed//Y9hvLFOAX38', 20,'admin', '익스트림존');
INSERT INTO ATTRACTION (ATCODE, ATNAME, ATCONTENT, ATADDR, ATPOST, ATIMAGE, ATOLD, ATHEIGHT, ATWEIGHT, ATLAT, ATLNG, ATYOUTUBE, ATNOP, ADID, ZNAME)
    VALUES (ATTRACTION_SEQ.NEXTVAL, '범퍼카', '스트레스 풀고 갈 수 있는 절호의 기회', '경기 용인시 처인구 포곡읍 에버랜드 199', 17023, 'bumber.jpg', 10, 190, 110, 37.293099327122114, 127.20219040246639, 'https://www.youtube.com/embed//l7jAhHjBT_k', 40,'admin', '워터월드존');

-- 3. AT_RPLY: 어트랙션 질문
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'aaa', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');
INSERT INTO AT_RPLY (APYNUM, MID, ATCODE, APYTITLE, APYCONTENT, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES (AT_RPLY_SEQ.NEXTVAL, 'bbb', '1', '탑승관련', '어린 아이는 몇 살부터 탑승 가능 할까요?', AT_RPLY_SEQ.CURRVAL, 0, 0, '194.161.13.11');

-- 3. AT_RPLY: 어트랙션 답변글
INSERT INTO AT_RPLY (APYNUM, ADID, MID, ATCODE, APYTITLE, APYCONTENT, APYRDATE, APYGROUP, APYSTEP, APYINDENT, APYIP)
    VALUES(AT_RPLY_SEQ.NEXTVAL, 'admin', 'aaa', '1', '제목임', '만6세부터 이용 가능합니다 감사합니다', SYSDATE, 0, 0, 0, '123-123');

-- TICKET ----------------------------------------------------------------------
-- 종일권
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로 종일권'
           , '매표소에 줄 서지 않고 바로 입장하세요'
           , '대인'
           , '68000'
           , '매표소에 줄 서지 않고 바로 입장하는 특권!
스마트 예약하시고 빠르게 입장하세요.

※ 제휴카드 할인 이용권은 "종일권(제휴카드 할인)" 메뉴에서 예약하셔야 합니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해주세요.
※ 헬로월드 이용권을 삼성페이에 추가하여 편리하게 이용할 수 있습니다.'
           , 'ticket_timg_02.png');

INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로 종일권'
           , '매표소에 줄 서지 않고 바로 입장하세요'
           , '청소년'
           , '62000'
           , '매표소에 줄 서지 않고 바로 입장하는 특권!
스마트 예약하시고 빠르게 입장하세요.

※ 제휴카드 할인 이용권은 "종일권(제휴카드 할인)" 메뉴에서 예약하셔야 합니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해주세요.
※ 헬로월드 이용권을 삼성페이에 추가하여 편리하게 이용할 수 있습니다.'
           , 'ticket_timg_02.png');
           
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '헬로 종일권'
           , '매표소에 줄 서지 않고 바로 입장하세요'
           , '영유아'
           , '58000'
           , '매표소에 줄 서지 않고 바로 입장하는 특권!
스마트 예약하시고 빠르게 입장하세요.

※ 제휴카드 할인 이용권은 "종일권(제휴카드 할인)" 메뉴에서 예약하셔야 합니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해주세요.
※ 헬로월드 이용권을 삼성페이에 추가하여 편리하게 이용할 수 있습니다.'
           , 'ticket_timg_02.png');

-- 오후권(3시 입장)
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '오후권(3시 입장)'
           , '오후 3시부터 입장~ 마감시간까지 자유롭게!'
           , '대인'
           , '40000'
           , '[구매 및 사용]
- 오후 3시부터 입장 가능합니다.
- 2매 이상 구매하더라도 QR코드는 1개만 발송되므로 반드시 함께 입장하셔야 합니다.
- 방문예정일 기준 30일 전부터 방문 당일까지 예약 가능합니다.
- 중고생/대학(원)생 오후권 입장 시 에버랜드 APP에 등록하신 이용권 QR코드와 함께 중/고/대학(원)생임을 증명할 수 있는 증빙 서류(학생증 등)를 근무자에게 제시해 주세요. (증명서류 미지참 시 입장 불가 / 촬영본 가능)
- 타 제휴카드 및 쿠폰 등과 중복 우대되지 않습니다.
- 예약 문자를 받지 못한 경우, 헬로월드 APP 스마트예약 페이지 또는 홈페이지 > 마이 페이지 > 예매 조회의 상세 보기를 조회하면, QR코드 및 이용안내/유의사항을 확인하실 수 있습니다.'
           , 'ticket_timg_03.png'); 
           
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '오후권(3시 입장)'
           , '오후 3시부터 입장~ 마감시간까지 자유롭게!'
           , '청소년'
           , '35000'
           , '[구매 및 사용]
- 오후 3시부터 입장 가능합니다.
- 2매 이상 구매하더라도 QR코드는 1개만 발송되므로 반드시 함께 입장하셔야 합니다.
- 방문예정일 기준 30일 전부터 방문 당일까지 예약 가능합니다.
- 중고생/대학(원)생 오후권 입장 시 에버랜드 APP에 등록하신 이용권 QR코드와 함께 중/고/대학(원)생임을 증명할 수 있는 증빙 서류(학생증 등)를 근무자에게 제시해 주세요. (증명서류 미지참 시 입장 불가 / 촬영본 가능)
- 타 제휴카드 및 쿠폰 등과 중복 우대되지 않습니다.
- 예약 문자를 받지 못한 경우, 헬로월드 APP 스마트예약 페이지 또는 홈페이지 > 마이 페이지 > 예매 조회의 상세 보기를 조회하면, QR코드 및 이용안내/유의사항을 확인하실 수 있습니다.'
           , 'ticket_timg_03.png'); 
           
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '오후권(3시 입장)'
           , '오후 3시부터 입장~ 마감시간까지 자유롭게!'
           , '영유아'
           , '32000'
           , '[구매 및 사용]
- 오후 3시부터 입장 가능합니다.
- 2매 이상 구매하더라도 QR코드는 1개만 발송되므로 반드시 함께 입장하셔야 합니다.
- 방문예정일 기준 30일 전부터 방문 당일까지 예약 가능합니다.
- 중고생/대학(원)생 오후권 입장 시 에버랜드 APP에 등록하신 이용권 QR코드와 함께 중/고/대학(원)생임을 증명할 수 있는 증빙 서류(학생증 등)를 근무자에게 제시해 주세요. (증명서류 미지참 시 입장 불가 / 촬영본 가능)
- 타 제휴카드 및 쿠폰 등과 중복 우대되지 않습니다.
- 예약 문자를 받지 못한 경우, 헬로월드 APP 스마트예약 페이지 또는 홈페이지 > 마이 페이지 > 예매 조회의 상세 보기를 조회하면, QR코드 및 이용안내/유의사항을 확인하실 수 있습니다.'
           , 'ticket_timg_03.png'); 

-- 유아/초등 키즈 PKG
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '유아/초등 키즈 PKG'
           , '4시부터 폐장까지 짧고 굵게 놀자!'
           , '유아'
           , '80000'
           , '- 유아 키즈PKG	대인 종일권 1매 + 유아(소인) 종일권 1매
- 초등 키즈PKG	대인 종일권 1매 + 초등(소인) 종일권 1매
           
※ 나이 기준 : 유아(36개월~7세), 초등(8~13세)

[음료컵 교환권]
★ 해당컵으로 탄산음료 구매시 1,500원에 리필 제공★
- 교환 : 뉴욕센트럴, 아마존스낵, 멀린스스낵, 카페정글캠프, 매직타임(11:00~18:00)
- 방문 당일 근무자에게 문자 메시지(QR코드)를 제시해 주세요.
- 지정 품목 외 타 품목 교환은 불가합니다.
- 지정 품목 수령 후 교환이나 환불은 불가합니다.
- 당일에 한하여 사용 가능하며, 미교환 시 환불은 불가합니다.

※ 입장 시 해당 QR코드와 소인 나이를 증명할 수 있는 서류를 제시해주세요. (주민등록등본, 건강보험증, 여권 등)
※ 원활한 파크 이용을 위해 방문 당일 에버랜드 APP에 이용권을 등록해 주세요.
※ 이용권을 삼성페이에 추가하여 편리하게 이용할 수 있습니다.'
           , 'ticket_timg_01.png');

INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '유아/초등 키즈 PKG'
           , '4시부터 폐장까지 짧고 굵게 놀자!'
           , '초등키즈'
           , '86000'
           , '- 유아 키즈PKG	대인 종일권 1매 + 유아(소인) 종일권 1매
- 초등 키즈PKG	대인 종일권 1매 + 초등(소인) 종일권 1매
           
※ 나이 기준 : 유아(36개월~7세), 초등(8~13세)

[음료컵 교환권]
★ 해당컵으로 탄산음료 구매시 1,500원에 리필 제공★
- 교환 : 뉴욕센트럴, 아마존스낵, 멀린스스낵, 카페정글캠프, 매직타임(11:00~18:00)
- 방문 당일 근무자에게 문자 메시지(QR코드)를 제시해 주세요.
- 지정 품목 외 타 품목 교환은 불가합니다.
- 지정 품목 수령 후 교환이나 환불은 불가합니다.
- 당일에 한하여 사용 가능하며, 미교환 시 환불은 불가합니다.

※ 입장 시 해당 QR코드와 소인 나이를 증명할 수 있는 서류를 제시해주세요. (주민등록등본, 건강보험증, 여권 등)
※ 원활한 파크 이용을 위해 방문 당일 에버랜드 APP에 이용권을 등록해 주세요.
※ 이용권을 삼성페이에 추가하여 편리하게 이용할 수 있습니다.'
           , 'ticket_timg_01.png');

-- 판다월드 PKG
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '판다월드 사파리 PKG'
           , '판다월드 사파리와 이용권을 한번에 구매할 수 있는 상품'
           , '대인'
           , '57000'
           , '[운영기간]
- 4/1~5/14 (방문일 기준)

[상품구성]
- 오후권 1매 + 나이트사파리 체험권 1매
* 오후권은 3시 입장 가능합니다.
* 나이트 사파리 트램 체험 시 스마트예약 후 전송된 QR을 사파리월드 앞 근무자에게 반드시 제시해 주세요.

※ 본 프로모션은 당사 사정에 의하여 조기 종료될 수 있습니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해주세요.
※ 나이트사파리 트램 체험은 인원제한이 있는 CAPA상품으로 스마트예약 시 지정한 시간 외 사용은 불가합니다.'
           , 'ticket_timg_06.png');
           
           INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '판다월드 사파리 PKG'
           , '판다월드 사파리와 이용권을 한번에 구매할 수 있는 상품'
           , '청소년'
           , '54000'
           , '[운영기간]
- 4/1~5/14 (방문일 기준)

[상품구성]
- 오후권 1매 + 나이트사파리 체험권 1매
* 오후권은 3시 입장 가능합니다.
* 나이트 사파리 트램 체험 시 스마트예약 후 전송된 QR을 사파리월드 앞 근무자에게 반드시 제시해 주세요.

※ 본 프로모션은 당사 사정에 의하여 조기 종료될 수 있습니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해주세요.
※ 나이트사파리 트램 체험은 인원제한이 있는 CAPA상품으로 스마트예약 시 지정한 시간 외 사용은 불가합니다.'
           , 'ticket_timg_06.png');

-- 삼성카드 : 전회원 패키지 프로모션
INSERT INTO TICKET (TCODE, TNAME, TSUB, TTYPE, TPRICE, TCONTENT, TIMG)
     VALUES ('ti' || LPAD(TICKET_SEQ.NEXTVAL, 4, 0)
           , '삼성카드 : 전회원 패키지 프로모션'
           , '판다컵/츄러스/T익스프레스 Q패스 패키지'
           , '대인'
           , '32000'
           , '[대상카드]
- 삼성카드(신용/체크/법인/가족 포함, 선불/충전/기프트 제외)

※ T익스프레스 패키지는 일 50매 한정 수량으로, 조기 소진 시 구매가 어려울 수 있습니다.
※ 스마트줄서기 등 원활한 파크 이용을 위해 에버랜드 APP에 이용권을 등록해 주세요.

- 금융상품 이용 전 상품설명서, 홈페이지, 약관을 통해 이용조건을 확인해주시기 바랍니다.
- 금융소비자는 해당 상품 또는 서비스에 대하여 설명을 받을 권리가 있습니다.
- 신용카드 발급이 부적정한 경우(개인신용평점 낮음 등) 카드 발급이 제한될 수 있습니다.
- 카드 이용대금과 이에 수반되는 모든 수수료를 지정된 대금 결제일에 상환합니다.
- 상환 능력에 비해 신용카드 사용액이 과도할 경우 귀하의 개인신용평점이 하락할 수 있습니다.
- 개인신용평점 하락 시 금융거래 관련된 불이익이 발생할 수 있습니다.
- 일정 기간 원리금을 연체할 경우, 모든 원리금을 변제할 의무가 발생할 수 있습니다.
- 준법심의필 I3119-23-1971 (2023.05.04 ~ 2024.05.03)'
           , 'ticket_timg_05.png');


-- 2. TICKET_RES: 티켓 주문
INSERT INTO TICKET_RES (TRCODE, MID, TRTOTPRICE)
     VALUES ( TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(TICKET_RES_SEQ.NEXTVAL, 4, 0)
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

