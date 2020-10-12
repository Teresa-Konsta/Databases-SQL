CREATE TABLE Movie
(mov_id number(10) PRIMARY KEY,
mov_title varchar2(50) UNIQUE,
mov_year number(4),
mov_time number(3),
mov_lang varchar2(50),
mov_dt_rel DATE,
mov_rel_country varchar2(5)
)

CREATE TABLE Actor
(act_id number(5) PRIMARY KEY,
act_fname varchar2(20),
act_lname varchar2(20),
act_gender char(1)
)

CREATE TABLE Movie_cast
(act_id number(5),
mov_id number(10),
role varchar2(30),
CONSTRAINT act_fk FOREIGN KEY (act_id)
REFERENCES Actor (act_id),
CONSTRAINT mv_fk FOREIGN KEY (mov_id)
REFERENCES Movie (mov_id)
)

CREATE TABLE Director
(dir_id number(5) PRIMARY KEY,
dir_fname varchar2(20),
dir_lname varchar2(20)
)

CREATE TABLE Movie_direction
(dir_id number(5),
mov_id number(10),
CONSTRAINT dir_fk FOREIGN KEY (dir_id)
REFERENCES Director (dir_id),
CONSTRAINT mid_fk FOREIGN KEY (mov_id)
REFERENCES Movie (mov_id)
)

CREATE TABLE Reviewer
(rev_id number(5) PRIMARY KEY,
rev_name varchar2(30)
)

CREATE TABLE Genres
(gen_id number(5) PRIMARY KEY,
gen_title VARCHAR2(20)
)

CREATE TABLE Movie_genres
(mov_id number(10),
gen_id number(5),
CONSTRAINT midg_fk FOREIGN KEY (mov_id)
REFERENCES Movie (mov_id),
CONSTRAINT gid_fk FOREIGN KEY (gen_id)
REFERENCES Genres (gen_id)
)

CREATE TABLE Rating
(mov_id number(10),
rev_id number(5),
rev_stars number(5),
num_o_ratings number(6),
CONSTRAINT mr_fk FOREIGN KEY (mov_id)
REFERENCES Movie (mov_id),
CONSTRAINT mrv_fk FOREIGN KEY (rev_id)
REFERENCES Reviewer (rev_id)
)

INSERT INTO Director
VALUES (1, 'James', 'Cameron')

INSERT INTO Genres
VALUES (1, 'Comedy')