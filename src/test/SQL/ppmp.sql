create database ppmp character set utf8mb4 collate utf8mb4_general_ci;

grant all privileges on ppmp.* to rootcc123@"%";

use ppmp;
create table if not exists `project_tbl` (
    `project_id` int unsigned auto_increment,
    `project_name` VARCHAR(100) NOT NULL ,
    `project_code` varchar(100) not null unique ,
    `manager_id` int ,
    `project_type` int(10),
    `createBy_id` int,
    `created_date` DATETIME,
    `update_date` DATETIME,
    `start_time` DATETIME,
    `end_time` DATETIME,
    `img` varchar(100),
    `status` int(10),
    `remarks` text,
    primary key (project_id)

)engine =InnoDB default charset =utf8mb4;


create table if not exists `project_detail_tbl` (
     `id` int unsigned auto_increment,
     `project_id` int NOT NULL primary key ,
     `screen_code` varchar(64),
     `screen_brand_id` int,
     `ocGrade` varchar(10),
     `tcon` varchar(100) ,
     `tcon_brand` varchar(50),
     `createBy_id` int,
     `created_date` DATETIME,
     `update_date` DATETIME,
     `start_time` DATETIME,
     `end_time` DATETIME,
     `img` varchar(100),
     `status` int(10),
     `remarks` text,
     foreign key (project_id) references project_tbl(project_id)


)engine =InnoDB default charset =utf8mb4;



create table if not exists `user_tbl` (
      `id` int unsigned auto_increment primary key ,
      `user_name` VARCHAR(100) NOT NULL unique,
      `real_name` varchar(100) not null  ,
      `created_date` DATETIME,
      `update_date` DATETIME,
      `avatar` varchar(100),
      `status` int(10),
      `remarks` text

)engine =InnoDB default charset =utf8mb4;

create table if not exists `project_status` (
    `id` int unsigned auto_increment primary key ,
    `status_name` VARCHAR(100) NOT NULL unique


)engine =InnoDB default charset =utf8mb4;

create table if not exists `project_type` (
    `id` int unsigned auto_increment primary key ,
    `type_name` VARCHAR(100) NOT NULL unique
)engine =InnoDB default charset =utf8mb4;

insert into project_status(id,status_code,status_name) values (10001,"created","已创建");

created,initialized,processing,closed


