-- /*================================================================*/
-- /*  システム研修 データベース作成スクリプト               2021.01 */
-- /*  All Rights Reserved, Copyright(c) Fujitsu Learning Media Ltd. */
-- /*================================================================*/
-- /*================================================================*/
-- /*  flmデーターベースの作成                                       */
-- /*================================================================*/
drop database if exists flm;
create database flm;

-- /*================================================================*/
-- /*  jsysdbデーターベースの作成                                    */
-- /*================================================================*/
drop database if exists jsysdb;
create database jsysdb;

--/*================================================================*/
--/*  ユーザー作成                                                  */
--/*================================================================*/
drop user if exists 'mysql'@localhost;
drop user if exists 'mysql'@'%';

create user 'mysql'@'localhost' identified with mysql_native_password by 'mysql';
create user 'mysql'@'%' identified with mysql_native_password by 'mysql';

--/*================================================================*/
--/*  権限設定                                                      */
--/*================================================================*/
grant all on flm.* to 'mysql'@localhost;
grant all on flm.* to 'mysql'@'%';
grant all on jsysDB.* to 'mysql'@localhost;
grant all on jsysDB.* to 'mysql'@'%';

