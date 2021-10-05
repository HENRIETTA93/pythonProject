DROP DATABASE IF EXISTS restaurant;
CREATE DATABASE restaurant;

DROP USER IF EXISTS restaurant;
CREATE USER restaurant WITH PASSWORD 'restaurant';

GRANT ALL PRIVILEGES ON DATABASE restaurant TO restaurant;