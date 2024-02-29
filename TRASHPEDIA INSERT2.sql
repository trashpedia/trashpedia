-- 회원 가입
DECLARE
    a NUMBER;
BEGIN
    FOR i IN 1..70 LOOP
        a := SEQ_MNO.NEXTVAL;
        INSERT INTO MEMBER VALUES (
            a,
            DEFAULT,
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
            '<h2>댓글 입니다</h2><h1>test</h1>',
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
            '<h2>대댓글 입니다</h2><h1>test</h1>',
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