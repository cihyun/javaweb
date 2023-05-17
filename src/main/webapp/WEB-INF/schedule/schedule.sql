/* schedule.sql */

show tables;

create table schedule (
   idx      int not null auto_increment primary key,
   mid      varchar(20) not null,                                 /* 회원 아이디(일정 검색시 필요)*/
   sDate   datetime not null,                                    /* 일정 등록 날짜 */
   part   varchar(10) not null,                                 /* 분류(1.모임, 2.업무, 3.학습) */
   content text not null                                       /* 일정 상세 내역 */   
);

desc schedule;
drop table schedule;

insert into schedule values (default, 'aaaaa', '2023-05-17', '학습', 'JSP 주제발표');
insert into schedule values (default, 'aaaaa', '2023-05-18', '기타', '영화관람 cgv 6시');
insert into schedule values (default, 'aaaaa', '2023-05-19', '기타', '중고 농구대회(해남)');
insert into schedule values (default, 'aaaaa', '2023-05-22', '모임', '학원 6기 모임');
insert into schedule values (default, 'aaaaa', '2023-05-23', '모임', '나영이 집들이');
insert into schedule values (default, 'aaaaa', '2023-05-24', '학습', '학부모 참여수업');
insert into schedule values (default, 'bbbbb', '2023-05-22', '학습', '정보처리기사 시험');
insert into schedule values (default, 'bbbbb', '2023-05-23', '학습', 'JSP 주제발표');
insert into schedule values (default, 'bbbbb', '2023-05-27', '모임', '볼링 상주전');
insert into schedule values (default, 'bbbbb', '2023-05-28', '모임', '볼링 모임');
insert into schedule values (default, 'bbbbb', '2023-06-03', '학습', '프로젝트 완료보고');
insert into schedule values (default, 'bbbbb', '2023-05-04', '기타', '학교청소');

select * from schedule where mid = 'aaaaa' order by sDate desc;

select * from schedule where mid = 'aaaaa' and sDate='2023-05-17' order by sDate desc;
select * from schedule where mid = 'aaaaa' and date_format(sDate,'%Y-%m-%d')='2023-05-17' order by sDate desc;

select * from schedule where mid = 'aaaaa' and sDate='2023-05' order by sDate desc;
select * from schedule where mid = 'aaaaa' and date_format(sDate,'%Y-%m')='2023-5' order by sDate desc;
select * from schedule where mid = 'aaaaa' and date_format(sDate,'%Y-%m')='2023-05' order by sDate desc;