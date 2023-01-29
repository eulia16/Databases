CREATE DATABASE Rap_Searcher;
USE RapSearcher;

CREATE TABLE Song(
Rating INT,
SongName VARCHAR(255),
NumberOfListens INT,
SongID INT NOT NULL AUTO_INCREMENT,
IsSingle VARCHAR(255),
SongAwards VARCHAR(255),
AlbumID INT NOT NULL,
PRIMARY KEY(SongID),
FOREIGN KEY(AlbumID) REFERENCES Albums(AlbumID)
);

INSERT INTO Song
Values
(5,"This one is better", 78,2,"N","N"),
(2,"This one is is worse", 3,3,"Y","N"),
(4,"Decent", 56,4,"Y","N");

CREATE TABLE Albums(
numberOfSongs INT,
dateReleased DATE,
totalNumOfListens INT,
albumID INT NOT NULL AUTO_INCREMENT,
agency VARCHAR(255),
totalRating FLOAT,
PRIMARY KEY(albumID)
);

INSERT INTO Albums
Values
-- (5,'2008/11/11',567,1,"Y",3.5);
(12,'2009/10/09',1000,2,"N",2.6),
(4,'2012/04/12',12000,3,"Y",3.9);

CREATE TABLE Creates(
artistID  INT NOT NULL,
albumID   INT NOT NULL,
createsID INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(createsID),
FOREIGN KEY(albumID) REFERENCES Albums(albumID),
FOREIGN KEY(artistID) REFERENCES Artist(artistID)
);

INSERT INTO Creates
Values
(1,1),
(2,2),
(3,3);

-- DELETE  FROM Creates
-- WHERE createsID =1;

CREATE TABLE Artists(
artistID INT NOT NULL AUTO_INCREMENT,
firstName VARCHAR(255),
lastName VARCHAR(255),
artistAwards VARCHAR(255),
stageName VARCHAR(255),
netWorth INT,
PRIMARY KEY(artistID)
);

INSERT INTO Artists
Values
(3,"Ayinde","lastName","Also Couldn't say","Ayinde",34535);

CREATE TABLE Concerts(
location VARCHAR(255),
Times FLOAT,
dates DATE,
artistPerforming VARCHAR(255) NOT NULL,
maxCapacity INT,
vaxRequirement INT,
userID INT NOT NULL,
artistID INT NOT NULL,
PRIMARY KEY(artistPerforming),
FOREIGN KEY(userID) REFERENCES Users(userID),
FOREIGN KEY(artistID) REFERENCES Artists(artistID)
);

INSERT INTO Concerts
Values
-- ("Fiji",9.00, 20121109,"Ethan",50000,1, 1, 1);
("France",6.00, 20171001,"Eric",100000,1, 3, 3);

CREATE TABLE users(
searchHistory VARCHAR(255),
albumsListenedTo INT,
userID INT NOT NULL AUTO_INCREMENT,
timeListened FLOAT,
songsListenedTo INT,
email VARCHAR(255),
phoneNumber INT,
subscriptionStatus VARCHAR(1),
PRIMARY KEY(userID)
);
INSERT INTO users
Values
("This ones not bad", 90,3,20.54,200,"Ayinde@hotmail.com",4650986,1);


CREATE TABLE interactsWith(
songID INT NOT NULL AUTO_INCREMENT,
artistInfoID INT NOT NULL,
userID INT NOT NULL,
service VARCHAR(255) NOT NULL,
PRIMARY KEY(songID),
FOREIGN KEY(artistInfoID) REFERENCES ArtistInfo(artistInfoID),
FOREIGN KEY(service) REFERENCES ServiceInfo(service),
FOREIGN KEY(userID) REFERENCES Users(userID)
);
INSERT INTO interactsWith
Values
(1,1,"Spotify",1),
(2,2,"Pandora",1),
(3,3,"SoundCloud",1);

CREATE TABLE ServiceInfo(
service VARCHAR(255),
dateAdded DATE,
PRIMARY KEY(service)
);


INSERT INTO ServiceInfo
Values
("Spotify",20201012),
("Pandora", 20210119),
("SoundCloud",20190609);



CREATE TABLE ArtistsInfo(
artistInfoID INT NOT NULL AUTO_INCREMENT,
billBoardRankings INT,
numOfSongs INT,
numOfAlbums INT,
PRIMARY KEY(artistInfoID)
);


INSERT INTO ArtistsInfo
Values
(1,4,20,3),
(2,3,50,5),
(3,5,70,6);



CREATE TABLE Streams(
service VARCHAR(255),
artistInfoID INT NOT NULL,
streamsID INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(streamsID),
FOREIGN KEY(artistInfoID) REFERENCES ArtistInfo(artistInfoID),
FOREIGN KEY(service) REFERENCES ServiceInfo(service)
);

INSERT INTO Streams
Values
("Spotify",1,1),
("Pandora",2,2),
("SoundCloud",3,3);


