show tables;

create table pds (
	idx int not null auto_increment,    /* 자료실 고유번호 */
	mid varchar(20) not null,           /* 작성자 ID */
	nickName varchar(20) not null,      /* 작성자 닉네임 */
	fName varchar(200) not null,        /* 파일 업로드 시 파일명 */
	fSName varchar(200) not null,       /* 실제 파일 서버에 저장되는 파일명 */
	fSize int not null,                 /* 파일의 총 사이즈 */
	title varchar(100) not null,        /* 업로드 파일의 제목 */
	part  varchar(20) not null,         /* 파일 분류 (카테고리 : 학습,여행,음식 등) */
	pwd   varchar(100) not null,        /* 비밀번호(SHA256암호화처리) */
	fDate datetime default now(),       /* 파일 업로드 일자 */
	downNum int default 0,              /* 다운로드 횟수 */
	openSw char(6) default '공개',		/* 파일 공개여부 */
	content text,						/* 파일 상세설명 */
	hostIp varchar(50) not null,		/* 업로드 ip 주소 */
	primary key(idx)					/* 기본키 : 자료실의 고유번호 */
);
drop table pds;