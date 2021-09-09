
CREATE TABLE author (
    author_id NUMBER,
    author_name VARCHAR2(400),
    CONSTRAINT pk_author PRIMARY KEY (author_id)
);

CREATE TABLE publisher (
    publisher_id NUMBER,
    publisher_name VARCHAR2(400),
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
);

CREATE TABLE book_language (
    language_id NUMBER,
    language_code VARCHAR2(8),
    language_name VARCHAR2(50),
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE book (
    book_id NUMBER,
    title VARCHAR2(400),
    isbn13 VARCHAR2(13),
    language_id NUMBER,
    num_pages NUMBER,
    publication_date DATE,
    publisher_id NUMBER,
    CONSTRAINT pk_book PRIMARY KEY (book_id),
    CONSTRAINT fk_book_lang FOREIGN KEY (language_id) REFERENCES book_language (language_id),
    CONSTRAINT fk_book_pub FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

CREATE TABLE book_author (
    book_id NUMBER,
    author_id NUMBER,
    CONSTRAINT pk_bookauthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author (author_id)
);

CREATE TABLE address_status (
    status_id NUMBER,
    address_status VARCHAR2(30),
    CONSTRAINT pk_addr_status PRIMARY KEY (status_id)
);

CREATE TABLE country (
    country_id NUMBER,
    country_name VARCHAR2(200),
    CONSTRAINT pk_country PRIMARY KEY (country_id)
);

CREATE TABLE address (
    address_id NUMBER,
    street_number VARCHAR2(10),
    street_name VARCHAR2(200),
    city VARCHAR2(100),
    country_id NUMBER,
    CONSTRAINT pk_address PRIMARY KEY (address_id),
    CONSTRAINT fk_addr_ctry FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE customer (
    customer_id NUMBER,
    first_name VARCHAR2(200),
    last_name VARCHAR2(200),
    email VARCHAR2(350),
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
    customer_id NUMBER,
    address_id NUMBER,
    status_id NUMBER,
    CONSTRAINT pk_custaddr PRIMARY KEY (customer_id, address_id),
    CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_ca_addr FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE shipping_method (
    method_id NUMBER,
    method_name VARCHAR2(100),
    cost DECIMAL(6, 2),
    CONSTRAINT pk_shipmethod PRIMARY KEY (method_id)
);

CREATE SEQUENCE seq_custorder;

CREATE TABLE cust_order (
    order_id NUMBER,
    order_date DATE,
    customer_id NUMBER,
    shipping_method_id NUMBER,
    dest_address_id NUMBER,
    CONSTRAINT pk_custorder PRIMARY KEY (order_id),
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
);

CREATE TABLE order_status (
    status_id NUMBER,
    status_value VARCHAR2(20),
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
);

CREATE SEQUENCE seq_orderline;

CREATE TABLE order_line (
    line_id NUMBER,
    order_id NUMBER,
    book_id NUMBER,
    price NUMBER(5, 2),
    CONSTRAINT pk_orderline PRIMARY KEY (line_id),
    CONSTRAINT fk_ol_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_ol_book FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE SEQUENCE seq_orderhist;

CREATE TABLE order_history (
    history_id NUMBER,
    order_id NUMBER,
    status_id NUMBER,
    status_date DATE,
    CONSTRAINT pk_orderhist PRIMARY KEY (history_id),
    CONSTRAINT fk_oh_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_oh_status FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);

INSERT ALL
INTO author (author_name, author_id) VALUES ('A. Bartlett Giamatti', 1)
INTO author (author_name, author_id) VALUES ('A. Elizabeth Delany', 2)
INTO author (author_name, author_id) VALUES ('A. Merritt', 3)
INTO author (author_name, author_id) VALUES ('A. Roger Merrill', 4)
INTO author (author_name, author_id) VALUES ('A. Walton Litz', 5)
INTO author (author_name, author_id) VALUES ('A.B. Yehoshua', 6)
INTO author (author_name, author_id) VALUES ('A.D.P. Briggs', 7)
INTO author (author_name, author_id) VALUES ('A.E. Cunningham', 8)
INTO author (author_name, author_id) VALUES ('A.E. van Vogt', 9)
INTO author (author_name, author_id) VALUES ('A.G. Pasquella', 10)
INTO author (author_name, author_id) VALUES ('A.H. Armstrong', 11)
INTO author (author_name, author_id) VALUES ('A.J. Arberry', 12)
INTO author (author_name, author_id) VALUES ('A.J. Ayer', 13)
INTO author (author_name, author_id) VALUES ('A.J. Jacobs', 14)
INTO author (author_name, author_id) VALUES ('A.J. McAllister', 15)
INTO author (author_name, author_id) VALUES ('A.M. Dellamonica', 16)
INTO author (author_name, author_id) VALUES ('A.M. Homes', 17)
INTO author (author_name, author_id) VALUES ('A.N. Roquelaure', 18)
INTO author (author_name, author_id) VALUES ('A.N. Wilson', 19)
INTO author (author_name, author_id) VALUES ('A.R. Braunmuller', 20)
INTO author (author_name, author_id) VALUES ('A.R. Taylor', 21)
INTO author (author_name, author_id) VALUES ('A.S. Byatt', 22)
INTO author (author_name, author_id) VALUES ('A.T. Hatto', 23)
INTO author (author_name, author_id) VALUES ('A.V. Miller', 24)
INTO author (author_name, author_id) VALUES ('Aaron Anderson', 25)
INTO author (author_name, author_id) VALUES ('Aaron Asher', 26)
INTO author (author_name, author_id) VALUES ('Aaron Medwin', 27)
INTO author (author_name, author_id) VALUES ('Aaron Rosenberg', 28)
INTO author (author_name, author_id) VALUES ('Aaron Shepard', 29)
INTO author (author_name, author_id) VALUES ('Abbe Wool', 30) SELECT * FROM dual;


INSERT ALL
INTO publisher (publisher_name, publisher_id) VALUES ('10/18', 1)
INTO publisher (publisher_name, publisher_id) VALUES ('1st Book Library', 2)
INTO publisher (publisher_name, publisher_id) VALUES ('1st World Library', 3)
INTO publisher (publisher_name, publisher_id) VALUES ('A and C Black (Childrens books)', 4)
INTO publisher (publisher_name, publisher_id) VALUES ('A Harvest Book/Harcourt Inc.', 5)
INTO publisher (publisher_name, publisher_id) VALUES ('A K PETERS', 6)
INTO publisher (publisher_name, publisher_id) VALUES ('AA World Services', 7)
INTO publisher (publisher_name, publisher_id) VALUES ('Abacus', 8)
INTO publisher (publisher_name, publisher_id) VALUES ('Abacus Books', 9)
INTO publisher (publisher_name, publisher_id) VALUES ('Abacus Books (London)', 10)
INTO publisher (publisher_name, publisher_id) VALUES ('Abdo Publishing Company', 11)
INTO publisher (publisher_name, publisher_id) VALUES ('Abingdon Press', 12)
INTO publisher (publisher_name, publisher_id) VALUES ('Abradale Books/Harry N. Abrams', 13)
INTO publisher (publisher_name, publisher_id) VALUES ('Abraham Guillen Press', 14)
INTO publisher (publisher_name, publisher_id) VALUES ('Abrams', 15)
INTO publisher (publisher_name, publisher_id) VALUES ('Absolute Press', 16)
INTO publisher (publisher_name, publisher_id) VALUES ('Abstract Studio', 17)
INTO publisher (publisher_name, publisher_id) VALUES ('Academic Press', 18)
INTO publisher (publisher_name, publisher_id) VALUES ('Academica Press', 19)
INTO publisher (publisher_name, publisher_id) VALUES ('Academy Chicago Publishers', 20)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace', 21)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace Book', 22)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace Books', 23)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace Hardcover', 24)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace Trade', 25)
INTO publisher (publisher_name, publisher_id) VALUES ('Ace/SFBC', 26)
INTO publisher (publisher_name, publisher_id) VALUES ('Acento Editorial', 27)
INTO publisher (publisher_name, publisher_id) VALUES ('Acropolis Books (NY)', 28)
INTO publisher (publisher_name, publisher_id) VALUES ('Actes Sud', 29)
INTO publisher (publisher_name, publisher_id) VALUES ('Adamant Media Corporation', 30)
SELECT * FROM dual;


INSERT ALL
INTO book_language (language_code, language_id, language_name) VALUES ('eng', 1, 'English')
INTO book_language (language_code, language_id, language_name) VALUES ('en-US', 2, 'United States English')
INTO book_language (language_code, language_id, language_name) VALUES ('fre', 3, 'French')
INTO book_language (language_code, language_id, language_name) VALUES ('spa', 4, 'Spanish')
INTO book_language (language_code, language_id, language_name) VALUES ('en-GB', 5, 'British English')
INTO book_language (language_code, language_id, language_name) VALUES ('mul', 6, 'Multiple Languages')
INTO book_language (language_code, language_id, language_name) VALUES ('grc', 7, 'Greek')
INTO book_language (language_code, language_id, language_name) VALUES ('enm', 8, 'Middle English')
INTO book_language (language_code, language_id, language_name) VALUES ('en-CA', 9, 'Canadian English')
INTO book_language (language_code, language_id, language_name) VALUES ('ger', 10, 'German')
INTO book_language (language_code, language_id, language_name) VALUES ('jpn', 11, 'Japanese')
INTO book_language (language_code, language_id, language_name) VALUES ('ara', 12, 'Arabic')
INTO book_language (language_code, language_id, language_name) VALUES ('nl', 13, 'Dutch')
INTO book_language (language_code, language_id, language_name) VALUES ('zho', 14, 'Chinese')
INTO book_language (language_code, language_id, language_name) VALUES ('lat', 15, 'Latin')
INTO book_language (language_code, language_id, language_name) VALUES ('por', 16, 'Portuguese')
INTO book_language (language_code, language_id, language_name) VALUES ('srp', 17, 'Serbian')
INTO book_language (language_code, language_id, language_name) VALUES ('ita', 18, 'Italian')
INTO book_language (language_code, language_id, language_name) VALUES ('rus', 19, 'Russian')
INTO book_language (language_code, language_id, language_name) VALUES ('msa', 20, 'Malaysian')
INTO book_language (language_code, language_id, language_name) VALUES ('glg', 21, 'Galician')
INTO book_language (language_code, language_id, language_name) VALUES ('wel', 22, 'Welsh')
INTO book_language (language_code, language_id, language_name) VALUES ('swe', 23, 'Swedish')
INTO book_language (language_code, language_id, language_name) VALUES ('nor', 24, 'Norwegian')
INTO book_language (language_code, language_id, language_name) VALUES ('tur', 25, 'Turkish')
INTO book_language (language_code, language_id, language_name) VALUES ('gla', 26, 'Gaelic')
INTO book_language (language_code, language_id, language_name) VALUES ('ale', 27, 'Aleut')
SELECT * FROM dual;

INSERT ALL
INTO shipping_method (method_id, method_name, cost) VALUES(1, 'Standard', 5.9)
INTO shipping_method (method_id, method_name, cost) VALUES(2, 'Priority', 8.9)
INTO shipping_method (method_id, method_name, cost) VALUES(3, 'Express', 11.9)
INTO shipping_method (method_id, method_name, cost) VALUES(4, 'International', 24.5)
SELECT * FROM dual;

INSERT ALL
INTO address_status (status_id, address_status) VALUES (1, 'Active')
INTO address_status (status_id, address_status) VALUES (2, 'Inactive')
SELECT * FROM dual;

INSERT ALL
INTO order_status (status_id, status_value) VALUES (1, 'Order Received')
INTO order_status (status_id, status_value) VALUES (2, 'Pending Delivery')
INTO order_status (status_id, status_value) VALUES (3, 'Delivery In Progress')
INTO order_status (status_id, status_value) VALUES (4, 'Delivered')
INTO order_status (status_id, status_value) VALUES (5, 'Cancelled')
INTO order_status (status_id, status_value) VALUES (6, 'Returned')
SELECT * FROM dual;

COMMIT;

INSERT ALL
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The World''s First Love: Mary  Mother of God', 1, '8987059752', 2, 276, TO_DATE('1996-09-01', 'yyyy-mm-dd'), 1)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Illuminati', 2, '20049130001', 1, 352, TO_DATE('2004-10-04', 'yyyy-mm-dd'), 1)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Servant Leader', 3, '23755004321', 1, 128, TO_DATE('2003-03-11', 'yyyy-mm-dd'), 1)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('What Life Was Like in the Jewel in the Crown: British India  AD 1600-1905', 4, '34406054602', 1, 168, TO_DATE('1999-09-01', 'yyyy-mm-dd'), 1)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Cliffs Notes on Aristophanes'' Lysistrata  The Birds  The Clouds  The Frogs', 5, '49086007763', 1, 80, TO_DATE('1983-12-29', 'yyyy-mm-dd'), 4)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Life Is a Dream and Other Spanish Classics (Eric Bentley''s Dramatic Repertoire) - Volume II', 6, '73999140774', 1, 298, TO_DATE('2000-04-01', 'yyyy-mm-dd'), 9)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('William Goldman: Four Screenplays', 7, '73999254907', 2, 504, TO_DATE('2000-05-01', 'yyyy-mm-dd'), 9)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Season: A Candid Look at Broadway', 8, '73999768442', 1, 448, TO_DATE('2004-07-01', 'yyyy-mm-dd'), 11)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Beatles Complete - Updated Edition', 9, '73999960822', 1, 303, TO_DATE('1986-12-01', 'yyyy-mm-dd'), 8)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Working Effectively with Legacy Code', 10, '76092025986', 1, 464, TO_DATE('2004-09-01', 'yyyy-mm-dd'), 15)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Complete Anne of Green Gables Boxed Set (Anne of Green Gables  #1-8)', 11, '76783609419', 1, 2088, TO_DATE('1998-10-06', 'yyyy-mm-dd'), 18)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Plants Bite Back! (DK Readers)', 12, '635517047547', 1, 48, TO_DATE('1999-10-25', 'yyyy-mm-dd'), 5)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Book of Awakening: Having the Life You Want by Being Present to the Life You Have', 13, '645241001173', 1, 438, TO_DATE('2000-05-31', 'yyyy-mm-dd'), 4)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Risotto: 30 Simply Delicious Vegetarian Recipes from an Italian Kitchen', 14, '694055000612', 1, 64, TO_DATE('2001-03-01', 'yyyy-mm-dd'), 17)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Prétear  Vol. 3 (Prétear  #3)', 15, '702727014581', 1, 172, TO_DATE('2004-10-12', 'yyyy-mm-dd'), 3)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Mystery in the Rocky Mountains', 16, '710430023622', 1, 145, TO_DATE('2001-04-01', 'yyyy-mm-dd'), 3)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('The Mystery on the Mighty Mississippi', 17, '710430023639', 1, 142, TO_DATE('2001-04-01', 'yyyy-mm-dd'), 3)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Programming in C', 18, '752063326664', 1, 576, TO_DATE('2004-07-08', 'yyyy-mm-dd'), 17)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('PHP and MySQL Web Development (Developer''s Library)', 19, '752063326725', 2, 1008, TO_DATE('2004-10-01', 'yyyy-mm-dd'), 17)
INTO book (title, book_id, isbn13, language_id, num_pages, publication_date, publisher_id) VALUES ('Manhunt Official Strategy Guide', 20, '752073003227', 1, 175, TO_DATE('2003-11-25', 'yyyy-mm-dd'), 3)
SELECT * FROM dual;

INSERT ALL
INTO book_author (book_id, author_id) VALUES (15, 1)
INTO book_author (book_id, author_id) VALUES (10, 3)
INTO book_author (book_id, author_id) VALUES (8, 7)
INTO book_author (book_id, author_id) VALUES (7, 10)
INTO book_author (book_id, author_id) VALUES (5, 13)
INTO book_author (book_id, author_id) VALUES (4, 16)
INTO book_author (book_id, author_id) VALUES (2, 3)
INTO book_author (book_id, author_id) VALUES (10, 4)
INTO book_author (book_id, author_id) VALUES (7, 11)
INTO book_author (book_id, author_id) VALUES (9, 4)
INTO book_author (book_id, author_id) VALUES (9, 1)
INTO book_author (book_id, author_id) VALUES (6, 11)
INTO book_author (book_id, author_id) VALUES (8, 8)
INTO book_author (book_id, author_id) VALUES (4, 21)
INTO book_author (book_id, author_id) VALUES (10, 5)
INTO book_author (book_id, author_id) VALUES (2, 4)
INTO book_author (book_id, author_id) VALUES (5, 14)
INTO book_author (book_id, author_id) VALUES (5, 15)
INTO book_author (book_id, author_id) VALUES (7, 12)
INTO book_author (book_id, author_id) VALUES (8, 9)
INTO book_author (book_id, author_id) VALUES (8, 10)
INTO book_author (book_id, author_id) VALUES (1, 19)
INTO book_author (book_id, author_id) VALUES (20, 29)
INTO book_author (book_id, author_id) VALUES (10, 6)
INTO book_author (book_id, author_id) VALUES (10, 7)
INTO book_author (book_id, author_id) VALUES (4, 17)
INTO book_author (book_id, author_id) VALUES (11, 18)
INTO book_author (book_id, author_id) VALUES (12, 19)
INTO book_author (book_id, author_id) VALUES (13, 20)
INTO book_author (book_id, author_id) VALUES (14, 21)
INTO book_author (book_id, author_id) VALUES (14, 22)
INTO book_author (book_id, author_id) VALUES (15, 2)
INTO book_author (book_id, author_id) VALUES (16, 23)
INTO book_author (book_id, author_id) VALUES (17, 24)
INTO book_author (book_id, author_id) VALUES (17, 25)
INTO book_author (book_id, author_id) VALUES (18, 25)
INTO book_author (book_id, author_id) VALUES (18, 26)
INTO book_author (book_id, author_id) VALUES (19, 27)
INTO book_author (book_id, author_id) VALUES (19, 28)
INTO book_author (book_id, author_id) VALUES (20, 30)
INTO book_author (book_id, author_id) VALUES (3, 28)
SELECT * FROM dual;



INSERT ALL
INTO country (country_id, country_name) VALUES (1, 'Afghanistan')
INTO country (country_id, country_name) VALUES (2, 'Netherlands Antilles')
INTO country (country_id, country_name) VALUES (3, 'Albania')
INTO country (country_id, country_name) VALUES (4, 'Algeria')
INTO country (country_id, country_name) VALUES (5, 'Andorra')
INTO country (country_id, country_name) VALUES (6, 'Angola')
INTO country (country_id, country_name) VALUES (7, 'Antigua and Barbuda')
INTO country (country_id, country_name) VALUES (8, 'Australasia')
INTO country (country_id, country_name) VALUES (9, 'Argentina')
INTO country (country_id, country_name) VALUES (10, 'Armenia')
INTO country (country_id, country_name) VALUES (11, 'Aruba')
INTO country (country_id, country_name) VALUES (12, 'American Samoa')
INTO country (country_id, country_name) VALUES (13, 'Australia')
INTO country (country_id, country_name) VALUES (14, 'Austria')
INTO country (country_id, country_name) VALUES (15, 'Azerbaijan')
INTO country (country_id, country_name) VALUES (16, 'Bahamas')
INTO country (country_id, country_name) VALUES (17, 'Bangladesh')
INTO country (country_id, country_name) VALUES (18, 'Barbados')
INTO country (country_id, country_name) VALUES (19, 'Burundi')
INTO country (country_id, country_name) VALUES (20, 'Belgium')
INTO country (country_id, country_name) VALUES (21, 'Benin')
INTO country (country_id, country_name) VALUES (22, 'Bermuda')
INTO country (country_id, country_name) VALUES (23, 'Bhutan')
INTO country (country_id, country_name) VALUES (24, 'Bosnia and Herzegovina')
INTO country (country_id, country_name) VALUES (25, 'Belize')
INTO country (country_id, country_name) VALUES (26, 'Belarus')
INTO country (country_id, country_name) VALUES (27, 'Bohemia')
INTO country (country_id, country_name) VALUES (28, 'Boliva')
INTO country (country_id, country_name) VALUES (29, 'Botswana')
INTO country (country_id, country_name) VALUES (30, 'Brazil')
INTO country (country_id, country_name) VALUES (31, 'Bahrain')
SELECT * FROM dual;

INSERT ALL
INTO address (address_id, street_number, street_name, city, country_id) VALUES (1, '57', 'Glacier Hill Avenue', 'Torbat-e Jām', 1)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (2, '86', 'Dottie Junction', 'Beaumont', 2)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (3, '292', 'Ramsey Avenue', 'Cayambe', 3)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (4, '5618', 'Thackeray Junction', 'Caldas', 4)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (5, '4', '2nd Park', 'Ngunguru', 5)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (6, '387', 'Nancy Junction', 'Burirao', 6)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (7, '501', 'Atwood Point', 'Nirji', 7)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (8, '42', 'North Pass', 'Tijão', 8)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (9, '83', 'Graceland Pass', 'Castelo de Vide', 9)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (10, '93', 'Clyde Gallagher Road', 'Shangde', 10)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (11, '604', 'Merrick Circle', 'Taluksangay', 11)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (12, '92233', 'Sundown Court', 'Montbéliard', 12)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (13, '238', 'Corscot Alley', 'Trstenik', 13)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (14, '10441', 'Macpherson Point', 'Trairi', 14)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (15, '1', 'Stuart Avenue', 'Xiangshi', 15)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (16, '29', 'Spaight Plaza', 'Belle-Anse', 16)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (17, '252', 'Main Plaza', 'Moshenskoye', 17)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (18, '119', 'Morning Park', 'Esparza', 18)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (19, '5915', 'Dryden Alley', 'Quebradas', 19)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (20, '16676', 'Shelley Street', 'Mucuri', 20)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (21, '3', 'Warner Parkway', 'Holoubkov', 21)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (22, '66669', 'Surrey Trail', 'Chingas', 22)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (23, '2', 'Drewry Point', 'Miragoâne', 23)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (24, '45', 'Haas Point', 'Timashëvsk', 24)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (25, '5', 'Westerfield Parkway', 'Liwu', 25)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (26, '9', 'Paget Plaza', 'Oliveirinha', 26)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (27, '84', 'Troy Court', 'Turze Pole', 27)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (28, '8', 'Longview Avenue', 'Kliteh', 28)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (29, '55', 'Dorton Pass', 'Huangqiao', 29)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (30, '4', 'Clemons Trail', 'Aricapampa', 30)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (31, '33981', 'Milwaukee Way', 'Mesquite', 31)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (32, '43758', 'Dahle Drive', 'Paipa', 2)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (33, '18795', 'Independence Junction', 'Barrī ash Sharqī', 3)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (34, '4', 'Charing Cross Pass', 'Rennes', 1)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (35, '4776', 'Reinke Park', 'Baih', 4)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (36, '43995', 'Dayton Park', 'Geoktschai', 5)
INTO address (address_id, street_number, street_name, city, country_id) VALUES (37, '50', 'Mayfield Parkway', 'Dhanot', 6)
SELECT * FROM dual;


INSERT ALL
 INTO customer (customer_id, first_name, last_name, email) VALUES (1, 'Ursola', 'Purdy', 'upurdy0@cdbaby.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (2, 'Ruthanne', 'Vatini', 'rvatini1@fema.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (3, 'Reidar', 'Turbitt', 'rturbitt2@geocities.jp')
 INTO customer (customer_id, first_name, last_name, email) VALUES (4, 'Rich', 'Kirsz', 'rkirsz3@jalbum.net')
 INTO customer (customer_id, first_name, last_name, email) VALUES (5, 'Carline', 'Kupis', 'ckupis4@tamu.edu')
 INTO customer (customer_id, first_name, last_name, email) VALUES (6, 'Kandy', 'Adamec', 'kadamec5@weather.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (7, 'Jermain', 'Giraudeau', 'jgiraudeau6@elpais.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (8, 'Nolly', 'Bonicelli', 'nbonicelli7@examiner.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (9, 'Phebe', 'Curdell', 'pcurdell8@usa.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (10, 'Euell', 'Guilder', 'eguilder9@themeforest.net')
 INTO customer (customer_id, first_name, last_name, email) VALUES (11, 'Teriann', 'Marritt', 'tmarritta@va.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (12, 'Filmer', 'Douse', 'fdouseb@foxnews.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (13, 'Daisey', 'Lamball', 'dlamballc@skyrock.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (14, 'Gusella', 'Quogan', 'gquogand@whitehouse.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (15, 'Lonnie', 'Cambden', 'lcambdene@gmpg.org')
 INTO customer (customer_id, first_name, last_name, email) VALUES (16, 'Debbi', 'Huyghe', 'dhuyghef@dot.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (17, 'Ignace', 'Fursey', 'ifurseyg@hatena.ne.jp')
 INTO customer (customer_id, first_name, last_name, email) VALUES (18, 'Andrei', 'Jefferson', 'ajeffersonh@live.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (19, 'Sanford', 'Gillbe', 'sgillbei@telegraph.co.uk')
 INTO customer (customer_id, first_name, last_name, email) VALUES (20, 'Kali', 'Sedgebeer', 'ksedgebeerj@bbc.co.uk')
 INTO customer (customer_id, first_name, last_name, email) VALUES (21, 'Krishnah', 'Traite', 'ktraitek@state.gov')
 INTO customer (customer_id, first_name, last_name, email) VALUES (22, 'Alley', 'Selbie', 'aselbiel@moonfruit.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (23, 'Gilligan', 'Betteson', 'gbettesonm@paypal.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (24, 'Raul', 'Pentelow', 'rpentelown@zimbio.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (25, 'Garrek', 'Emnoney', 'gemnoneyo@nyu.edu')
 INTO customer (customer_id, first_name, last_name, email) VALUES (26, 'Mathilde', 'Kleanthous', 'mkleanthousp@tamu.edu')
 INTO customer (customer_id, first_name, last_name, email) VALUES (27, 'Dacy', 'Mabe', 'dmabeq@cloudflare.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (28, 'Rob', 'Handes', 'rhandesr@arstechnica.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (29, 'Rafaello', 'Boniface', 'rbonifaces@marriott.com')
 INTO customer (customer_id, first_name, last_name, email) VALUES (30, 'Matthiew', 'Donizeau', 'mdonizeaut@rakuten.co.jp')
SELECT * FROM dual;

INSERT INTO customer_address (customer_id, address_id, status_id)
WITH customer_rows AS (
    SELECT c.customer_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM customer c),
address_rows AS (
    SELECT address_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM address
     )
SELECT
c.customer_id,
a.address_id,
1
FROM customer_rows c
INNER JOIN address_rows a
ON a.rn = c.rn;


INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 50 ROWS ONLY
);


/*#Add a line for all orders*/
INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
);


/*#Add order received for all orders older than 12 hours
#Total 7547 orders*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
o.order_id,
1 AS status_id,
o.order_date + (DBMS_RANDOM.VALUE() / 24 * 12) AS status_date
FROM cust_order o
WHERE o.order_date < SYSDATE - (12 / 24);

/*#Add Pending Delivery for most of these orders, within 2 days after the previous step, where orders are older than 2 days
6800 records*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    2 AS status_id,
    o.order_date + (DBMS_RANDOM.VALUE() * 2) AS status_date
    FROM cust_order o
    WHERE o.order_date < SYSDATE - 2
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 6800 ROWS ONLY
);



/* Add Delivery In Progress for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    3 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 2) AS status_date
    FROM order_history o
    WHERE o.status_date < SYSDATE - 2
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 4000 ROWS ONLY
);



/* Add Delivered for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    4 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 6) AS status_date
    FROM order_history o
    WHERE o.status_date < SYSDATE - 6
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 3500 ROWS ONLY
);

