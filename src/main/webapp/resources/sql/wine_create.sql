drop table member_auth;
drop table persistent_logins;
drop table attach;
drop table love;
drop index idx_reply;
drop table reply;
drop table review;
DROP index idx_re;
drop table qna;
drop table notice;
drop table wineselect;
alter table cart drop primary key cascade;
drop table cart;
drop table event;

alter table payment drop primary key cascade;
drop table payment;
alter table product drop primary key cascade;
drop table product;
alter table member drop primary key cascade;
drop table member;
alter table order_detail drop primary key cascade;
drop table order_detail;

drop sequence order_detail_seq;
drop sequence payment_seq;
drop sequence cart_seq;
drop sequence product_seq;
drop sequence reply_seq;
drop sequence review_seq;
drop sequence qna_seq;
drop sequence notice_seq;
drop sequence event_seq;
drop sequence love_seq;

-----------------------------------------------

-- 2. 회원
create table member(   
    id         varchar2(20)  primary key,
    pwd        varchar2(100),     
    name       varchar2(40),
    email      varchar2(40),
    zipnum    varchar2(7),
    addr1    varchar2(50),
    addr2    varchar2(50),
    phone      varchar2(20),
    bdate      varchar2(40), --생일--
    agree1 varchar2(2),
    agree2 varchar2(2),
    useyn      char(1)    default 'y',
    indate     date       default sysdate
);

create table member_auth (
     id varchar2(50) not null,
     auth varchar2(50) not null,
     constraint fk_member_auth foreign key(id) references member(id)
);

create table persistent_logins(
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null);

commit;

--3. 상품(상품번호/상품명/상품종류/판매가/상품내용/상품 이미지/상품삭제여부)
create table product(
    prodno number(5),
    name_kr varchar2(100) not null,
    name_en varchar2(100) not null,
    kind varchar2(20) not null,
    kind_con varchar2(20) not null,
    price number(10) default 0,
    content_1 varchar2(2000), 
    content_2 varchar2(200) default 'default.jpg',
    image varchar2(200) default 'default.jpg',
    mainprod varchar2(2) default 'X');
    
alter table product add constraint pk_prodno primary key (prodno); 
create sequence product_seq start with 1 increment by 1; 

--4. 장바구니
create table cart(
    cartno number(10) primary key,
    userid varchar2(20) references member(id),
    prodno number(5) references product(prodno),
    no number(5) default 1,
    result char(1) default 1 -- 배송 전 : 1, 배송 완료 : 2
);
create sequence cart_seq start with 1 increment by 1; 
alter table cart add unique (userid, prodno);

------------------------------------------------------
--5. 주문(주문번호/ 주문회원아이디/주문일)
create table payment(
    orderno number(10),
    userid varchar2(20) references member(id),
    indate date default sysdate);
    
alter table payment add constraint pk_orderno primary key (orderno);
create sequence payment_seq start with 1 increment by 1; 

--6. 주문상세(주문상세번호/주문번호/상품번호/주문수량/배송내용/처리여부)

create table order_detail(
    detailno number(10),
    orderno number(10) references payment(orderno),
    prodno number(5) references product(prodno),
    userid varchar2(20) references member(id),
    num number(5),
    message varchar2(100),
    zipnum    varchar2(7),
    addr1    varchar2(100),
    addr2    varchar2(100),
    phone varchar2(50),
    result char(1) default 1);
    
alter table order_detail add constraint pk_detailno primary key (detailno); 
create sequence order_detail_seq start with 1 increment by 1;
--------------------------------------------------

--7. 공지사항(글번호/제목/내용/작성자아이디/작성일)
create table notice(
    noticeno number(5),
    subject varchar2(100),
    content varchar2(1000),
    img varchar2(50),
    id varchar2(50) references member(id),
    indate date default sysdate,
    count number(5) default 0);
alter table notice add constraint pk_notice
primary key (noticeno);
create sequence notice_seq start with 1 increment by 1;

--8. QNA(글번호/제목/문의내용/이미지/이미지2/답변내용/작성자아이디/비밀번호/답변 유무/작성일)
create table qna(
    qnano number(5),
    subject varchar2(100),
    content varchar2(1000),
    img varchar2(50),
    id varchar2(20) references member(id),
    pwd varchar2(20) not null,
    re char(1) default 1,
    indate date default sysdate,
    count number(5) default 0,
    reply varchar2(1000),
    reindate date);
alter table qna add constraint pk_qna
primary key (qnano);
create sequence qna_seq start with 1 increment by 1;
create index idx_re on qna (re desc, qnano);

--9. 리뷰(글번호/제목/내용/작성자아이디/작성일)
create table review(
    reviewno number(5),
    prodno number(5) references product(prodno),
    subject varchar2(100),
    content varchar2(1000),
    img varchar2(50),
    id varchar2(20) references member(id),
    pwd varchar2(20) not null,
    indate date default sysdate,
    count number(5) default 0,
    best char(1) default 1);
alter table review add constraint pk_review
primary key (reviewno);
create sequence review_seq start with 1 increment by 1;

--10 취향별 추천
create table wineselect(
    resultno number(6) primary key,
    intro varchar2(50),
    img varchar2(80),
    subject varchar2(50),
    content varchar2(1000),
    prodno number(5) references product(prodno),
    count number(3) default 0);

--11 이벤트 게시판
create table event(
    eventno number(5) primary key,
    subject varchar2(100),
    url varchar2(1000),
    img varchar2(50),
    popimg varchar2(50),
    indate date default sysdate,
    upload char(1) default 1);

create sequence event_seq start with 1 increment by 1;

--게시판 첨부파일
create table attach(
    uuid varchar2(100) not null,    
    uploadPath varchar2(200) not null,  --실제 파일 업로드 경로
    fileName varchar2(100) not null,    --파일 이름
    filetype char(1) default 'I',       --이미지 여부
    qnano number(5),                   --게시물 번호
    reviewno number(5),
    noticeno number(5),
    eventno number(5)
);
alter table attach add constraint pk_attach primary key(uuid);
alter table attach add constraint fk_qna_attach foreign key (qnano)
references qna(qnano);
alter table attach add constraint fk_review_attach foreign key (reviewno)
references review(reviewno);
alter table attach add constraint fk_notice_attach foreign key (noticeno)
references notice(noticeno);
alter table attach add constraint fk_event_attach foreign key (eventno)
references event(eventno);

--댓글
create table reply (
  replyno number(5), 
  reviewno number(5) references review(reviewno) on delete cascade,
  reSum number default 0,
  reply varchar2(1000) not null,
  replyer varchar2(50) references member(id), 
  replyDate date default sysdate, 
  updateDate date default sysdate,
  nth number(5) default 0,
  reReplyno number(5)
);
alter table reply add constraint pk_reply primary key (replyno);
create sequence reply_seq;
create index idx_reply on reply (rereplyno, nth, replyno);

--좋아요
create table love(
    loveno number(5),
	reviewno number(5) references review(reviewno) on delete cascade,
	id varchar2(20),
	loveyn number(5) default 0);
alter table love add constraint pk_love primary key (loveno);
create sequence love_seq start with 1 increment by 1;

--view
CREATE OR REPLACE VIEW review_view
AS
SELECT 
reviewno, R.prodno, subject, name_kr, img, best, image
FROM review R, product P
WHERE R.prodno = P.prodno;

CREATE OR REPLACE VIEW order_view
AS
SELECT 
o.detailno, o.orderno, o.prodno, o.num, o.message, o.result, o.userid, 
p.indate, m.name, m.email, o.zipnum, o.addr1, o.addr2, o.phone,
prod.name_kr, prod.name_en, prod.price, prod.image
FROM payment p, order_detail o, member m, product prod
WHERE m.id = p.userid 
and prod.prodno = o.prodno 
and p.orderno = o.orderno
ORDER BY o.orderno DESC;

commit;