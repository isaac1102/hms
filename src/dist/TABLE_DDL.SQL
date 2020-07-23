create table bcu_homework(
hw_seq int primary key,
title varchar(200) not null,
reply varchar(4000),
file_seq int,
confirm_yn char(1),
check_yn char(1),
reg_dt date,
modi_dt date,
reg_id varchar(50)
);


create table bcu_file(
file_seq int,
file_path varchar(500) not null,
file_id varchar(100) not null,
file_nm varchar(200) not null,
file_url varchar(200) not null,
order_no int,
file_size int,
file_type varchar(10),
primary key (file_seq) ,
foreign key (file_seq) references bcu_homework(file_seq)
);
 

create table bcu_member(
user_id varchar(50) primary key,
user_nm varchar(50) not null,
password varchar(1000) not null,
class varchar(100),
level int,
Attending_Yn char(1),
check_yn char(1)
);

 