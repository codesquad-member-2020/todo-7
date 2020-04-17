DROP TABLE IF EXISTS card, category, project, user;

CREATE TABLE project (
    id int auto_increment primary key,
    title varchar(64)
);

CREATE TABLE category(
    id int auto_increment primary key,
    title varchar(64),
    project int,
    project_key int,
    FOREIGN KEY (project) REFERENCES project(Id) ON UPDATE CASCADE
);

CREATE TABLE card(
    id int auto_increment primary key,
    title varchar(64),
    contents varchar(64),
    category int,
    category_key int,
    FOREIGN KEY (category) REFERENCES category(Id) ON UPDATE CASCADE
);

CREATE TABLE user(
    id int auto_increment primary key,
    user_name varchar(64),
    password varchar(64)
);
