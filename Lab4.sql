-- question 1 using nested queries
-- but have to use join

-- SQL> select count(*) as Num_driv_inAcc from OWNS
--   2  where regno in(
--   3          select regno from participated
--   4          where reportNum in (
--   5              select reportNum from ACCIDENT
--   6              where (extract(year from accd_date)) = 2023
--   7          )
--   8  );

-- NUM_DRIV_INACC
-- --------------
--              3

-- select p.driver_id 
-- from PERSON p
-- join participated part on part.driver_id = p.driver_id
-- join ACCIDENT acc on acc.reportNum = part.reportNum ;


-- answer for q1
SELECT OWNS.regno
FROM OWNS
JOIN participated part ON part.regno = OWNS.regno
JOIN ACCIDENT acc ON acc.reportNum = part.reportNum
WHERE EXTRACT(YEAR FROM acc.accd_date) = 2023;

-- answer for q2
SELECT CAR.model , count(CAR.model) as freq_of_accidents
from CAR
join PARTICIPATED part on part.regno = car.regno
join ACCIDENT acc on acc.reportNum = part.reportNum;
group by CAR.model

-- answer for q3
SELECT p.driver_name as OwnerName,
       COUNT(p.driver_name) as No_of_Acc,
       SUM(part.fineAmt) as Total_Fine_Amt
FROM PERSON p
JOIN participated part ON part.driver_id = p.driver_id
JOIN ACCIDENT acc ON acc.reportNum = part.reportNum
GROUP BY p.driver_name
ORDER BY Total_Fine_Amt DESC;

-- answer for q4
SELECT p.driver_name,
       COUNT(part.reportNum) as num_accidents 
FROM PERSON p
JOIN participated part ON part.driver_id = p.driver_id
GROUP BY p.driver_id, p.driver_name
HAVING COUNT(part.reportNum) > 2;

-- anwser for q5
SELECT p.driver_name as nameOfOwner
FROM PERSON p
LEFT JOIN participated part ON part.driver_id = p.driver_id
WHERE part.driver_id IS NULL;

