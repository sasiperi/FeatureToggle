CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
 create table authorities (
  username varchar(256),
  authority varchar(256)
);
  
  
INSERT INTO users(username,password,enabled)
VALUES ('sasi','sasi', true);
INSERT INTO users(username,password,enabled)
VALUES ('peri','peri', true);

INSERT INTO user_roles (username, role)
VALUES ('sasi', 'USER');
INSERT INTO user_roles (username, role)
VALUES ('peri', 'ADMIN');

INSERT INTO user_roles (username, role)
VALUES ('sasi', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('peri', 'ROLE_ADMIN');


insert into authorities(username,authority) 
values('admin','ROLE_ADMIN');
insert into authorities(username,authority) 
values('admin','ROLE_ADMIN');