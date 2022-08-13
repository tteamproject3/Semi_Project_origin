use travel;
show tables;

-- festival 데이터 

-- *************************** 필수 ****************************
-- thema 테이블에 아무것도 없는 기본 데이터 '-' 하나 넣어줍니다.
desc theme ;
insert into theme values('-');
-- *************************************************************

-- 이제 커맨드 창에서 mysql 실행해서 데이터 넣고나서 확인
select * from festival order by festival_start_date asc;



-- touristSpot 데이터 넣기 
desc touristSpot;
-- tour
-- ALTER TABLE touristSpot MODIFY COLUMN tour_id varchar(20) FIRST;
-- touristSpot 컬럼 순서 변경



-- *************************** 필수 ****************************
ALTER TABLE touristSpot MODIFY COLUMN tour_content varchar(400) after tour_id;
ALTER TABLE touristSpot MODIFY COLUMN tour_long varchar(20) after tour_content;
ALTER TABLE touristSpot MODIFY COLUMN tour_lat varchar(20) after tour_long;
ALTER TABLE touristSpot MODIFY COLUMN tour_phonename varchar(20) after tour_lat;
ALTER TABLE touristSpot MODIFY COLUMN tour_lotnum_addr varchar(100) after tour_phonename;
ALTER TABLE touristSpot MODIFY COLUMN tour_road_name_addr varchar(100) after tour_lotnum_addr;
ALTER TABLE touristSpot MODIFY COLUMN theme_id varchar(10) after tour_road_name_addr;
ALTER TABLE touristSpot MODIFY COLUMN tour_parkinglot_num int after theme_id;
-- ************************************************************








select * from touristSpot order by tour_id;
-- delete  from touristSpot;

-- Query OK, 731 rows affected, 8 warnings (0.11 sec)
-- Records: 734  Deleted: 0  Skipped: 3  Warnings: 8


