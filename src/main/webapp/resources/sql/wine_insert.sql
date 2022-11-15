--insert

insert into member(id, pwd, name) values ('12345678','123245678','김말이');
insert into member_auth (id, auth) values ('12345678','ROLE_USER');

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

--상품 중복 추가--
insert into product (prodno, name_kr, name_en, kind, kind_con, price, content_1, content_2, image, mainprod)
(select product_seq.nextval, name_kr, name_en, kind, kind_con, price, content_1, content_2, image, mainprod from product);

insert into product (prodno, name_kr, name_en, kind, kind_con, price, content_1, content_2, image, mainprod)
(select product_seq.nextval, name_kr, name_en, kind, kind_con, price, content_1, content_2, image, mainprod from product);

commit;

insert into cart values (cart_seq.nextval, '12345678', 2, default, default);
insert into cart values (cart_seq.nextval, '12345678', 1, default, default);
insert into cart values (cart_seq.nextval, '12345678', 3, 2, default);
insert into cart values (cart_seq.nextval, '12345678', 5, 2, default);


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

--qna
INSERT INTO qna(qnano, subject ,content, reply,id,pwd, re, indate,reindate) 
VALUES(qna_seq.nextval,'쇼핑백 같이 보내주실 수 있나요?',
'선물하려는데 쇼핑백이 있으면 좋을 것 같아요','네 고객님 주문 상품 확인하여 쇼핑백 함께 보내드리겠습니다.','user1','1234','2',sysdate,sysdate);
commit;
INSERT INTO qna(qnano, subject ,content, reply, id,pwd, re, indate,reindate) 
VALUES(qna_seq.nextval,'배송이 얼마나 걸릴까요',
'방금 구매했는데 최대한 빨리 배송이 왔으면 합니다 급해서요',
'문의 주셔서 감사합니다.
주문하신 제품 내일 발송 예정입니다. 감사합니다.','user1','1234','2',sysdate,sysdate);

INSERT INTO qna(qnano, subject ,content, id,pwd,img, indate) 
VALUES(qna_seq.nextval,'기존 제품과 라벨 색이 달라서 문의드립니다.',
'리뉴얼 되었나요? 
병에 붙은 스티커 색이 다른곳에서 구매했을때와 다르네요',
'user2','1234','qna.jpg',sysdate);

INSERT INTO qna(qnano, subject ,content, id,pwd, indate) 
VALUES(qna_seq.nextval,'입고 문의 드립니다.',
'샤또 부에나 레드와인은 입고 예정없나요?',
'user3','1234',sysdate);

--review

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,1,'선물용으로 샀는데 완전 만족이에요!'
,'부모님께 보내드리려고 주문했어요!
저는 와인을 잘 몰라서 Somme에서 제공하는 취향별 추천 테스트를 이용했는데
잘 골랐다고 아주 좋아하셨어요
감사합니다 번창하세요!!','winereview7.jpg','user1','1234',sysdate, 2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,2,'꼼꼼하게 포장해 주셨어요'
,'두번째 주문인데 배송도 빠르고
항상 포장에 정성이 묻어나서 좋아요 감사해요
와인도 신선하고 부담없이 먹기 좋습니다','winereview6.jpg','user1','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,7,'친구들과 먹기 너무 좋아요'
,'호불호가 없을 맛이라서 좋았어요
샐러드랑도 잘어울려서 야채 싫어하는데
와인 마시느라 샐러드 엄청 먹었어요 ㅋㅋㅋㅋ','winereview8.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,3,'기분 내려고 구매해봤어요'
,'와인은 잘 모르지만 친구랑 멀리 여행온 김에
기분 내려고 구매해봤는데
배송도 빠르고 세심하게 챙겨주셔서 기분이 너무 좋았어요
사진도 예쁘게 잘나와서 너무 만족스러워요ㅎㅎㅎ','winereview.jpg','user2','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,4,'스파클링 와인중에서도 맛있어요'
,'스파클링의 화려함과 디아블로 아이콘의 독특함을 잘 담아내고 있습니다.
시트러스와 청사과의 아로마에 약간의 미네랄 풍미가 더해져있습니다.
모든 해산물과 잘 어울리며 특히, 초밥류의 회와 잘 어울립니다.','winereview2.jpg','user2','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, img, id,pwd, indate, best) 
VALUES(review_seq.nextval,5,'맛있어서 계속 주문하게 되네요'
,'먹어도 질리지가 않아서
주기적으로 주문하게 돼요
부드러워서 어떤 안주랑도 잘 어울리고
편하게 마실 수 있어요 추천합니다^^','winereview5.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,6,'덕분에 지인들과 즐거운 파티 했어요~'
,'좋은 와인 덕분에 지인들과 좋은 시간 보냈어요
맛도 포장도 정말 만족스럽습니다
지인들도 어디서 샀냐고 물어봐서 하나씩 선물해주려구요
감사합니다','winereview4.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,8,'좋은 와인 감사합니다^^'
,'배송이 맛있고 와인이 정말 빨라요~','user1','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,9,'믿고 구매하는 솜와인!'
,'레드 와인은 처음이라 도전하는 마음으로 주문했는데
기대 이상이네요 피자랑도 정말 잘어울려서
맛있게 먹었어요!','user2','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,7,'어디 놀러갈 때마다 찾아오게 되네요'
,'와인이 분위기 내기 좋으니까
항상 여기부터 들르게 되네요
이번에도 너무 잘 마셨어요
좋은 제품 감사합니다
다양한 와인 입고 많이 해주세요~','winereview3.jpg','user4','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,1,'빠른 배송 감사합니다'
,'촉박하게 주문했는데 빠른 배송 덕분에 잘 마셨어요 
같이 마신 친구도 맛있다고 좋아하네요
감사합니다','user3','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,1,'배송이 빠르고 포장이 꼼꼼해요'
,'다른 곳에서 한번 깨져서 온 적이 있어 걱정했는데
꼼꼼하게 포장되어 있어서 안심했어요^^','user1','1234',sysdate);

insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '사진이 너무 예뻐요!', 'user3',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '도움이 되었어요 감사합니다', 'user1',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '나도 이거 샀는데 맛있음', 'user1',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno)
values(reply_seq.nextval, 2, '담엔 이걸로 구매해봐야겠다~', 'user2',sysdate, reply_seq.CURRVAL);
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

Insert into qna(qnano, subject ,content, reply,img,id,pwd, re, indate,reindate) 
(select qna_seq.nextval, subject ,content, reply,img,id,pwd, re, indate,reindate from qna);
Insert into notice( noticeno, subject ,content,img, indate, id)
(select notice_seq.nextval,subject ,content,img, indate, id from notice);
Insert into review( reviewno, prodno, subject ,content,img, id, indate, count, pwd)
(select review_seq.nextval, prodno, subject ,content,img, id, indate, count, pwd from review);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
(select reply_seq.nextval, reviewno, reply, replyer,replydate, reply_seq.CURRVAL from reply);
commit;