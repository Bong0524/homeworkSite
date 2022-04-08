--학급 테이블
create table hw_class(
grade number(1) not null, 
class number(1) not null, 
constraint class_pk primary key(grade,class)
)
select * from hw_class

insert into hw_class values(1,1);
insert into hw_class values(2,1);
insert into hw_class values(3,1);
insert into hw_class values(4,1);
insert into hw_class values(5,1);
insert into hw_class values(6,1);
insert into hw_class values(6,2);

--유저 테이블
create table hw_user(
id varchar2(20) primary key not null, 
pw varchar2(20) not null, 
name varchar2(10) not null, 
grade number(1) not null, 
class number(1) not null, 
num number(2),
position varchar2(20) default '학생'
)
select * from hw_user

--숙제 테이블
create table hw_homework(
homeworkId varchar2(20) primary key not null,
grade number(1) not null, 
class number(1) not null, 
title varchar2(100) not null,
subject varchar2(10),
stDate date default sysdate,
enDate date not null
)
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),6,2,'더하기빼기','math','2022-04-06','2022-04-07');
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),6,2,'더하기빼기2','math','2022-04-06','2022-04-07');
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),1,1,'더하기','math','2022-04-07','2022-04-20');
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),3,1,'지구','science','2022-04-07','2022-04-10');
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),3,1,'달','science','2022-04-07','2022-04-8');
insert into hw_homework values((select nvl(max(homeworkId)+1,0) from hw_homework),2,1,'독서록','korean','2022-04-07','2022-04-11');
select * from hw_homework
select homeworkId, grade, class, title, subject, stDate, enDate, ceil(enDate - sysdate+1)as timeout from hw_homework order by (case when timeout > 0 then 1 end), timeout
create table hw_quest(
homeworkId varchar2(20) not null,
questNum number(3) not null,
quest varchar2(1000) not null,
answer long,
constraint quest_pk primary key(homeworkId,questNum)
)

insert into hw_quest values('0',1,'5 + 7','12');
insert into hw_quest values('0',2,'5 - 5','0');
insert into hw_quest values('1',1,'5 - 3','2');
select * from hw_quest;
select * from hw_homework h inner join hw_quest q on h.homeworkId = q.homeworkId where h.homeworkId = '0'

--제출물 테이블
create table hw_submit(
submission long not null,
homeworkId varchar2(20) not null,
id varchar2(20) not null,
name varchar2(10) not null,
num number(1) not null,
feedback varchar2(1000),
wrDate date default sysdate,
constraint submit_pk primary key(homeworkId,id)
)
select * from hw_submit






