DROP SCHEMA IF EXISTS testing CASCADE;
CREATE SCHEMA testing;

CREATE TABLE Artist
(
    artistId  INTEGER PRIMARY KEY,
    name      VARCHAR(127),
    birthdate Date
);

CREATE TABLE Album
(
    albumId   INTEGER PRIMARY KEY,
    artistId  INTEGER REFERENCES Artist,
    title     VARCHAR(127),
    year      INTEGER,
    publisher VARCHAR(127)
);

CREATE TABLE Song
(
    title       VARCHAR(255),
    trackNumber INTEGER,
    albumId     INTEGER REFERENCES Album,
    length      INTEGER,
    genre       VARCHAR(255),
    composer    VARCHAR(255),
    PRIMARY KEY (title, albumId)
);

CREATE TABLE Inventory
(
    albumId       INTEGER REFERENCES Album,
    numberInStock INTEGER,
    price         FLOAT,
    upc           INT UNIQUE
);

CREATE TABLE sale
(
    albumId       INTEGER REFERENCES Album,
    quantity      INTEGER,
    totalSale     NUMERIC(10, 2),
    saleDate      TIMESTAMP
);

CREATE TABLE wholesale_order
(
    orderId       SERIAL PRIMARY KEY,
    cost          NUMERIC(12, 2),
    orderDate     TIMESTAMP
);

CREATE TABLE Streaming
(
    songTitle VARCHAR(255),
    albumId   INTEGER,
    provider  VARCHAR(255),
    url       VARCHAR(512),
    FOREIGN KEY (songTitle, albumId) REFERENCES Song (title, albumID)
);

INSERT INTO artist(artistId, name, birthdate) VALUES (1, 'bach', '1685-03-21');

Insert into album(albumId, artistId, title, year, publisher)
values (10, 1, 'Well Tempered Clavier', 1900, 'acme publishing');

insert into album(albumId, artistId, title, year, publisher) values
(12, 1, 'Preludes and Fugues', 1901, 'asdf');

insert into inventory(albumId, numberInStock, price, upc)
VALUES (10, 3, 9.99, 12345);


insert into song(title, trackNumber, albumId, length, genre, composer) VALUES
('Prelude', 1, 10, 230, 'asdf', 'jsbach');

insert into streaming(songTitle, albumId, provider, url) values
('Prelude', 10, 'xyz', 'asdf');