create table userinfo(
id varchar(30) primary key, 
name varchar(20) not null,
password varchar(20) not null, 
age INT(4),
gender INT(4)
);
INSERT INTO userinfo (id, name, password, age, gender)
VALUES ('sampleUserId2', 'Sample User2', 'samplePassword2', 26, 1);
SHOW COLUMNS FROM userinfo;
SELECT * FROM userinfo 
DELETE FROM userinfo WHERE id = 'testuser123';