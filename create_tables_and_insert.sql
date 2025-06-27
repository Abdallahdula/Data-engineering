
CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    country_id INT REFERENCES Country(country_id)
);

CREATE TABLE WeatherData (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    temperature FLOAT
);

CREATE TABLE NDVIData (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    ndvi FLOAT
);

CREATE TABLE PopulationData (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    population INT
);

CREATE TABLE PopulationData_1km (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    population INT
);

CREATE TABLE Landcover (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    landcover_type VARCHAR(100),
    area_covered FLOAT
);

COPY Country(name) FROM '/docker-entrypoint-initdb.d/data/countries.csv' DELIMITER ',' CSV HEADER;
COPY Location(name, country_id) FROM '/docker-entrypoint-initdb.d/data/locations.csv' DELIMITER ',' CSV HEADER;
COPY WeatherData(location_id, year, temperature) FROM '/docker-entrypoint-initdb.d/data/weather.csv' DELIMITER ',' CSV HEADER;
COPY NDVIData(location_id, year, ndvi) FROM '/docker-entrypoint-initdb.d/data/ndvi.csv' DELIMITER ',' CSV HEADER;
COPY PopulationData(location_id, year, population) FROM '/docker-entrypoint-initdb.d/data/population_5km.csv' DELIMITER ',' CSV HEADER;
COPY PopulationData_1km(location_id, year, population) FROM '/docker-entrypoint-initdb.d/data/population_1km.csv' DELIMITER ',' CSV HEADER;
