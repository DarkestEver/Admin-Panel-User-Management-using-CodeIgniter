


CREATE TABLE ci_sessions (
  session_id varchar(40) NOT NULL DEFAULT '0',
  ip_address varchar(45) NOT NULL DEFAULT '0',
  user_agent varchar(120) NOT NULL,
  last_activity int  NOT NULL DEFAULT '0',
  user_data text NOT NULL
) ;


CREATE TABLE tbl_last_login (
  id serial NOT NULL primary key,
  userId int NOT NULL,
  sessionData varchar(2048) NOT NULL,
  machineIp varchar(1024) NOT NULL,
  userAgent varchar(128) NOT NULL,
  agentString varchar(1024) NOT NULL,
  platform varchar(128) NOT NULL,
  createdDtm timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;



CREATE TABLE tbl_reset_password (
  id serial NOT NULL primary key, 
  email varchar(128) NOT NULL,
  activation_id varchar(32) NOT NULL,
  agent varchar(512) NOT NULL,
  client_ip varchar(32) NOT NULL,
  isDeleted int NOT NULL DEFAULT '0',
  createdBy int NOT NULL DEFAULT '1',
  createdDtm timestamp NOT NULL,
  updatedBy int DEFAULT NULL,
  updatedDtm timestamp DEFAULT NULL
) ;


CREATE TABLE tbl_roles (
  roleId serial  NOT NULL primary key,
  role varchar(50) NOT NULL 
) ;


CREATE TABLE tbl_users (
  userId serial NOT NULL primary key,
  email varchar(128) NOT NULL ,
  password varchar(128) NOT NULL ,
  name varchar(128) DEFAULT NULL ,
  mobile varchar(20) DEFAULT NULL,
  roleId int NOT NULL,
  isDeleted int NOT NULL DEFAULT '0',
  createdBy int NOT NULL,
  createdDtm timestamp NOT NULL,
  updatedBy int DEFAULT NULL,
  updatedDtm timestamp DEFAULT NULL
) ;


INSERT INTO tbl_roles (roleId, role) VALUES
(1, 'System Administrator'),
(2, 'Manager'),
(3, 'Employee');


INSERT INTO tbl_users (userId, email, password, name, mobile, roleId, isDeleted, createdBy, createdDtm, updatedBy, updatedDtm) VALUES
(1, 'admin@example.com', '$2y$10$6NOKhXKiR2SAgpFF2WpCkuRgYKlSqFJaqM0NgIM3PT1gKHEM5/SM6', 'System Administrator', '9890098900', 1, 0, 0, '2015-07-01 18:56:49', 1, '2018-01-05 05:56:34'),
(2, 'manager@example.com', '$2y$10$quODe6vkNma30rcxbAHbYuKYAZQqUaflBgc4YpV9/90ywd.5Koklm', 'Manager', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2018-01-12 07:22:11'),
(3, 'employee@example.com', '$2y$10$UYsH1G7MkDg1cutOdgl2Q.ZbXjyX.CSjsdgQKvGzAgl60RXZxpB5u', 'Employee', '9890098900', 3, 0, 1, '2016-12-09 17:50:22', 3, '2018-01-04 07:58:28');
