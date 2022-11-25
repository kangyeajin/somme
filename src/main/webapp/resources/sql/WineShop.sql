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

alter table payment drop primary key cascade;
alter table product drop primary key cascade;
alter table member drop primary key cascade;
alter table order_detail drop primary key cascade;

--insert

insert into member(id,pwd,name) values('admin','$2a$10$Mx9rpJMkS0HzZZoriAHFfut3HuJKUo3ETpdYXd.PsGunDLGG6BwmG','관리자');
insert into member_auth (id, auth) values ('admin','ROLE_ADMIN');

INSERT INTO product
VALUES(product_seq.nextval,
'뤠암 업서드',
'REALM ABSURD',
'RED',
'USA',
30000,
'앱서드는 최고의 빈티지에 뤠암의 다른 와인에 영향을 주지 않고 만들 수 있는 충분한 양의 포도가 있는 특정 해에만 만들어진다. 블렌딩에 사용되는 포도는 한 종류일 수도 있고 다섯 종류일 수도 있으며 포도밭 한 곳에서 나올 수도 있고 12곳에서 나올 수도 있다. 앱서드를 만들 때마다 아무것도 정해진 것 없는 빈 캔버스로 시작하며 유일한 목적은 빈티지 중 최고의 나파 밸리 와인을 만드는 것으로 출시되는 빈티지마다 평론가들의 100점을 휩쓰는 와인.',
'wine_detail_REALM ABSURD.png',
'wine_REALM ABSURD.png','O');

INSERT INTO product
VALUES(product_seq.nextval,
'디아블로 카베르네 소비뇽',
'DIABLO CABERNET SAUVIGNON',
'RED',
'CHILE',
'12900',
'까시에로 까베르네 쇼비뇽은 진한 자주색을 띠며 농익은 체리의 아로마향과 자두등의 과일향과 함께 타닌이 주는 질감이 부담없이 느껴지는 미디엄 바디의 와인이며 맛과 부케가 훌룡하고 균형잡힌 구조감과 여운을 가지고 있는 와인이다.',
'wine_detail_DIABLO CABERNET SAUVIGNON.png',
'wine_DIABLO CABERNET SAUVIGNON.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'비냐 조잘 레찌오네 데 부엘로', 
'VINA ZORZAL LECCIONES DE VUELO',
'RED',
'SPAIN',
115000,
'로버트 파커 94점에 빛나는 나바라 지역 최고급 와인',
'wine_detail_VINA ZORZAL LECCIONES DE VUELO.png',
'wine_VINA ZORZAL LECCIONES DE VUELO.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'프루노토 모스카토 다스티',
'PRUNOTTO MOSCATO D`ASTI',
'SPARKLING',
'ITALY',
32000,
'또렷한 볏짚색을 띠고 아카시아 꿀 향기와 산사나무 열매의 내음을 가진 와인으로 모스카토 다스티 답게 달콤한 첫 맛도 좋지만 시원하고 상큼한 산도가 와인의 뼈대를 받쳐주고 있어서 질리지 않는 단맛이 특징인 고급 약발포성 화이트 스위트 와인이다.',
'wine_detail_PRUNOTTO MOSCATO.png',
'wine_PRUNOTTO MOSCATO.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'인비보 X 사라 제시카 파커 로제',
'INVIVO X SJP ROSE',
'ROSE',
'FRANCE',
27000,
'로제의 성지 프로방스와 남프랑스에서 생산된 로제와인으로 트렌디한 와인 문화를 이끌어갈 SJP의 선택',
'wine_detail_INVIVO X SJP ROSE.png',
'wine_INVIVO X SJP ROSE.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'하디스 스탬프 쉬라즈 카베르네',
'HARDYS STAMP SHIRAZ CABERNET',
'RED',
'AUSTRALIA',
12900,
'1938년에 호주 우표로 만들어진 하디의 스탬프 시리즈로, 전 세계인이 즐기는 생동감 넘치는 와인',
'wine_detail_HARDYS STAMP SHIRAZ CABERNET.png',
'wine_HARDYS STAMP SHIRAZ CABERNET.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'샤또 라 루비에르 화이트',
'CHATEAU LA LOUVIERE WHITE',
'WHITE',
'FRANCE',
98900,
'장기 숙성이 가능한 뻬삭 레오냥의 대표적인 프리미엄 화이트 와인',
'wine_detail_CHATEAU LA LOUVIERE WHITE.png',
'wine_CHATEAU LA LOUVIERE WHITE.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'마르쿠스 몰리터 쉬퍼스타일 (화이트)',
'MARKUS MOLITOR SCHIEFERSTEIL',
'WHITE',
'GERMANY',
45000,
'독일어로 쉬퍼는 “점판암”, 스테일은 “가파른” 이란 뜻이다. 미들 모젤 밸리의 떼루아에 대한 정확한 표현력과 세련된 산도가 주는 밀도감이 테이블을 우아하게 만들어준다.
<br>어울리는 페어링: 피쉬 앤 칩스, 조개찜, 태국식 치킨윙, 커리',
'wine_detail_MARKUS MOLITOR SCHIEFERSTEIL.png',
'wine_MARKUS MOLITOR SCHIEFERSTEIL.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'콘투고',
'CONT''UGO',
'WHITE',
'ITALY',
45000,
'강한 루비 컬러를 띄며 체리, 라즈베리, 자두 같은 검붉은 계열의 과일과 함께 바이올렛, 
삼나무, 달콤한 향신료가 조화롭게 어우러져 복합적인 아로마를 느낄 수 있다. 벨벳처럼 부드러우면서 
단단한 구조감의 탄닌과 신선한 산도의 밸런스 균형감이 우수해서 편하게 마시기 좋으며 오랫동안 기분 좋은 피니쉬가 지속된다.',
'wine_detail_CONTUGO.png',
'wine_CONTUGO.png',
'O');

commit;


--notice
INSERT INTO notice( noticeno, subject ,content,img, indate, id) 
VALUES(notice_seq.nextval,'연휴전 배송 공지','연휴전 배송은 9월 둘째주 수요일 오전까지 마감합니다.
주문은 가능하나 연휴전 배송은 어려우실 수 있는 점 참고 부탁드립니다.
항상 Somme을 이용해 주시는 고객님들께 감사드립니다.
즐거운 한가위 되세요','notice.jpg',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content,indate, id) 
VALUES(notice_seq.nextval,'19세미만 미성년자에게는 판매하지 않습니다.',
'저희 Somme에서는 만19세미만의 미성년자에게는 주류를 판매하지 않습니다.
주류 판매 시 국세청 고시에 따라 주문자와 주문정보가 국세청에 제공됩니다.<br>
<small>*개인정보 제공에 대한 동의를 거부할 경우 원할한 서비스 제공에 제한을 받을 수 있습니다.</small>',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content, indate, id) 
VALUES(notice_seq.nextval,'안녕하세요 공지올립니다','언제나 Somme을 찾아주시는 고객님들께 감사합니다',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content, indate, id) 
VALUES(notice_seq.nextval,'와인 사가세요 맛있고 싱싱한 와인','와인 맛있어요',sysdate,'admin');

commit;

--wineselect
INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(1,'묵직한 레드','wine_CONTUGO.png','콘투고','강렬한 루비 컬러를 보이며 체리, 라즈베리, 자두 같은 검붉은 계열의 과일과 함께 바이올렛, 삼나무, 달콤한 향신료가 조화롭게 어우러져 복합적 아로마를 느낄 수 있습니다. 벨벳처럼 부드럽고 단단한 구조감의 탄닌과 신선한 산도의 밸런스 균형감이 우수합니다. 기분 좋은 피니쉬가 지속되는, 편히 마실 수 
있는 와인입니다.',9);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(2,'부드러운 레드','wine_VINA ZORZAL LECCIONES DE VUELO.png','비냐 조잘 레찌오네 데 부엘로','중간 강도의 밝은 루비색을 보이며 코에서는 레드커런트,라즈베리 등 신선하고 밀도 높은 붉은 과일의 아로마를 바탕으로 스파이스와 흙 뉘앙스를 옅게 느낄 수 있습니다. 부드러운 탄닌, 중간 강도의 바디감과 함께 다채로운 붉은 과일의 맛이 느껴지며, 미네랄과 긴 
여운이 특징적입니다.',3);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(3,'달달한 레드','wine_VINA ZORZAL LECCIONES DE VUELO.png','비냐 조잘 레찌오네 데 부엘로','중간 강도의 밝은 루비색을 보이며 코에서는 레드커런트,라즈베리 등 신선하고 밀도 높은 붉은 과일의 아로마를 바탕으로 스파이스와 흙 뉘앙스를 옅게 느낄 수 있습니다. 부드러운 탄닌, 중간 강도의 바디감과 함께 다채로운 붉은 과일의 맛이 느껴지며, 미네랄과 긴 
여운이 특징적입니다.',3);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(4,'묵직한 화이트','wine_MARKUS MOLITOR SCHIEFERSTEIL.png','마르쿠스 몰리터 쉬퍼스타일','반짝이는 옅은 레몬색이 눈길을 사로잡습니다. 망고스틴, 살구, 금귤의 향이 코를 간지럽힙니다. 입에선 백도, 리치, 서양배 등 흰 과육과 베르가못의 풍미가 우아하고, 여운에 느껴지는 레몬 
풍미가 일품입니다.',8);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(5,'부드러운 화이트','wine_CHATEAU LA LOUVIERE WHITE.png','샤또 라 루비에르 화이트','매력적으로 밝게 빛나는 투명한 페일 옐로 컬러 화이트 와인입니다. 부케의 농도는 미디엄정도로, 흰 복숭아나 퀸스와 같은 흰 과일의 아로마로 시작해서 허니 서클과 벌꿀 풍미가 피어오릅니다. 플로럴한 뉘앙스는 곧이어 시트러스 풍미로 변하며 입 안을 가득 채우고, 적절한 산도는 훌륭한 
밸런스를 만들어 냅니다.',7);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(6,'톡톡 튀는 스파클링','wine_PRUNOTTO MOSCATO.png','프루노토 모스카토 다스티','아카시아 꿀 향기와 산사나무 열매의 내음을 가진 와인입니다. 모스카토 다스티다운 달콤한 첫 맛도 좋지만 시원하고 상큼한 산도가 와인의 뼈대를 받쳐주어 질리지 않는 
단맛이 특징입니다.',4);

commit;

INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'리뷰이벤트','/review/review_best','mainBanner_3.png',2);
INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'무료배송이벤트','','mainBanner_2.png',2);
INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'취향별 추천','/wineselect/wineselect','mainBanner_4.png',2);
INSERT INTO event(eventno, subject, url ,img, popimg,upload) 
VALUES(event_seq.nextval,'추석 기획전','','mainBanner_1.png','mainBanner_1_datail.jpg',2);
INSERT INTO event(eventno, subject, url ,img) 
VALUES(event_seq.nextval,'추석 배송','','mainBanner_5.png');

commit;