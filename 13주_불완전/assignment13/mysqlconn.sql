create table opinion_tbl(
id int not null,
fruit varchar(15),
sum int,
primary key(id));

desc opinion_tbl;

 
create table board_tbl(
	id int primary key auto_increment not null,
	name varchar(20),
	e_mail varchar(40),
	title varchar(40),
	content varchar(100),
	passwd varchar(10),
	ref int,
	index id(ref)
);

create index ref on board_tbl(id);

drop table board_tbl;
desc board_tbl;

select * from board_tbl;



