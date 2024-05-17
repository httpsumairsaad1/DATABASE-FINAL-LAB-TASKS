
CREATE TABLE Movie (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    ReleaseDate DATE,
    Runtime INT,
    Rating DECIMAL(3,1)
);

CREATE TABLE Actor (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Director (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Genre (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

CREATE TABLE Studio (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    FoundedDate DATE,
    Headquarters VARCHAR(255)
);

CREATE TABLE Acted_In (
    Actor_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Actor_ID) REFERENCES Actor(ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(ID),
    PRIMARY KEY (Actor_ID, Movie_ID)
);

CREATE TABLE Directed (
    Director_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Director_ID) REFERENCES Director(ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(ID),
    PRIMARY KEY (Director_ID, Movie_ID)
);

CREATE TABLE Belongs_To (
    Movie_ID INT,
    Genre_ID INT,
    FOREIGN KEY (Movie_ID) REFERENCES Movie(ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre(ID),
    PRIMARY KEY (Movie_ID, Genre_ID)
);

CREATE TABLE Produced_By (
    Movie_ID INT,
    Studio_ID INT,
    FOREIGN KEY (Movie_ID) REFERENCES Movie(ID),
    FOREIGN KEY (Studio_ID) REFERENCES Studio(ID),
    PRIMARY KEY (Movie_ID, Studio_ID)
);


INSERT INTO Movie (Title, ReleaseDate, Runtime, Rating)
VALUES
    ('The Shawshank Redemption', '1994-10-14', 142, 9.3),
    ('The Godfather', '1972-03-24', 175, 9.2),
    ('The Dark Knight', '2008-07-18', 152, 9.0),
    ('Pulp Fiction', '1994-10-14', 154, 8.9),
    ('Forrest Gump', '1994-07-06', 142, 8.8);

INSERT INTO Actor (Name, BirthDate, Gender)
VALUES
    ('Morgan Freeman', '1937-06-01', 'Male'),
    ('Marlon Brando', '1924-04-03', 'Male'),
    ('Christian Bale', '1974-01-30', 'Male'),
    ('John Travolta', '1954-02-18', 'Male'),
    ('Tom Hanks', '1956-07-09', 'Male'),
    ('junaid', '1956-07-09', 'Male'),
    ('ali', '1956-07-09', 'Male');

INSERT INTO Director (Name, BirthDate, Gender)
VALUES
    ('Frank Darabont', '1959-01-28', 'Male'),
    ('Francis Ford Coppola', '1939-04-07', 'Male'),
    ('Christopher Nolan', '1970-07-30', 'Male'),
    ('Quentin Tarantino', '1963-03-27', 'Male'),
    ('sema', '1999-03-27', 'Female'),
    ('Robert Zemeckis', '1952-05-14', 'Male');

INSERT INTO Genre (Name)
VALUES
    ('Drama'),
    ('Crime'),
    ('Action'),
    ('Thriller'),
    ('Romance');

INSERT INTO Studio (Name, FoundedDate, Headquarters)
VALUES
    ('Warner Bros. Pictures', '1923-04-04', 'Burbank, California, United States'),
    ('Paramount Pictures', '1912-05-08', 'Hollywood, California, United States'),
    ('Universal Pictures', '1912-04-30', 'Universal City, California, United States'),
    ('Miramax Films', '1979-10-01', 'Beverly Hills, California, United States'),
    ('20th Century Studios', '1935-05-31', 'Century City, California, United States');

INSERT INTO Acted_In (Actor_ID, Movie_ID)
VALUES
    (1, 1), -- Morgan Freeman acted in The Shawshank Redemption
    (2, 2), -- Marlon Brando acted in The Godfather
    (3, 3), -- Christian Bale acted in The Dark Knight
    (4, 4), -- John Travolta acted in Pulp Fiction
    (5, 5), -- Tom Hanks acted in Forrest Gump
    (3, 4),
    (3, 2);

INSERT INTO Directed (Director_ID, Movie_ID)
VALUES
    (1, 1), -- Frank Darabont directed The Shawshank Redemption
    (2, 2), -- Francis Ford Coppola directed The Godfather
    (3, 3), -- Christopher Nolan directed The Dark Knight
    (4, 4), -- Quentin Tarantino directed Pulp Fiction
    (5, 5); -- Robert Zemeckis directed Forrest Gump

INSERT INTO Belongs_To (Movie_ID, Genre_ID)
VALUES
    (1, 1), -- The Shawshank Redemption belongs to Drama genre
    (2, 1), -- The Godfather belongs to Drama genre
    (3, 3), -- The Dark Knight belongs to Action genre
    (4, 4), -- Pulp Fiction belongs to Thriller genre
    (5, 1); -- Forrest Gump belongs to Drama genre

INSERT INTO Produced_By (Movie_ID, Studio_ID)
VALUES
    (1, 1), -- The Shawshank Redemption was produced by Warner Bros. Pictures
    (2, 2), -- The Godfather was produced by Paramount Pictures
    (3, 1), -- The Dark Knight was produced by Warner Bros. Pictures
    (4, 4), -- Pulp Fiction was produced by Miramax Films
    (5, 5); -- Forrest Gump was produced by 20th Century Studios

