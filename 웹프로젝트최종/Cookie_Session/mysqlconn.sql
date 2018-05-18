create table opinion_tbl(
id int not null,
fruit varchar(15),
sum int,
primary key(id));

desc opinion_tbl;

 
create table POST(
	num int primary key auto_increment not null,
	id varchar(50),
	title varchar(50),
	category varchar(50),
	content varchar(3000)
);


drop table POST;

select * from POST;

drop table MEMBER;

create table MEMBER(
	id varchar(50) primary key not null,
	nickname varchar(50),
	passwd varchar(50),
	name varchar(50)
);


create table POST_HASH_REL(
	post_num int,
	hash_id int
)

select * from POST_HASH_REL;

	
select * from MEMBER;

delete * from MEMBER;


create table CAT(
	id int primary key auto_increment not null,
	category varchar(30)
)

select * from CAT;
drop table CAT;




