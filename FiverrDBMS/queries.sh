#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "suhassan/11213803@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SELECT service_name, levels
FROM service s
WHERE EXISTS
(SELECT *
FROM service
WHERE s.levels = 'Premium' 
AND s.service_type = 'Sport');
SELECT Services, Seller, COUNT(*) AS High_Rating
FROM REVIEWS 
WHERE RATING = 5
GROUP BY Services, seller;
SELECT service_name
FROM service s 
MINUS 
(SELECT service_name
FROM service s
WHERE s.service_type = 'Sport');
SELECT s.service_name, rating
FROM service s, reviews
WHERE s.service_type <> 'Sport'
AND rating = 5
UNION
(SELECT DISTINCT service_name, rating
FROM reviews r, service s
WHERE r.rating = 5
AND s.service_type <> 'Sport');
exit;
EOF
