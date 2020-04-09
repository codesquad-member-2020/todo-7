DROP TABLE IF EXISTS card, category, project;

CREATE TABLE project (
    id int auto_increment primary key,
    title varchar(64) not null
);

CREATE TABLE category(
    id int auto_increment primary key,
    title varchar(64) not null,
    project int,
    project_key int,
    FOREIGN KEY (project) REFERENCES project(Id) ON UPDATE CASCADE
);

CREATE TABLE card(
    id int auto_increment primary key,
    contents varchar(64) not null,
    category int,
    category_key int,
    FOREIGN KEY (category) REFERENCES category(Id) ON UPDATE CASCADE
);
