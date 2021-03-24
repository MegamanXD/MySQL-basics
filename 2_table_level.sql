# Create & use database
create database if not exists test;
use test;

# Create table
CREATE TABLE student(
first_name		varchar(30)			not null,
last_name		varchar(30)			not null,
email			varchar(60) 		null,
street		    varchar(50) 		not null,
city			varchar(40) 		not null,
state			char(2) 			not null 	default "LA",
zip			    mediumint unsigned 	not null,
phone			varchar(20) 		not null,
birth_date		date 				not null,
sex			    enum('M', 'F') 		not null,
date_entered	timestamp,
lunch_cost 		float 			    null,
student_id 		int unsigned 		auto_increment 	primary key );

CREATE TABLE class(
    name        varchar(30)         not null,
    class_id    int unsigned        not null    auto_increment      primary key);

CREATE TABLE test(
    date        date                not null,
    type        enum('T', 'Q')      not null,
    class_id    int unsigned        not null,
    test_id     int unsigned        not null    auto_increment      primary key);

CREATE TABLE score(
    student_id  int unsigned        not null,
    event_id    int unsigned        not null,
    score       int                 not null,
    PRIMARY KEY(event_id, student_id));

CREATE TABLE absence(
    student_id  int unsigned        not null,
    date        date                not null,
    PRIMARY KEY(student_id, date));

# Read all tables
show tables;

# Read details of a specific table
describe student;
describe class;
describe test;
describe score;
describe absence;

# Update table
RENAME TABLE
    absence to absences,
    class to classes,
    score to scores,
    student to students,
    test to tests;

# Delete table
CREATE TABLE delete_me(
    date        date                not null,
    type        enum('T', 'Q')      not null,
    class_id    int unsigned        not null,
    test_id     int unsigned        not null    auto_increment      primary key);
show tables;

drop table if exists delete_me;
show tables;
