-- /*================================================================*/
-- /*  システム研修 テーブル/データ作成スクリプト            2021.12 */
-- /*    データベース：jsysdb                                        */
-- /*  All Rights Reserved, Copyright(c) Fujitsu Learning Media Ltd. */
-- /*================================================================*/

use jsysdb;


-- /*================================================================*/
-- /*  得意先採番テーブル（customernumbering）テーブル削除          */
-- /*================================================================*/

DROP TABLE IF EXISTS customernumbering;


-- /*================================================================*/
-- /*  受注明細（orderdetails）テーブル削除                         */
-- /*================================================================*/

DROP TABLE IF EXISTS orderdetails;


-- /*================================================================*/
-- /*  受注（order）テーブル削除                                     */
-- /*================================================================*/

DROP TABLE IF EXISTS orders;


-- /*================================================================*/
-- /*  得意先（customer）テーブル削除                                */
-- /*================================================================*/

DROP TABLE IF EXISTS customer;


-- /*================================================================*/
-- /*  従業員（employee）テーブル削除                                */
-- /*================================================================*/

DROP TABLE IF EXISTS employee;


-- /*================================================================*/
-- /*  商品（item）テーブル削除                                      */
-- /*================================================================*/

DROP TABLE IF EXISTS item;


-- /*================================================================*/
-- /*  得意先採番テーブル（customernumbering）テーブル作成          */
-- /*================================================================*/

CREATE TABLE customernumbering (
  customercode INTEGER(4) NOT NULL
)engine=InnoDB;


-- /*================================================================*/
-- /*  得意先（customer）テーブル作成                                */
-- /*================================================================*/

CREATE TABLE customer (
  customercode VARCHAR(6),
  customername VARCHAR(32),
  customertelno VARCHAR(13),
  customerpostalcode VARCHAR(8),
  customeraddress VARCHAR(40),
  discountrate INTEGER(2),
  deleteflag BIT(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY(customercode)
)engine=InnoDB;


-- /*================================================================*/
-- /*  従業員（employee）テーブル作成                                */
-- /*================================================================*/

CREATE TABLE employee (
  employeeno VARCHAR(6),
  employeename VARCHAR(32),
  password VARCHAR(6),
  PRIMARY KEY(employeeno)
)engine=InnoDB;


-- /*================================================================*/
-- /*  商品（item）テーブル作成                                      */
-- /*================================================================*/

CREATE TABLE item (
  itemcode VARCHAR(6),
  itemname VARCHAR(32),
  price INTEGER(6),
  stock INTEGER(8),
  PRIMARY KEY(itemcode)
)engine=InnoDB;


-- /*================================================================*/
-- /*  受注（orders）テーブル作成                                    */
-- /*================================================================*/

CREATE TABLE orders (
  orderno VARCHAR(6),
  customercode VARCHAR(6),
  employeeno VARCHAR(6),
  totalprice INTEGER(12),
  detailnum INTEGER(2),
  deliverdate date,
  orderdate date,
  PRIMARY KEY(orderno)
)engine=InnoDB;


-- /*================================================================*/
-- /*  受注明細（order_details）テーブル作成                         */
-- /*================================================================*/

CREATE TABLE orderdetails (
  orderno VARCHAR(6),
  itemcode VARCHAR(6),
  ordernum INTEGER(4),
  orderprice INTEGER(10),
  PRIMARY KEY(orderno,itemcode)
)engine=InnoDB;


