-- 회원 가입
DECLARE
    a NUMBER;
BEGIN
    FOR i IN 1..200 LOOP
        a := SEQ_MNO.NEXTVAL;
        INSERT INTO MEMBER VALUES (
            a,
            'ROLE_USER',
            DEFAULT,
            'user' || a || '@a.com',
            'user' || a,
            'user' || a,
            'userName' || a,
            '010-1111-2222',
            NULL,
            NULL,
            NULL,
            NULL,
            SYSDATE,
            NULL,
            'Y'
        );
        INSERT INTO POINT VALUES(
            a,
            DEFAULT
        );
    END LOOP;
    COMMIT;
END;
/

-- 게시글 작성
DECLARE
    a NUMBER;
    b NUMBER := 2;
    c NUMBER;
    d NUMBER := 1;
BEGIN
    FOR i IN 1..35 LOOP
        a := SEQ_POSTNO.NEXTVAL;
        c := SEQ_BNO.NEXTVAL;
        INSERT INTO POST VALUES (
            a,
            '제목입니다' || a,
            '<h2>게시글 입니다</h2><h1>test</h1><h3><br></h3><h3>test</h3><h4>test</h4><h5>test</h5><h6>test</h6><p>test</p><p><br></p><p><strong>test</strong></p><p><br></p><p><em>test</em></p><p><br></p><p><del>test</del></p><p><br></p><p>test</p><div contenteditable="false"><hr></div><p><br></p><blockquote><p>test</p></blockquote><ul><li><p>test1</p></li><li><p>test2</p></li><li><p>test3</p></li></ul><ol><li><p>tset1</p></li><li><p>test2</p></li></ol><ul><li class="task-list-item checked" data-task="true" data-task-checked="true"><p>test1</p></li><li class="task-list-item" data-task="true"><p>tset2</p></li><li class="task-list-item checked" data-task="true" data-task-checked="true"><p>test3</p></li></ul><table><thead><tr><th><p>번호</p></th><th><p>제목</p></th><th><p>내용</p></th></tr></thead><tbody><tr><td><p>1</p></td><td><p>test</p></td><td><p>test</p></td></tr></tbody></table>',
            SYSDATE,
            NULL,
            'Y'
        );
        
        INSERT INTO BOARD VALUES (
            c,
            a,
            d,
            b,
            DEFAULT
        );
        b := b + 1;
        IF b > 4 THEN
            b := 2;
        END IF;
        d := d + 1;
        IF d > 10 THEN
            d := 1;
        END IF;
    END LOOP;
    COMMIT;
END;
/
-- 댓글 작성
DECLARE
    a NUMBER;
    b NUMBER := 1;
    c NUMBER;
    d NUMBER := 1;
BEGIN
    FOR i IN 1..50 LOOP
        a := SEQ_CNO.NEXTVAL;
        INSERT INTO "COMMENT" VALUES (
            a,
            b,
            d,
            '댓글 입니다',
            SYSDATE,
            NULL,
            'Y'
        );
        b := b + 1;
        IF b > 4 THEN
            b := 2;
        END IF;
        d := d + 1;
        IF d > 10 THEN
            d := 1;
        END IF;
    END LOOP;
    COMMIT;
END;
/
-- 대댓글 작성
DECLARE
    c NUMBER;
    b NUMBER := 1;
    d NUMBER := 1;
BEGIN
    FOR i IN 1..50 LOOP
        c := SEQ_NCNO.NEXTVAL;
        INSERT INTO NESTED_COMMENT VALUES (
            c,
            d,
            b,
            '대댓글 입니다',
            SYSDATE,
            NULL,
            'Y'
        );
         b := b + 1;
        IF b > 4 THEN
            b := 2;
        END IF;
        d := d + 1;
        IF d > 10 THEN
            d := 1;
        END IF;
    END LOOP;
    COMMIT;
END;
/
-- 포인트 적립
DECLARE
    a NUMBER;
    b NUMBER := 1;
    c NUMBER;
    d NUMBER := 1;
BEGIN
    FOR i IN 1..100 LOOP
        a := SEQ_PHNO.NEXTVAL;
        INSERT INTO POINT_HISTORY VALUES (
            a,
            d,
            SYSDATE,
            b,
            '출석체크'
        );
         b := b + 1;
        IF b > 4 THEN
            b := 2;
        END IF;
        d := d + 1;
        IF d > 10 THEN
            d := 1;
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- 서명
DECLARE
    a NUMBER;
BEGIN
    FOR i IN 1..100 LOOP
        a := SEQ_SNO.NEXTVAL;
        INSERT INTO SIGNATURE VALUES (
            a,
            2,
            55,
            DEFAULT,
            SYSDATE,
            SYSDATE
        );
    END LOOP;
    COMMIT;
END;
/

-- 조회수 증가
DECLARE
    a NUMBER;
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO HITS VALUES (
            a,
            2,
            55,
            DEFAULT,
            SYSDATE,
            SYSDATE
        );
    END LOOP;
    COMMIT;
END;
/

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'소금',
'-소금을 버리는 가장 좋은 방법은 불연성 쓰레기 봉투(마대봉투)로 버리는 것입니다.
-소금이나 염분이 많이 함유된 음식은 비료나 사료로 쓰일 수 없으므로 음식물 쓰레기로 버려선 안됩니다.
-일반쓰레기(종량제봉투)로 버릴 때에도 소각과정에서 독성이 있는 염화수소를 발생시키기 때문입니다.
-가정에서 소량으로 발생하는 소금은 물에 녹여서 배수구로 흘려버려도 무방해요.',
'-식당 등에서 대량으로 버려야할 경우 불연성 쓰레기 봉투로 버리거나 주민센터/구청 등에 생활폐기물로 신고/배출해주세요.
-소금은 유통기한이 없는 식재료로 너무 오래되었거나 다른 냄새가 배어서 먹을 수 없는 경우가 아니라면 굳이 버리지 않아도 됩니다.
-불연성 쓰레기 봉투는 지역 내 마트, 주민센터, 철물점 등에서 살 수 있어요. 하지만 안파는 곳도 많으니 판매여부를 미리 확인하고 방문하세요.
-불연성 쓰레기 봉투는 해당 지자체에 따라 불연재 쓰레기 봉투, 생활 폐기물 봉투, 특수 종량제 봉투 등으로 이름이 조금씩 다를 수 있어요. 모두 타지 않는 쓰레기를 담는 종량제 봉투라는 것과 마대 재질로 만들어졌다는 것을 기억해주세요.',
'2024-03-02',
'2024-03-09',
'Y');

INSERT INTO TRASH_POST VALUES(
 SEQ_TPNO.NEXTVAL, 
'이불',
'-홑이불, 담요, 누비이불 등 부피가 작은 침구류는 의류수거함에 넣거나 일반쓰레기(종량제봉투)로 버려요.
-솜이불, 오리털이불, 베개 등 부피가 큰 침구류는 잘라서 일반쓰레기(종량제봉투)로 버리거나 대형 생활 폐기물로 신고 배출해주세요.',
'-대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.
-대형 생활 폐기물로 배출할 때엔 이불이 바람에 날아가지 않게 잘 포개서 끈으로 단단히 묶거나 큰 비닐에 담아서 배출해주세요.',
'2024-03-03',
'2024-03-09',
'Y');

INSERT INTO TRASH_POST VALUES(
 SEQ_TPNO.NEXTVAL, 
'침대',
'-침대는 나무, 철 등으로 만들어진 침대 프레임과 스프링, 메모리폼, 라텍스 등으로 이루어진 매트리스 모두 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.
-이불, 매트리스 커버 등은 모두 벗겨낸 후 배출해요.
-면적이 넓은 침대 프레임은 수거시 트럭에 쉽게 실릴 수 있도록 최대한 분해해서 배출해요.',
'-사용기간이 10년 미만이고, 비교적 상태가 좋은 가구는 한국그린센터(→무료수거 절차 알아보기) 등의 기업을 통해 무료 수거를 신청할 수 있습니다. (현재 서울, 경기도 일부 지역에 한해 수거 가능)
-대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.
-대형 생활 폐기물로 배출할 때엔 이불이 바람에 날아가지 않게 잘 포개서 끈으로 단단히 묶거나 큰 비닐에 담아서 배출해주세요.',
'2024-03-04',
'2024-03-09',
'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'여행용가방',
'-여행용 가방은 플라스틱, 면, 고철 등 다양한 재질이 혼합되어 있고 종량제 봉투에도 담을 수 없는 크기이므로 대형 생활 폐기물로 신고 배출해야 합니다.
-대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.',
'-스티커를 발급받지 않고 길거리, 야산, 쓰레기 수거 장소에 몰래 버릴 경우 수거가 되지 않을 뿐만 아니라 무단 투기로 간주되어 폐기물관리법에 의거해 100만원 이하의 과태료가 부과됩니다.',
'2024-03-05',
'2024-03-09',
'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'매트리스',
'-스프링, 메모리폼, 라텍스 등으로 이루어진 침대 매트리스는 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.
-매트리스 커버, 토퍼 등은 제거한 후 배출해요.
-사용기간이 10년 미만이고, 비교적 상태가 좋은 가구는 한국그린센터(→무료수거 절차 알아보기) 등의 기업을 통해 무료 수거를 신청할 수 있습니다. (현재 서울, 경기도 일부 지역에 한해 수거 가능))
-대형 생활 폐기물 신고 및 수거는 유료이며, 가구의 크기에 따라 2,000원-10,000원 가량이 부과됩니다.',
'-대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.
-스티커를 발급받지 않고 길거리, 야산, 쓰레기 수거 장소에 몰래 버릴 경우 수거가 되지 않을 뿐만 아니라 무단 투기로 간주되어 폐기물관리법에 의거해 100만원 이하의 과태료가 부과됩니다.',
'2024-03-06',
'2024-03-09',
'Y');


INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'건전지',
'-스프링, 메모리폼, 라텍스 등으로 이루어진 침대 매트리스는 분리 및 재활용이 불가능해요. 대형 생활 폐기물로 신고 배출해주세요.
-매트리스 커버, 토퍼 등은 제거한 후 배출해요.
-사용기간이 10년 미만이고, 비교적 상태가 좋은 가구는 한국그린센터(→무료수거 절차 알아보기) 등의 기업을 통해 무료 수거를 신청할 수 있습니다. (현재 서울, 경기도 일부 지역에 한해 수거 가능))'
,'-대형 생활 폐기물 신고 및 수거는 유료이며, 가구의 크기에 따라 2,000원-10,000원 가량이 부과됩니다. 
-대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.
-스티커를 발급받지 않고 길거리, 야산, 쓰레기 수거 장소에 몰래 버릴 경우 수거가 되지 않을 뿐만 아니라 무단 투기로 간주되어 폐기물관리법에 의거해 100만원 이하의 과태료가 부과됩니다.'
,'2024-03-06'
,'2024-03-09'
,'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'우산',
'-다 쓴 건전지는 반드시 가까운 주민센터, 구청 또는 아파트 단지 내에 설치된 폐건전지 전용 수거함에 버려주세요.
-만약 가까운 곳에 폐건전지 수거함이 없다면 박스 등 한곳에 모아두었다가 양이 많아지면 한번에 버려주세요.'
,'-건전지에는 수은, 망간, 카드뮴 등 인체에 유해한 중금속 물질이 포함되어 있습니다. 만약 건전지를 일반쓰레기로 버려서 소각 또는 매립된다면 건전지 내부의 중금속이 대기, 토양, 하천으로 흘러드는 심각한 환경오염을 유발할 수 있습니다.
-폐건전지를 전용 수거함으로 잘 분리배출하면 건전지를 구성하는 망간, 아연 등의 금속을 추출하여 재활용하게 됩니다. 재활용 가치도 높고 재활용률도 매우 높은 자원이므로 반드시 폐건전지 전용수거함에 잘 분리배출해주세요.'
,'2024-03-07'
,'2024-03-09'
,'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'노트북배터리',
'-노트북 배터리는 리튬계 2차전지 폐기물로서 폐전지류로 분류되니 가까운 주민센터, 구청 또는 아파트 단지 내에 설치된 폐건전지 전용 수거함에 버려주세요.
-사업장에서 발생하는 폐건전지는 해당 지자체와의 협의를 통해 배출하시고, 유해 물질 유출 방지 등을 위해 전지류에 붙은 배선 등은 임의로 분리하지 않고 그대로 배출해주세요.'
,'-2020년말경부터 환경부는 전국 지자체 대상으로 2차전지 배터리류의 재활용을 적극 홍보하고 있어요.
-부풀어 오른 배터리를 물에 담그거나 손상시키며 압력을 가하면 매우 위험하니 충전부에 절연테이프를 덮는 등의 절연처리를 하여 버려주시면 안전하게 버리실 수 있어요.
-리튬이온 배터리는 용량이 크고, 자연 방전이 적지만 충격 등 물리적 압력을 받거나 다른 물질과 접촉해 화학 반응이 일어날 경우 폭발 가능성이 존재하기 때문에 일반쓰레기로 버리면 위험할 수 있습니다.
-또한 노트북 배터리를 일반쓰레기로 버려서 소각 또는 매립된다면 배터리 내부의 중금속이 대기, 토양, 하천으로 흘러드는 심각한 환경오염을 유발할 수 있습니다.
-노트북 배터리를 폐건전지 전용 수거함으로 잘 분리배출하면 니켈 등의 금속을 추출하여 재활용하게 됩니다. 재활용 가치도 높고 재활용률도 매우 높은 자원이므로 반드시 폐건전지 전용수거함에 잘 분리배출해주세요.'
,'2024-03-08'
,'2024-03-09'
,'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'이어폰',
'-이어폰에는 구리 등 재활용 가치가 있는 유가 금속이 포함되어 있지만 아직까지 명확한 분리배출 지침이나 수거 시스템이 없어 일반쓰레기(종량제봉투)로 분류됩니다.
-전선, 각종 케이블 등과 함께 한 곳에 모아두었다가 폐가전 무상방문수거 서비스를 이용해 다른 가전제품을 버릴 때 함께 배출할 것을 추천드립니다.
-가까운 주민센터 등 지자체에 비치된 소형 폐가전 전용 수거함으로 배출하는 방법도 있습니다. 전용 수거함이 없는 곳도 많으니 미리 전화 등으로 비치 여부를 확인해주세요.'
,'-이어폰(유선/무선/헤드폰)은 아직 명확한 분리수거 방법이 없어서 분리배출 지침상으론 일반쓰레기에 포함되지만 그냥 일반쓰레기(종량제봉투)로 버리면 재활용도 안될 뿐 아니라 중금속 등의 유해물질이 토양오염을 유발할 수 있습니다.'
,'2024-03-08'
,'2024-03-10'
,'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'식물',
'-죽은 식물은 일반쓰레기(종량제봉투)로 버려주세요.
-화분 흙은 집 밖 화단이나 야산에 버려도 되지만 흙이 이물질 등으로 오염이 심하다면 불연성 쓰레기 봉투(마대)에 담아서 버려주세요.'
,'-오염이 심하지 않은 흙의 경우 아파트에 거주중이시라면 아파트 관리사무소에 문의하여 아파트 화단에 버릴 수도 있어요.
-불연성 쓰레기 봉투는 지역 내 마트, 주민센터, 철물점 등에서 살 수 있어요. 하지만 안파는 곳도 많으니 판매여부를 미리 확인하고 방문하세요.
-불연성 쓰레기 봉투는 해당 지자체에 따라 불연재 쓰레기 봉투, 생활 폐기물 봉투, 특수 종량제 봉투 등으로 이름이 조금씩 다를 수 있어요. 모두 타지 않는 쓰레기를 담는 종량제 봉투라는 것과 마대 재질로 만들어졌다는 것을 기억해주세요.'
,'2024-03-08'
,'2024-03-09'
,'Y');

INSERT INTO TRASH_POST VALUES(
SEQ_TPNO.NEXTVAL, 
'휴대폰',
'<P>-한국전자제품자원순환공제조합에서 운영하는 폐휴대폰 수거서비스 (→바로가기)를 이용하면 폐휴대폰을 친환경적으로 재활용할 수 있고, 재활용을 통해 조성된 수익금은 기부기관에 전달됩니다.</p>
-배출하는 방법은 착불로 수도권자원순환센터에 택배 배송하면 됩니다. 보낼 주소는 다음 페이지에서 확인하세요. (→수도권자원순환센터 폐휴대폰 센터)
-배출 대상은 폐휴대폰 본체, 배터리, 충전기이며, 배터리나 충전기만 배출하는 것도 가능합니다.
-가까운 주민센터 등 지자체에 비치된 소형 폐가전 전용 수거함으로 배출해도 됩니다.'
,
'-2020년말경부터 환경부는 전국 지자체 대상으로 2차전지 배터리류의 재활용을 적극 홍보하고 있어요.
-휴대폰 내부에는 재활용 가치가 높은 금속 자원이 다수 포함되어 있어요.
-그냥 일반쓰레기(종량제봉투)로 버리면 중금속 등의 유해물질이 토양오염을 유발할 수 있습니다.'
,'2024-03-10'
,'2024-03-11'
,'Y');

DECLARE
    a NUMBER;
    b NUMBER := 1;
    c NUMBER := 1;
BEGIN
    FOR i IN 1..11 LOOP
        a := SEQ_TNO.NEXTVAL;
        INSERT INTO TRASH VALUES (
            a,
            b,
            c,
            c,
            'Y'
        );
         b := b + 1;
    END LOOP;
    COMMIT;
END;
/

INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 1, '소금.jpg', '소금.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 2, '이불.jpg', '이불.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 3, '침대.jpg', '침대.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 4, '여행용가방.jpg', '여행용가방.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 5, '매트리스.jpg', '매트리스.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 6, '건전지.jpg', '건전지.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 7, '우산.jpg', '우산.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 8, '노트북배터리.jpg', '노트북배터리.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 9, '이어폰.jpg', '이어폰.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 10, '식물.jpg', '식물.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');
INSERT INTO IMG_ATTACHMENT VALUES(SEQ_IATTNO.NEXTVAL, 11, '휴대폰.jpg', '휴대폰.jpg', 1 , 2, '2024-03-07', '2024-03-14', 'Y');

COMMIT;