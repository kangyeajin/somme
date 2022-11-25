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

-- 2. ȸ��
create table member(   
    id         varchar2(20)  primary key,
    pwd        varchar2(100),     
    name       varchar2(40),
    email      varchar2(40),
    zipnum    varchar2(7),
    addr1    varchar2(50),
    addr2    varchar2(50),
    phone      varchar2(20),
    bdate      varchar2(40), --����--
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

--3. ��ǰ(��ǰ��ȣ/��ǰ��/��ǰ����/�ǸŰ�/��ǰ����/��ǰ �̹���/��ǰ��������)
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

--4. ��ٱ���
create table cart(
    cartno number(10) primary key,
    userid varchar2(20) references member(id),
    prodno number(5) references product(prodno),
    no number(5) default 1,
    result char(1) default 1 -- ��� �� : 1, ��� �Ϸ� : 2
);
create sequence cart_seq start with 1 increment by 1; 
alter table cart add unique (userid, prodno);

------------------------------------------------------
--5. �ֹ�(�ֹ���ȣ/ �ֹ�ȸ�����̵�/�ֹ���)
create table payment(
    orderno number(10),
    userid varchar2(20) references member(id),
    indate date default sysdate);
    
alter table payment add constraint pk_orderno primary key (orderno);
create sequence payment_seq start with 1 increment by 1; 

--6. �ֹ���(�ֹ��󼼹�ȣ/�ֹ���ȣ/��ǰ��ȣ/�ֹ�����/��۳���/ó������)

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

--7. ��������(�۹�ȣ/����/����/�ۼ��ھ��̵�/�ۼ���)
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

--8. QNA(�۹�ȣ/����/���ǳ���/�̹���/�̹���2/�亯����/�ۼ��ھ��̵�/��й�ȣ/�亯 ����/�ۼ���)
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

--9. ����(�۹�ȣ/����/����/�ۼ��ھ��̵�/�ۼ���)
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

--10 ���⺰ ��õ
create table wineselect(
    resultno number(6) primary key,
    intro varchar2(50),
    img varchar2(80),
    subject varchar2(50),
    content varchar2(1000),
    prodno number(5) references product(prodno),
    count number(3) default 0);

--11 �̺�Ʈ �Խ���
create table event(
    eventno number(5) primary key,
    subject varchar2(100),
    url varchar2(1000),
    img varchar2(50),
    popimg varchar2(50),
    indate date default sysdate,
    upload char(1) default 1);

create sequence event_seq start with 1 increment by 1;

--�Խ��� ÷������
create table attach(
    uuid varchar2(100) not null,    
    uploadPath varchar2(200) not null,  --���� ���� ���ε� ���
    fileName varchar2(100) not null,    --���� �̸�
    filetype char(1) default 'I',       --�̹��� ����
    qnano number(5),                   --�Խù� ��ȣ
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

--���
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

--���ƿ�
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

insert into member(id,pwd,name) values('admin','$2a$10$Mx9rpJMkS0HzZZoriAHFfut3HuJKUo3ETpdYXd.PsGunDLGG6BwmG','������');
insert into member_auth (id, auth) values ('admin','ROLE_ADMIN');

INSERT INTO product
VALUES(product_seq.nextval,
'��� ������',
'REALM ABSURD',
'RED',
'USA',
30000,
'�ۼ���� �ְ��� ��Ƽ���� ����� �ٸ� ���ο� ������ ���� �ʰ� ���� �� �ִ� ����� ���� ������ �ִ� Ư�� �ؿ��� ���������. ������ ���Ǵ� ������ �� ������ ���� �ְ� �ټ� ������ ���� ������ ������ �� ������ ���� ���� �ְ� 12������ ���� ���� �ִ�. �ۼ��带 ���� ������ �ƹ��͵� ������ �� ���� �� ĵ������ �����ϸ� ������ ������ ��Ƽ�� �� �ְ��� ���� �븮 ������ ����� ������ ��õǴ� ��Ƽ������ ��а����� 100���� �۾��� ����.',
'wine_detail_REALM ABSURD.png',
'wine_REALM ABSURD.png','O');

INSERT INTO product
VALUES(product_seq.nextval,
'��ƺ�� ī������ �Һ�',
'DIABLO CABERNET SAUVIGNON',
'RED',
'CHILE',
'12900',
'��ÿ��� ����� ����� ���� ���ֻ��� ��� ������ ü���� �Ʒθ���� �ڵε��� ������� �Բ� Ÿ���� �ִ� ������ �δ���� �������� �̵�� �ٵ��� �����̸� ���� ���ɰ� �Ƿ��ϰ� �������� �������� ������ ������ �ִ� �����̴�.',
'wine_detail_DIABLO CABERNET SAUVIGNON.png',
'wine_DIABLO CABERNET SAUVIGNON.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'��� ���� ������� �� �ο���', 
'VINA ZORZAL LECCIONES DE VUELO',
'RED',
'SPAIN',
115000,
'�ι�Ʈ ��Ŀ 94���� ������ ���ٶ� ���� �ְ�� ����',
'wine_detail_VINA ZORZAL LECCIONES DE VUELO.png',
'wine_VINA ZORZAL LECCIONES DE VUELO.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'������� ��ī�� �ٽ�Ƽ',
'PRUNOTTO MOSCATO D`ASTI',
'SPARKLING',
'ITALY',
32000,
'�Ƿ��� ��¤���� ��� ��ī�þ� �� ���� ��糪�� ������ ������ ���� �������� ��ī�� �ٽ�Ƽ ��� ������ ù ���� ������ �ÿ��ϰ� ��ŭ�� �굵�� ������ ���븦 �����ְ� �־ ������ �ʴ� �ܸ��� Ư¡�� ��� ������� ȭ��Ʈ ����Ʈ �����̴�.',
'wine_detail_PRUNOTTO MOSCATO.png',
'wine_PRUNOTTO MOSCATO.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'�κ� X ��� ����ī ��Ŀ ����',
'INVIVO X SJP ROSE',
'ROSE',
'FRANCE',
27000,
'������ ���� ���ι潺�� ������������ ����� ������������ Ʈ������ ���� ��ȭ�� �̲�� SJP�� ����',
'wine_detail_INVIVO X SJP ROSE.png',
'wine_INVIVO X SJP ROSE.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'�ϵ� ������ ������ ī������',
'HARDYS STAMP SHIRAZ CABERNET',
'RED',
'AUSTRALIA',
12900,
'1938�⿡ ȣ�� ��ǥ�� ������� �ϵ��� ������ �ø����, �� �������� ���� ������ ��ġ�� ����',
'wine_detail_HARDYS STAMP SHIRAZ CABERNET.png',
'wine_HARDYS STAMP SHIRAZ CABERNET.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'���� �� ��񿡸� ȭ��Ʈ',
'CHATEAU LA LOUVIERE WHITE',
'WHITE',
'FRANCE',
98900,
'��� ������ ������ ���� �������� ��ǥ���� �����̾� ȭ��Ʈ ����',
'wine_detail_CHATEAU LA LOUVIERE WHITE.png',
'wine_CHATEAU LA LOUVIERE WHITE.png',
default);

INSERT INTO product
VALUES(product_seq.nextval,
'������ ������ ���۽�Ÿ�� (ȭ��Ʈ)',
'MARKUS MOLITOR SCHIEFERSTEIL',
'WHITE',
'GERMANY',
45000,
'���Ͼ�� ���۴� �����Ǿϡ�, �������� �����ĸ��� �̶� ���̴�. �̵� ���� �븮�� ����ƿ� ���� ��Ȯ�� ǥ���°� ���õ� �굵�� �ִ� �е����� ���̺��� ����ϰ� ������ش�.
<br>��︮�� ��: �ǽ� �� Ĩ��, ������, �±��� ġŲ��, Ŀ��',
'wine_detail_MARKUS MOLITOR SCHIEFERSTEIL.png',
'wine_MARKUS MOLITOR SCHIEFERSTEIL.png',
'O');

INSERT INTO product
VALUES(product_seq.nextval,
'������',
'CONT''UGO',
'WHITE',
'ITALY',
45000,
'���� ��� �÷��� ��� ü��, �����, �ڵ� ���� �˺��� �迭�� ���ϰ� �Բ� ���̿÷�, 
�ﳪ��, ������ ��ŷᰡ ��ȭ�Ӱ� ��췯�� �������� �Ʒθ��� ���� �� �ִ�. ����ó�� �ε巯��鼭 
�ܴ��� �������� ź�Ѱ� �ż��� �굵�� �뷱�� �������� ����ؼ� ���ϰ� ���ñ� ������ �������� ��� ���� �ǴϽ��� ���ӵȴ�.',
'wine_detail_CONTUGO.png',
'wine_CONTUGO.png',
'O');

commit;


--notice
INSERT INTO notice( noticeno, subject ,content,img, indate, id) 
VALUES(notice_seq.nextval,'������ ��� ����','������ ����� 9�� ��°�� ������ �������� �����մϴ�.
�ֹ��� �����ϳ� ������ ����� ������ �� �ִ� �� ���� ��Ź�帳�ϴ�.
�׻� Somme�� �̿��� �ֽô� ���Ե鲲 ����帳�ϴ�.
��ſ� �Ѱ��� �Ǽ���','notice.jpg',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content,indate, id) 
VALUES(notice_seq.nextval,'19���̸� �̼����ڿ��Դ� �Ǹ����� �ʽ��ϴ�.',
'���� Somme������ ��19���̸��� �̼����ڿ��Դ� �ַ��� �Ǹ����� �ʽ��ϴ�.
�ַ� �Ǹ� �� ����û ��ÿ� ���� �ֹ��ڿ� �ֹ������� ����û�� �����˴ϴ�.<br>
<small>*�������� ������ ���� ���Ǹ� �ź��� ��� ������ ���� ������ ������ ���� �� �ֽ��ϴ�.</small>',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content, indate, id) 
VALUES(notice_seq.nextval,'�ȳ��ϼ��� �����ø��ϴ�','������ Somme�� ã���ֽô� ���Ե鲲 �����մϴ�',sysdate,'admin');

INSERT INTO notice( noticeno, subject ,content, indate, id) 
VALUES(notice_seq.nextval,'���� �簡���� ���ְ� �̽��� ����','���� ���־��',sysdate,'admin');

commit;

--wineselect
INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(1,'������ ����','wine_CONTUGO.png','������','������ ��� �÷��� ���̸� ü��, �����, �ڵ� ���� �˺��� �迭�� ���ϰ� �Բ� ���̿÷�, �ﳪ��, ������ ��ŷᰡ ��ȭ�Ӱ� ��췯�� ������ �Ʒθ��� ���� �� �ֽ��ϴ�. ����ó�� �ε巴�� �ܴ��� �������� ź�Ѱ� �ż��� �굵�� �뷱�� �������� ����մϴ�. ��� ���� �ǴϽ��� ���ӵǴ�, ���� ���� �� 
�ִ� �����Դϴ�.',9);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(2,'�ε巯�� ����','wine_VINA ZORZAL LECCIONES DE VUELO.png','��� ���� ������� �� �ο���','�߰� ������ ���� ������ ���̸� �ڿ����� ����Ŀ��Ʈ,����� �� �ż��ϰ� �е� ���� ���� ������ �Ʒθ��� �������� �����̽��� �� ���ӽ��� ���� ���� �� �ֽ��ϴ�. �ε巯�� ź��, �߰� ������ �ٵ𰨰� �Բ� ��ä�ο� ���� ������ ���� ��������, �̳׶��� �� 
������ Ư¡���Դϴ�.',3);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(3,'�޴��� ����','wine_VINA ZORZAL LECCIONES DE VUELO.png','��� ���� ������� �� �ο���','�߰� ������ ���� ������ ���̸� �ڿ����� ����Ŀ��Ʈ,����� �� �ż��ϰ� �е� ���� ���� ������ �Ʒθ��� �������� �����̽��� �� ���ӽ��� ���� ���� �� �ֽ��ϴ�. �ε巯�� ź��, �߰� ������ �ٵ𰨰� �Բ� ��ä�ο� ���� ������ ���� ��������, �̳׶��� �� 
������ Ư¡���Դϴ�.',3);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(4,'������ ȭ��Ʈ','wine_MARKUS MOLITOR SCHIEFERSTEIL.png','������ ������ ���۽�Ÿ��','��¦�̴� ���� ������� ������ �������ϴ�. ����ƾ, �챸, �ݱ��� ���� �ڸ� ���������ϴ�. �Կ��� �鵵, ��ġ, ����� �� �� ������ ���������� ǳ�̰� ����ϰ�, ��� �������� ���� 
ǳ�̰� ��ǰ�Դϴ�.',8);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(5,'�ε巯�� ȭ��Ʈ','wine_CHATEAU LA LOUVIERE WHITE.png','���� �� ��񿡸� ȭ��Ʈ','�ŷ������� ��� ������ ������ ���� ���� �÷� ȭ��Ʈ �����Դϴ�. ������ �󵵴� �̵��������, �� �����Ƴ� ������ ���� �� ������ �Ʒθ��� �����ؼ� ��� ��Ŭ�� ���� ǳ�̰� �Ǿ�����ϴ�. �÷η��� ���ӽ��� ���̾� ��Ʈ���� ǳ�̷� ���ϸ� �� ���� ���� ä���, ������ �굵�� �Ǹ��� 
�뷱���� ����� ���ϴ�.',7);

INSERT INTO wineselect(resultno, intro, img, subject, content, prodno)
VALUES(6,'���� Ƣ�� ����Ŭ��','wine_PRUNOTTO MOSCATO.png','������� ��ī�� �ٽ�Ƽ','��ī�þ� �� ���� ��糪�� ������ ������ ���� �����Դϴ�. ��ī�� �ٽ�Ƽ�ٿ� ������ ù ���� ������ �ÿ��ϰ� ��ŭ�� �굵�� ������ ���븦 �����־� ������ �ʴ� 
�ܸ��� Ư¡�Դϴ�.',4);

commit;

INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'�����̺�Ʈ','/review/review_best','mainBanner_3.png',2);
INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'�������̺�Ʈ','','mainBanner_2.png',2);
INSERT INTO event(eventno, subject, url ,img,upload) 
VALUES(event_seq.nextval,'���⺰ ��õ','/wineselect/wineselect','mainBanner_4.png',2);
INSERT INTO event(eventno, subject, url ,img, popimg,upload) 
VALUES(event_seq.nextval,'�߼� ��ȹ��','','mainBanner_1.png','mainBanner_1_datail.jpg',2);
INSERT INTO event(eventno, subject, url ,img) 
VALUES(event_seq.nextval,'�߼� ���','','mainBanner_5.png');

commit;