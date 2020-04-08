DROP TABLE IF EXISTS Card, Activity, Category;

CREATE TABLE Category(
    Id int auto_increment primary key ,
    Title varchar(64) not null
);

CREATE TABLE Card(
    Id int auto_increment primary key ,
    Contents varchar(64) not null,
    CategoryId int,
    PrevCardId int,
    FOREIGN KEY (CategoryId) REFERENCES  Category(Id) ON UPDATE CASCADE,
    FOREIGN KEY (PrevCardId) REFERENCES Card(Id) ON UPDATE SET NULL
);

CREATE TABLE Activity (
    Id int auto_increment primary key ,
    Contents varchar(64) not null
);
