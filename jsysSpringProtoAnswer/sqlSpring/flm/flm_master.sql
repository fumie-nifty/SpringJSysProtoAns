-- /*================================================================*/
-- /*  システム研修 テーブル/データ作成スクリプト            2020.09 */
-- /*    データベース：flm                                           */
-- /*  All Rights Reserved, Copyright(c) Fujitsu Learning Media Ltd. */
-- /*================================================================*/
use flm;

-- /*================================================================*/
-- /*  LOGINテーブル削除                                          */
-- /*================================================================*/
DROP TABLE IF EXISTS LOGIN;

-- /*================================================================*/
-- /*  SALARYテーブル削除                                          */
-- /*================================================================*/
DROP TABLE IF EXISTS SALARY;

-- /*================================================================*/
-- /*  EMPLOYEEテーブル削除                                          */
-- /*================================================================*/
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS EMPLOYEE2;
DROP TABLE IF EXISTS EMPLOYEEBK;

-- /*================================================================*/
-- /*  DEPARTMENTテーブル削除                                          */
-- /*================================================================*/
DROP TABLE IF EXISTS DEPARTMENT;

-- /*================================================================*/
-- /*  TYPEOFWORKテーブル削除                                          */
-- /*================================================================*/
DROP TABLE IF EXISTS TYPEOFWORK;


-- /*================================================================*/
-- /*  受注番号採番テーブル（ORDERNO_NUMBERING）テーブル削除          */
-- /*================================================================*/

DROP TABLE IF EXISTS ORDERNO_NUMBERING;

-- /*================================================================*/
-- /*  受注明細（ORDER_DETAILS）テーブル削除                         */
-- /*================================================================*/

DROP TABLE IF EXISTS ORDER_DETAILS;


-- /*================================================================*/
-- /*  受注（ORDERS）テーブル削除                                     */
-- /*================================================================*/

DROP TABLE IF EXISTS ORDERS;


-- /*================================================================*/
-- /*  MEMBERテーブル削除                                           */
-- /*================================================================*/
DROP TABLE IF EXISTS MEMBER;



-- /*================================================================*/
-- /*  ITEMテーブル削除                                           */
-- /*================================================================*/
DROP TABLE IF EXISTS ITEM;
DROP TABLE IF EXISTS ITEMBK;
DROP TABLE IF EXISTS ITEMCP;

-- /*================================================================*/
-- /*  CATEGORYテーブル削除                                           */
-- /*================================================================*/
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS CATEGORYBK;


-- /*================================================================*/
-- /*  DEPARTMENTテーブル作成                                          */
-- /*================================================================*/
CREATE TABLE DEPARTMENT (
  DEPARTMENT_ID INTEGER ,
  DEPARTMENT_NAME VARCHAR(30)  NOT NULL ,
  PRIMARY KEY(DEPARTMENT_ID)
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  EMPLOYEEテーブル作成                                          */
-- /*================================================================*/
CREATE TABLE EMPLOYEE (
  EMPLOYEE_ID INTEGER ,
  EMPLOYEE_NAME VARCHAR(30)  NOT NULL ,
  DEPARTMENT_ID INTEGER  NOT NULL ,
  PHONE VARCHAR(10)  ,
  PRIMARY KEY(EMPLOYEE_ID),
  FOREIGN KEY DEPARTMENT_FK (DEPARTMENT_ID)
      REFERENCES DEPARTMENT(DEPARTMENT_ID)
      ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE EMPLOYEE2 (
  EMPLOYEE_ID INTEGER ,
  EMPLOYEE_NAME VARCHAR(30)  NOT NULL ,
  DEPARTMENT_ID INTEGER  NOT NULL ,
  PHONE VARCHAR(10)  ,
  BOSS_ID INTEGER ,
  PRIMARY KEY(EMPLOYEE_ID),
  FOREIGN KEY DEPARTMENT_FK (DEPARTMENT_ID)
      REFERENCES DEPARTMENT(DEPARTMENT_ID)
      ON UPDATE CASCADE ,
  FOREIGN KEY BOSS_FK (BOSS_ID)
      REFERENCES EMPLOYEE2(EMPLOYEE_ID)
      ON UPDATE CASCADE
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  TYPEOFWORKテーブル作成                                        */
-- /*================================================================*/
CREATE TABLE TYPEOFWORK (
  TYPE_ID INTEGER ,
  TYPE_NAME VARCHAR(30)  NOT NULL 
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  SALARYテーブル作成                                            */
-- /*================================================================*/
CREATE TABLE SALARY (
  EMPLOYEE_ID INTEGER ,
  MONTH_BASE INTEGER  ,
  ORVERTIME_UNIT INTEGER ,
  PRIMARY KEY(EMPLOYEE_ID),
  FOREIGN KEY EMPLOYEE_FK (EMPLOYEE_ID)
      REFERENCES EMPLOYEE(EMPLOYEE_ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  LOGINテーブル作成                                            */
-- /*================================================================*/
CREATE TABLE LOGIN (
  EMPLOYEE_ID INTEGER ,
  PASSWORD VARCHAR(10) ,
  LAST_PASSWORD VARCHAR(10) ,
  UPDATE_DAY DATE ,
  PRIMARY KEY(EMPLOYEE_ID),  
  FOREIGN KEY LOGIN_FK (EMPLOYEE_ID)
      REFERENCES EMPLOYEE(EMPLOYEE_ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  CATEGORYテーブル作成                                           */
-- /*================================================================*/
CREATE TABLE CATEGORY (
  CATEGORY_CODE INTEGER ,
  CATEGORY_NAME VARCHAR(30)  NOT NULL ,
  DESCRIPTION VARCHAR(120) ,
  IMAGE_NAME VARCHAR(50) ,
  PRIMARY KEY(CATEGORY_CODE)
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  ITEMテーブル作成                                           */
-- /*================================================================*/
CREATE TABLE ITEM (
  ITEM_CODE VARCHAR(5) ,
  ITEM_NAME VARCHAR(60)  NOT NULL ,
  PRICE INTEGER NOT NULL ,
  DESCRIPTION VARCHAR(120) ,
  IMAGE_NAME VARCHAR(50) ,
  CATEGORY_CODE INTEGER ,
  STOCK INTEGER,
  PRIMARY KEY(ITEM_CODE),
  FOREIGN KEY CATEGORY_FK (CATEGORY_CODE)
      REFERENCES CATEGORY(CATEGORY_CODE)
      ON UPDATE CASCADE
)ENGINE=InnoDB;

--/*================================================================*/
--/*  MEMBER（会員）テーブル                                        */
--/*================================================================*/
CREATE TABLE MEMBER (
 MEMBER_ID    VARCHAR(255) ,
 PASSWORD       VARCHAR(64) NOT NULL,
 MEMBER_NAME    VARCHAR(80) NOT NULL,
 GENDER         CHAR(1)     ,
 ADDRESS        VARCHAR(160),
 PHONE          VARCHAR(15) ,
 MEMBER_RANK    VARCHAR(10) ,
 PRIMARY KEY(MEMBER_ID)
)ENGINE=InnoDB;

-- /*================================================================*/
-- /*  受注番号採番テーブル（ORDERNO_NUMBERING）テーブル作成          */
-- /*================================================================*/

CREATE TABLE ORDERNO_NUMBERING (
  ORDER_NO INTEGER NOT NULL
)ENGINE=InnoDB;


-- /*================================================================*/
-- /*  受注（ORDERS）テーブル作成                                    */
-- /*================================================================*/

CREATE TABLE ORDERS (
  ORDER_NO INTEGER,
  MEMBER_ID VARCHAR(255),
  TOTAL_PRICE INTEGER,
  ORDER_DATE date,
  PRIMARY KEY(ORDER_NO),
  FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
      ON UPDATE CASCADE
)ENGINE=InnoDB;


-- /*================================================================*/
-- /*  受注明細（ORDER_DETAILS）テーブル作成                         */
-- /*================================================================*/

CREATE TABLE ORDER_DETAILS (
  ORDER_NO INTEGER,
  ITEM_CODE VARCHAR(5),
  QUANTITY INTEGER,
  ORDER_PRICE INTEGER,
  SUB_TOTAL INTEGER,
  PRIMARY KEY(ORDER_NO,ITEM_CODE),
  FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO)
      ON DELETE CASCADE
      ON UPDATE CASCADE ,
  FOREIGN KEY (ITEM_CODE) REFERENCES ITEM(ITEM_CODE)
      ON UPDATE CASCADE
)ENGINE=InnoDB;


-- /*================================================================*/
-- /*  DEPARTMENTテーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO DEPARTMENT VALUES(10,'営業部');
INSERT INTO DEPARTMENT VALUES(20,'開発部');
INSERT INTO DEPARTMENT VALUES(30,'総務部');
INSERT INTO DEPARTMENT VALUES(40,'人事部');

-- /*================================================================*/
-- /*  EMPLOYEEテーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO EMPLOYEE VALUES(922101,'鈴木　一郎',10,'7715-3367');
INSERT INTO EMPLOYEE VALUES(922102,'田村　正人',20,'7700-2257');
INSERT INTO EMPLOYEE VALUES(922103,'松田　明美',20,'7700-2258');
INSERT INTO EMPLOYEE VALUES(922104,'浅井　順二',30,'7712-4416');
INSERT INTO EMPLOYEE VALUES(922105,'高橋　道夫',30,NULL);
INSERT INTO EMPLOYEE VALUES(922106,'夏木　裕子',30,'7712-3317');

-- /*================================================================*/
-- /*  EMPLOYEE2テーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO EMPLOYEE2 VALUES(922101,'鈴木　一郎',10,'7715-3367',NULL);
INSERT INTO EMPLOYEE2 VALUES(922102,'田村　正人',20,'7700-2257',NULL);
INSERT INTO EMPLOYEE2 VALUES(922103,'松田　明美',20,'7700-2258',922102);
INSERT INTO EMPLOYEE2 VALUES(922104,'浅井　順二',30,'7712-4416',NULL);
INSERT INTO EMPLOYEE2 VALUES(922105,'高橋　道夫',30,NULL,922104);
INSERT INTO EMPLOYEE2 VALUES(922106,'夏木　裕子',30,'7712-3317',922104);

-- /*================================================================*/
-- /*  TYPEOFWORKテーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO TYPEOFWORK VALUES(1,'出社');
INSERT INTO TYPEOFWORK VALUES(2,'在宅');

-- /*================================================================*/
-- /*  SALARYテーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO SALARY VALUES(922101,350000,11000);
INSERT INTO SALARY VALUES(922102,380000,12000);
INSERT INTO SALARY VALUES(922103,420000,15000);
INSERT INTO SALARY VALUES(922104,320000,9000);
INSERT INTO SALARY VALUES(922105,550000,18000);
INSERT INTO SALARY VALUES(922106,410000,14500);

-- /*================================================================*/
-- /*  LOGINテーブル データ挿入                                      */
-- /*================================================================*/
INSERT INTO LOGIN VALUES(922101,'pass','password','2021-03-01');
INSERT INTO LOGIN VALUES(922102,'pass','password','2021-03-01');
INSERT INTO LOGIN VALUES(922103,'pass','password','2021-03-01');
INSERT INTO LOGIN VALUES(922104,'pass','password','2021-03-01');
INSERT INTO LOGIN VALUES(922105,'pass','password','2021-03-01');
INSERT INTO LOGIN VALUES(922106,'pass','password','2021-03-01');



-- /*================================================================*/
-- /*  CATEGORYテーブル データ挿入                                   */
-- /*================================================================*/
INSERT INTO CATEGORY VALUES(10,'カップケーキ','デュラム小麦で作ったフランス直輸入の小麦粉で作ったカップケーキ','CupCake_Blueberry.png');
INSERT INTO CATEGORY VALUES(20,'マカロン','フランスで修業した職人による手作りマカロン','Macaron_Blueberry.png');
INSERT INTO CATEGORY VALUES(30,'ミルフィーユ','さくさく食感ミルフィーユ','Mille-feuille_ChocolateCustard.png');
INSERT INTO CATEGORY VALUES(40,'タルト','焼き菓子の王様。いろんなフルーツを盛ったタルト','Tarte_AlmondCassis.png');
INSERT INTO CATEGORY VALUES(50,'スペシャル','イベントごとのスペシャル商品。期間限定での販売となります','EventSpecial01.png');


-- /*================================================================*/
-- /*  ITEMテーブル データ挿入                                       */
-- /*================================================================*/
INSERT INTO ITEM VALUES( '10001','ブルーベリーカップケーキ',250 ,'ブルーベリーを練りこんだカップケーキです。' ,'CupCake_Blueberry.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10002','バタークリームカップケーキ',250 ,'バタークリームを練りこんだカップケーキです。' ,'CupCake_ButterCream.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10003','カシスカップケーキ',250 ,'カシスを練りこんだカップケーキです。' ,'CupCake_Cassis.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10004','チョコミントカップケーキ',250 ,'チョコミントを練りこんだカップケーキです。' ,'CupCake_ChocolateMint.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10005','抹茶カップケーキ',250 ,'抹茶を練りこんだカップケーキです。' ,'CupCake_GreenTea.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10006','ハロウィンカップケーキ',250 ,'かぼちゃを練りこんだカップケーキです。ご要望にお答えして通年販売しています。' ,'CupCake_Halloween.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10007','オレンジカップケーキ',250 ,'オレンジを練りこんだカップケーキです。' ,'CupCake_Orange.png' ,10 ,20);
INSERT INTO ITEM VALUES( '10008','ストロベリーカップケーキ',250 ,'いちごを練りこんだカップケーキです。' ,'CupCake_Strawberry.png' ,10,20);

INSERT INTO ITEM VALUES( '20001','ブルーベリーマカロン',300 ,'ブルーベリーを練りこんだマカロンです。' ,'Macaron_Blueberry.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20002','キャラメルマカロン',250 ,'キャラメルを練りこんだマカロンです。' ,'Macaron_Caramel.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20003','カシスマカロン',300 ,'カシスを練りこんだマカロンです。' ,'Macaron_Cassis.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20004','チョコマカロン',250 ,'チョコを練りこんだマカロンです。' ,'Macaron_Chocolate.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20005','クリスマスマカロン',350 ,'ツートンカラーのマカロンです。大切な日の贈り物に最適です。' ,'Macaron_ChristmasSpecial.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20006','コーヒーマカロン',250 ,'コーヒーを練りこんだマカロンです。' ,'Macaron_Coffee.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20007','レモンマカロン',300 ,'レモンを練りこんだマカロンです。' ,'Macaron_Lemon.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20008','抹茶マカロン',250 ,'抹茶を練りこんだマカロンです。' ,'Macaron_Maccha.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20009','ミントマカロン',300 ,'ミントを練りこんだマカロンです。' ,'Macaron_Mint.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20010','オレンジマカロン',250 ,'オレンジを練りこんだマカロンです。' ,'Macaron_Orange.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20011','ピスタチオマカロン',350 ,'ピスタチオを練りこんだマカロンです。' ,'Macaron_Pistachio.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20012','さくらマカロン',250 ,'さくらを練りこんだマカロンです。' ,'Macaron_Sakura.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20013','ストロベリーマカロン',270 ,'いちごの王様あまおうをを練りこんだマカロンです。' ,'Macaron_Strawberry.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20014','バニラマカロン',270 ,'最高級Aグレードバニラビーンズを使用したマカロンです。' ,'Macaron_Vanilla.png' ,20 ,20);
INSERT INTO ITEM VALUES( '20015','マカロンタワー',2000 ,'お誕生日パーティーでも大人気！最高級のマカロンをおしゃれなタワーでお届けします。' ,'Macaron_Tower.png' ,20 ,20);

INSERT INTO ITEM VALUES( '30001','チョコカスタードミルフィーユ',400 ,'チョコカスタード味のミルフィーユです。' ,'Mille-feuille_ChocolateCustard.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30002','いちごチョコレートミルフィーユ',400 ,'いちごチョコ味のミルフィーユです。' ,'Mille-feuille_ChocolateStrawberry.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30003','いちごカスタードミルフィーユ',400,'いちごカスタード味のミルフィーユです。' ,'Mille-feuille_CustardStrawberry.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30004','ダブルチョコレートミルフィーユ',400 ,'チョコ好きによるチョコ好きのためのミルフィーユです。' ,'Mille-feuille_DoubleChocolate.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30005','ダブルカスタードミルフィーユ',400 ,'カスタード好きのためのミルフィーユです。' ,'Mille-feuille_DoubleCustard.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30006','ダブルいちごトミルフィーユ',400 ,'いちご好きのためのミルフィーユです。' ,'Mille-feuille_DoubleStrawberry.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30007','チェリーミルフィーユ',450 ,'チェリーを載せた特別なミルフィーユです。' ,'Mille-feuille_SpecialCheery.png' ,30 ,20);
INSERT INTO ITEM VALUES( '30008','いちごスペシャルミルフィーユ',400 ,'いちごをふんだんに乗せたミルフィーユです。ダブルいちごを超えるおいしさです。' ,'Mille-feuille_SpecialStrawberry.png' ,30 ,20);

INSERT INTO ITEM VALUES( '40001','アーモンドカシスタルト',370 ,'アーモンドカシス味のタルトです。' ,'Tarte_AlmondCassis.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40002','アーモンドチョコタルト',370 ,'アーモンドチョコ味のタルトです。' ,'Tarte_AlmondChocolate.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40003','アーモンドシトラスタルト',370 ,'アーモンドシトラス味のタルトです。' ,'Tarte_AlmondCitrus.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40004','アーモンド抹茶タルト',370 ,'アーモンド抹茶味のタルトです。' ,'Tarte_AlmondMaccha.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40005','アーモンドいちごタルト',370 ,'アーモンドいちご味のタルトです。' ,'Tarte_AlmondStrawberry.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40006','アーモンドバニラタルト',370 ,'アーモンドバニラ味のタルトです。' ,'Tarte_AlmondVanilla.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40007','チョコカシスタルト',370 ,'チョコカシス味のタルトです。' ,'Tarte_ChocolateCassis.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40008','チョコシトラスタルト',370 ,'チョコシトラス味のタルトです。' ,'Tarte_ChocolateCitrus.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40009','チョコ抹茶タルト',370 ,'チョコ抹茶味のタルトです。' ,'Tarte_ChocolateMaccha.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40010','チョコパンプキンタルト',380 ,'黄色いかぼちゃのタルトです。' ,'Tarte_ChocolatePumpkin01.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40011','チョコパンプキンタルト',380 ,'緑のかぼちゃのタルトです。' ,'Tarte_ChocolatePumpkin02.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40012','チョコストロベリータルト',370 ,'チョコいちご味のタルトです。' ,'Tarte_ChocolateStrawberry.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40013','チョコバニラタルト',370 ,'チョコバニラ味のタルトです。' ,'Tarte_ChocolateVanilla.png' ,40 ,20);
INSERT INTO ITEM VALUES( '40014','ダブルチョコタルト',370 ,'濃厚なチョコレートタルトです。' ,'Tarte_DoubleChocolate.png' ,40 ,20);

INSERT INTO ITEM VALUES( '50001','さくら舞う',450 ,'桜モチーフのスペシャル商品です。期間限定のため、売り切れの場合もございます。' ,'EventSpecial01.png' ,50 ,20);
INSERT INTO ITEM VALUES( '50002','マリンブルー',450 ,'海モチーフのスペシャル商品です。海での失恋でぼくもブルー。' ,'EventSpecial02.png' ,50 ,20);
INSERT INTO ITEM VALUES( '50003','フレッシュグリーン',450 ,'新緑モチーフのスペシャル商品です。新入社員だったころを思い出します。' ,'EventSpecial03.png' ,50 ,20);
INSERT INTO ITEM VALUES( '50004','青春讃歌',450 ,'いちごとラズベリーで甘酸っぱい青春。' ,'EventSpecial04.png' ,50 ,20);


--/*================================================================*/
--/*  MEMBER（会員）情報                                            */
--/*================================================================*/
INSERT INTO MEMBER
VALUES ('yamada1@flm.com','flm','山田 一郎','M','東京都 大田区 池上1-1-1','03-1111-1111','A1');
INSERT INTO MEMBER
VALUES ('yamada2@flm.com','flm','山田 二郎','M','東京都 大田区 池上2-2-2','03-1111-2222','A1');
INSERT INTO MEMBER
VALUES ('yamada3@flm.com','flm','山田 三郎','M','東京都 大田区 池上3-3-3','03-1111-3333','A2');
INSERT INTO MEMBER
VALUES ('yamada4@flm.com','flm','山田 四郎','M','東京都 大田区 池上4-4-4','03-1111-4444','A3');
INSERT INTO MEMBER
VALUES ('yamada5@flm.com','flm','山田 五郎','M','東京都 大田区 池上5-5-5','03-1111-5555','A3');

-- /*================================================================*/
-- /*  受注番号採番（ORDERNO_NUMBERING）テーブル データ挿入           */
-- /*================================================================*/

INSERT INTO ORDERNO_NUMBERING VALUES(1000);

-- /*================================================================*/
-- /*  受注（ORDERS）テーブル データ挿入                             */
-- /*================================================================*/
INSERT INTO ORDERS VALUES (996,'yamada1@flm.com',1700,'2021-01-08');
INSERT INTO ORDERS VALUES (997,'yamada2@flm.com',1700,'2021-01-10');
INSERT INTO ORDERS VALUES (998,'yamada3@flm.com',750,'2021-02-10');
INSERT INTO ORDERS VALUES (999,'yamada1@flm.com',1240,'2021-02-15');
INSERT INTO ORDERS VALUES (1000,'yamada2@flm.com',1910,'2021-02-15');


-- /*================================================================*/
-- /*  受注明細（ORDER_DETAILS）テーブル データ挿入                  */
-- /*================================================================*/
INSERT INTO ORDER_DETAILS VALUES(996,'30001',2,400,800);
INSERT INTO ORDER_DETAILS VALUES(996,'50002',2,450,900);

INSERT INTO ORDER_DETAILS VALUES(997,'20001',2,300,600);
INSERT INTO ORDER_DETAILS VALUES(997,'20002',2,250,500);
INSERT INTO ORDER_DETAILS VALUES(997,'20003',2,300,600);

INSERT INTO ORDER_DETAILS VALUES(998,'10001',2,250,500);
INSERT INTO ORDER_DETAILS VALUES(998,'10002',1,250,250);

INSERT INTO ORDER_DETAILS VALUES(999,'10001',2,250,500);
INSERT INTO ORDER_DETAILS VALUES(999,'40001',3,370,740);

INSERT INTO ORDER_DETAILS VALUES(1000,'30001',2,400,800);
INSERT INTO ORDER_DETAILS VALUES(1000,'40007',2,370,740);
INSERT INTO ORDER_DETAILS VALUES(1000,'40014',1,370,370);

COMMIT;

