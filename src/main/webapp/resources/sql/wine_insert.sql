--insert

insert into member(id, pwd, name) values ('12345678','123245678','�踻��');
insert into member_auth (id, auth) values ('12345678','ROLE_USER');

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

--��ǰ �ߺ� �߰�--

INSERT INTO product
VALUES(product_seq.nextval,
'��� ������',
'REALM ABSURD',
'RED',
'USA',
30000,
'�ۼ���� �ְ��� ��Ƽ���� ����� �ٸ� ���ο� ������ ���� �ʰ� ���� �� �ִ� ����� ���� ������ �ִ� Ư�� �ؿ��� ���������. ������ ���Ǵ� ������ �� ������ ���� �ְ� �ټ� ������ ���� ������ ������ �� ������ ���� ���� �ְ� 12������ ���� ���� �ִ�. �ۼ��带 ���� ������ �ƹ��͵� ������ �� ���� �� ĵ������ �����ϸ� ������ ������ ��Ƽ�� �� �ְ��� ���� �븮 ������ ����� ������ ��õǴ� ��Ƽ������ ��а����� 100���� �۾��� ����.',
'wine_detail_REALM ABSURD.png',
'wine_REALM ABSURD.png',default);

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
default);

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
default);

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
default);

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
default);

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
default);

INSERT INTO product
VALUES(product_seq.nextval,
'��� ������',
'REALM ABSURD',
'RED',
'USA',
30000,
'�ۼ���� �ְ��� ��Ƽ���� ����� �ٸ� ���ο� ������ ���� �ʰ� ���� �� �ִ� ����� ���� ������ �ִ� Ư�� �ؿ��� ���������. ������ ���Ǵ� ������ �� ������ ���� �ְ� �ټ� ������ ���� ������ ������ �� ������ ���� ���� �ְ� 12������ ���� ���� �ִ�. �ۼ��带 ���� ������ �ƹ��͵� ������ �� ���� �� ĵ������ �����ϸ� ������ ������ ��Ƽ�� �� �ְ��� ���� �븮 ������ ����� ������ ��õǴ� ��Ƽ������ ��а����� 100���� �۾��� ����.',
'wine_detail_REALM ABSURD.png',
'wine_REALM ABSURD.png',default);

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
default);

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
default);

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
default);

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
default);

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
default);

--

commit;

insert into cart values (cart_seq.nextval, '12345678', 2, default, default);
insert into cart values (cart_seq.nextval, '12345678', 1, default, default);
insert into cart values (cart_seq.nextval, '12345678', 3, 2, default);
insert into cart values (cart_seq.nextval, '12345678', 5, 2, default);


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

--qna
INSERT INTO qna(qnano, subject ,content, reply,id,pwd, re, indate,reindate) 
VALUES(qna_seq.nextval,'���ι� ���� �����ֽ� �� �ֳ���?',
'�����Ϸ��µ� ���ι��� ������ ���� �� ���ƿ�','�� ���� �ֹ� ��ǰ Ȯ���Ͽ� ���ι� �Բ� �����帮�ڽ��ϴ�.','user1','1234','2',sysdate,sysdate);
commit;
INSERT INTO qna(qnano, subject ,content, reply, id,pwd, re, indate,reindate) 
VALUES(qna_seq.nextval,'����� �󸶳� �ɸ����',
'��� �����ߴµ� �ִ��� ���� ����� ������ �մϴ� ���ؼ���',
'���� �ּż� �����մϴ�.
�ֹ��Ͻ� ��ǰ ���� �߼� �����Դϴ�. �����մϴ�.','user1','1234','2',sysdate,sysdate);

INSERT INTO qna(qnano, subject ,content, id,pwd,img, indate) 
VALUES(qna_seq.nextval,'���� ��ǰ�� �� ���� �޶� ���ǵ帳�ϴ�.',
'������ �Ǿ�����? 
���� ���� ��ƼĿ ���� �ٸ������� ������������ �ٸ��׿�',
'user2','1234','qna.jpg',sysdate);

INSERT INTO qna(qnano, subject ,content, id,pwd, indate) 
VALUES(qna_seq.nextval,'�԰� ���� �帳�ϴ�.',
'���� �ο��� ��������� �԰� ����������?',
'user3','1234',sysdate);

--review

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,1,'���������� ��µ� ���� �����̿���!'
,'�θ�Բ� �����帮���� �ֹ��߾��!
���� ������ �� ���� Somme���� �����ϴ� ���⺰ ��õ �׽�Ʈ�� �̿��ߴµ�
�� ����ٰ� ���� �����ϼ̾��
�����մϴ� ��â�ϼ���!!','winereview7.jpg','user1','1234',sysdate, 2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,2,'�Ĳ��ϰ� ������ �ּ̾��'
,'�ι�° �ֹ��ε� ��۵� ������
�׻� ���忡 ������ ����� ���ƿ� �����ؿ�
���ε� �ż��ϰ� �δ���� �Ա� �����ϴ�','winereview6.jpg','user1','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,7,'ģ����� �Ա� �ʹ� ���ƿ�'
,'ȣ��ȣ�� ���� ���̶� ���Ҿ��
��������� �߾����� ��ä �Ⱦ��ϴµ�
���� ���ô��� ������ ��û �Ծ���� ��������','winereview8.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,3,'��� ������ �����غþ��'
,'������ �� ������ ģ���� �ָ� ����� �迡
��� ������ �����غôµ�
��۵� ������ �����ϰ� ì���ּż� ����� �ʹ� ���Ҿ��
������ ���ڰ� �߳��ͼ� �ʹ� �����������䤾����','winereview.jpg','user2','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,4,'����Ŭ�� �����߿����� ���־��'
,'����Ŭ���� ȭ���԰� ��ƺ�� �������� ��Ư���� �� ��Ƴ��� �ֽ��ϴ�.
��Ʈ������ û����� �Ʒθ��� �ణ�� �̳׶� ǳ�̰� �������ֽ��ϴ�.
��� �ػ깰�� �� ��︮�� Ư��, �ʹ���� ȸ�� �� ��︳�ϴ�.','winereview2.jpg','user2','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, img, id,pwd, indate, best) 
VALUES(review_seq.nextval,5,'���־ ��� �ֹ��ϰ� �ǳ׿�'
,'�Ծ �������� �ʾƼ�
�ֱ������� �ֹ��ϰ� �ſ�
�ε巯���� � ���ֶ��� �� ��︮��
���ϰ� ���� �� �־�� ��õ�մϴ�^^','winereview5.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,6,'���п� ���ε�� ��ſ� ��Ƽ �߾��~'
,'���� ���� ���п� ���ε�� ���� �ð� ���¾��
���� ���嵵 ���� �����������ϴ�
���ε鵵 ��� ��İ� ������� �ϳ��� �������ַ�����
�����մϴ�','winereview4.jpg','user3','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,8,'���� ���� �����մϴ�^^'
,'����� ���ְ� ������ ���� �����~','user1','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,9,'�ϰ� �����ϴ� �ؿ���!'
,'���� ������ ó���̶� �����ϴ� �������� �ֹ��ߴµ�
��� �̻��̳׿� ���ڶ��� ���� �߾�����
���ְ� �Ծ����!','user2','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content,img, id,pwd, indate, best) 
VALUES(review_seq.nextval,7,'��� ��� ������ ã�ƿ��� �ǳ׿�'
,'������ ������ ���� �����ϱ�
�׻� ������� �鸣�� �ǳ׿�
�̹����� �ʹ� �� ���̾��
���� ��ǰ �����մϴ�
�پ��� ���� �԰� ���� ���ּ���~','winereview3.jpg','user4','1234',sysdate,2);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,1,'���� ��� �����մϴ�'
,'�˹��ϰ� �ֹ��ߴµ� ���� ��� ���п� �� ���̾�� 
���� ���� ģ���� ���ִٰ� �����ϳ׿�
�����մϴ�','user3','1234',sysdate);

INSERT INTO review(reviewno, prodno, subject, content, id,pwd, indate) 
VALUES(review_seq.nextval,1,'����� ������ ������ �Ĳ��ؿ�'
,'�ٸ� ������ �ѹ� ������ �� ���� �־� �����ߴµ�
�Ĳ��ϰ� ����Ǿ� �־ �Ƚ��߾��^^','user1','1234',sysdate);

insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '������ �ʹ� ������!', 'user3',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '������ �Ǿ���� �����մϴ�', 'user1',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
values(reply_seq.nextval, 1, '���� �̰� ��µ� ������', 'user1',sysdate, reply_seq.CURRVAL);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno)
values(reply_seq.nextval, 2, '�㿣 �̰ɷ� �����غ��߰ڴ�~', 'user2',sysdate, reply_seq.CURRVAL);
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

Insert into qna(qnano, subject ,content, reply,img,id,pwd, re, indate,reindate) 
(select qna_seq.nextval, subject ,content, reply,img,id,pwd, re, indate,reindate from qna);
Insert into notice( noticeno, subject ,content,img, indate, id)
(select notice_seq.nextval,subject ,content,img, indate, id from notice);
Insert into review( reviewno, prodno, subject ,content,img, id, indate, count, pwd)
(select review_seq.nextval, prodno, subject ,content,img, id, indate, count, pwd from review);
insert into reply(replyno, reviewno, reply, replyer,replydate,reReplyno) 
(select reply_seq.nextval, reviewno, reply, replyer,replydate, reply_seq.CURRVAL from reply);
commit;