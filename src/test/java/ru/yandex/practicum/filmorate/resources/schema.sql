DROP TABLE IF EXISTS FilmGenre CASCADE;
DROP TABLE IF EXISTS Genre CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Film CASCADE;
DROP TABLE IF EXISTS Rate CASCADE;
DROP TABLE IF EXISTS Likes CASCADE;
DROP TABLE IF EXISTS Status CASCADE;
DROP TABLE IF EXISTS Friends CASCADE;

CREATE TABLE if not exists Person(
                                     id int generated by default as identity PRIMARY KEY,
                                     name varchar (50) NOT NULL,
                                     login varchar(50) NOT NULL,
                                     email varchar(50),
                                     birthday Date NOT NULL
);

CREATE TABLE if not exists Rate(
                                   id Integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                   rate varchar(200) NOT NULL
);

CREATE TABLE if not exists Film(
                                   film_id int generated by default as identity PRIMARY KEY,
                                   name varchar (50)  NOT NULL,
                                   description varchar(200)  NOT NULL,
                                   release_date Date NOT NULL CHECK (release_date > '1895-12-28'),
                                   duration int NOT NULL CHECK (duration > 0),
                                   mpa int
);

CREATE TABLE if not exists FilmGenre(
                                     film_genre_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                     film_id Integer  NOT NULL,
                                     genre_id Integer  NOT NULL
);

CREATE TABLE if not exists Genre(
                                    genre_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                    genre_name varchar(20)
);


CREATE TABLE if not exists Friends(
                                      friendship_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                      id Integer NOT NULL ,
                                      friend_id Integer  NOT NULL,
                                      status BOOLEAN DEFAULT(0),
                                      FOREIGN KEY (id) references Person(id),
                                      FOREIGN KEY (friend_id) references Person(id)
);

CREATE TABLE if not exists Likes(
                                    film_id Integer,
                                    id Integer,
                                    FOREIGN KEY (film_id) references Film(film_id),
                                    FOREIGN KEY (id) references Person(id)
);


