#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "suhassan/11213803@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
CREATE VIEW expensive AS 
(SELECT *
FROM payment 
WHERE price >= 100 
ORDER BY price DESC);
SELECT * FROM expensive;
CREATE VIEW good_response_rate AS
(SELECT u.name, Order_response_rate
FROM Seller s, account u
Where s.id = u.id
AND s.order_response_rate >= 70);
SELECT * FROM good_response_rate;
CREATE VIEW fastDelivery AS
(SELECT sl.DELIVERY_TIME_DAYS, s.name
FROM servicelevel sl, service s
WHERE DELIVERY_TIME_DAYS <= 10
AND sl.id = s.id);
SELECT * FROM fastDelivery ORDER BY DELIVERY_TIME_DAYS ASC;
CREATE VIEW sports_Service AS
(SELECT r.services, a.username, sl.price
FROM reviews r, account a, servicelevel sl
WHERE r.service_type = 'Sport'
AND a.name = r.seller
AND a.id = sl.id);
Select * FROM sports_Service;
exit;
EOF
