--q1
SELECT count(1) FROM `dtc-de-course-375915.week3.fhv2019` LIMIT 1000;

--q2
create table week3.fhv2019_BQ
as
select * from `dtc-de-course-375915.week3.fhv2019`;

select count(distinct affiliated_base_number) from `dtc-de-course-375915.week3.fhv2019`;
select count(distinct affiliated_base_number) from `week3.fhv2019_BQ`;

--q3
select count(*) from `week3.fhv2019_BQ`
where PUlocationID is null and DOlocationID is null;

--q5
CREATE TABLE week3.fhv2019_part_clust
PARTITION BY date(pickup_datetime)
CLUSTER BY affiliated_base_number
AS
SELECT *
FROM `week3.fhv2019_BQ`;

SELECT COUNT(DISTINCT affiliated_base_number)
FROM `week3.fhv2019_BQ`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';