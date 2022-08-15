use testDB;

show tables;
desc member;

insert into member(userid, userpwd, username, tel)
values("goguma","1234","고구마","010-1111-2222");
select * from  member;

desc board;
select * from board;

desc post;