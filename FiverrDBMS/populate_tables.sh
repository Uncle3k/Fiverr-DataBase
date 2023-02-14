#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "suhassan/11213803@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
INSERT INTO SERVICELEVEL VALUES(1, 'Basic', '231', 'Enter desc', '100','30');
INSERT INTO SERVICELEVEL VALUES(4, 'Premium', '31', 'Enter desc', '30','5');
INSERT INTO SERVICELEVEL VALUES(5, 'Basic', '13', 'Enter desc', '120','60');
INSERT INTO SERVICELEVEL VALUES(6, 'Basic', '43', 'Enter desc', '60','3');
INSERT INTO SERVICELEVEL VALUES(7, 'Standard', '341', 'Enter desc', '15','10');
INSERT INTO SERVICELEVEL VALUES(8, 'Standard', '341', 'Enter desc', '200','5');
INSERT INTO SERVICELEVEL VALUES(2, 'Premium', '213', 'Enter desc', '45','32');
INSERT INTO SERVICELEVEL VALUES(3, 'Premium', '213', 'Enter desc', '75','90');
INSERT INTO PAYMENT VALUES(1, '23.0' ,'0.0' ,'debit' , '47 bicayne crescent',  '22-10-19');
INSERT INTO PAYMENT VALUES(2, '1002.0', '21.0', 'credit', '21 biscayne crescent', '22-10-12');
INSERT INTO PAYMENT VALUES(3, '1213.0',  '314.0' ,  'credit' , 'kightbrigde' , '22-10-20');
INSERT INTO PAYMENT VALUES(4,  '213.0' ,  '21.0' ,   'debit' ,  '231 checker' , '22-10-17');
INSERT INTO PAYMENT VALUES(5,  '80.0'  ,  '20.0' ,   'debit'  ,  '2313 street' ,   '21-10-09');
INSERT INTO PAYMENT VALUES(6,  '421.0' ,   '5.0' ,   'credit' ,   '213 Street' ,   '20-06-18');
INSERT INTO ACCOUNT VALUES('ShaheerHassan02' ,  1, '341c34',  '2@gmail.com',  'Shaheer');
INSERT INTO ACCOUNT VALUES('Sharjeelk1' , 3 , 'da341341'  , '2311@gmail.com'  ,  'Sharjeel');
INSERT INTO ACCOUNT VALUES('Illogical' ,  4 ,   'sad413413'  ,  'sad1@gmail.com' ,   'Tameem');
INSERT INTO ACCOUNT VALUES('Anask2'  ,  5  ,  '213251' ,   '31@gmail.com'  ,  'Anas');
INSERT INTO ACCOUNT VALUES('Ruhail21' ,   6   , '13231'  ,  '23134da@gmail.com'  ,  'Ruhail');
INSERT INTO ACCOUNT VALUES('Rudy12Gay'  ,  7  ,  '23123'   , '312d1d@gmail.com'  ,  'Rudy Gay');
INSERT INTO ACCOUNT VALUES('Ytball54321' ,   8 ,   'sad2312t4'  ,  '231d1a@gmail.com'  ,  'Yash');
INSERT INTO  REVIEWS VALUES('Shaheer'  ,  '3' ,   'Website Design'  ,  '22-10-11' ,  'Tech');
INSERT INTO  REVIEWS VALUES('Muhammad' , '3' , 'Soccer Trainer' , '22-10-11' , 'Sport');
INSERT INTO  REVIEWS VALUES('Sharjeel'   , '4'  ,  'Skills Trainer'  ,  '22-10-03'  ,  'Sport');
INSERT INTO  REVIEWS VALUES('Tameem'  ,  '1'  ,  'Refree'  ,  '22-08-17',  'Sport');
INSERT INTO  REVIEWS VALUES('Anas'  ,  '3'  ,  'Physics'  ,  '22-10-22'  ,  'Tutor');
INSERT INTO  REVIEWS VALUES('Ruhail'  ,  '5'  ,  'Mother Figure'  ,  '22-10-03'  ,  'Parenting');
INSERT INTO  REVIEWS VALUES('Rudy Gay'  ,  '5'  ,  'Father Figure'  ,  '22-10-03' ,  'Parenting');
INSERT INTO  REVIEWS VALUES('Yash'  ,  '1'  ,  'Basketball Trainer' ,   '22-10-11'  ,  'Sport');
INSERT INTO  SELLER VALUES('100' ,  '1000'  ,  '50'  ,  '40' ,  '100'  ,  '1');
INSERT INTO  SELLER VALUES('70'  ,  '4000'  ,  '50'  ,  '90'  ,  '20'  ,  '2');
INSERT INTO  SELLER VALUES('80'  ,  '70000'  ,  '100'  ,  '70'   , '80'  ,  '3');
INSERT INTO  SELLER VALUES('30'  ,  '30000' ,  '100'  ,  '60'  ,  '50'  ,  '4');
INSERT INTO  SELLER VALUES('40'  ,  '800'  ,  '70'  ,  '50'  ,  '70'  ,  '5');
INSERT INTO  SELLER VALUES('50'  ,  '900'   , '70'  ,  '100'  ,  '100'  , '6');
INSERT INTO  SERVICE VALUES(1, 'Enter desc' , 'Enter Portfolio' , 'Shaheer' , 'Basic' , 'Website Design' ,  'Tech');
INSERT INTO  SERVICE VALUES(2,'Enter desc' ,'Enter Portfolio' ,'Muhammad', 'Premium',' Soccer Trainer' ,'Sport');
INSERT INTO  SERVICE VALUES(3  ,'Enter desc'  , 'Enter Portfolio'   ,'Sharjeel'  , 'Basic'  , 'Skills Trainer'  ,'Sport');
INSERT INTO  SERVICE VALUES(4 , 'Enter desc'   ,'Enter Portfolio'  ,'Tameem'   , 'Basic'  , 'Refree'  ,'Sport');
INSERT INTO  SERVICE VALUES(5 , ' Enter desc'   ,'Enter Portfolio' ,   'Anas' , 'Standard'  ,  'Physics'   , 'Tutor');
INSERT INTO  SERVICE VALUES(6,'Enter desc' ,'Enter Portfolio' ,'Ruhail'  ,'Standard' , 'Mother Figure' ,'Parenting');    
INSERT INTO  SERVICE VALUES(7,  'Enter desc' ,'Enter Portfolio','Rudy Gay','Premium','Father Figure'  ,'Parenting');
INSERT INTO  SERVICE VALUES(8 , 'Enter desc' ,  'Enter Portfolio' , 'Yash' , 'Premium', 'Basketball Trainer'  , 'Sport');
exit;
EOF
