
-- UHI Project Schema

CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    country_id INT REFERENCES Country(country_id),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE WeatherData (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    month INT,
    temperature FLOAT
);

CREATE TABLE NDVIData (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    month INT,
    ndvi FLOAT
);

CREATE TABLE PopulationData_1km (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    population INT
);

CREATE TABLE PopulationData_5km (
    id SERIAL PRIMARY KEY,
    location_id INT REFERENCES Location(location_id),
    year INT,
    population INT
);

-- Insertions
COPY Country(name)
FROM '/docker-entrypoint-initdb.d/data/countries.csv' DELIMITER ',' CSV HEADER;

COPY Location(location_id, name, country_id, latitude, longitude)
FROM '/docker-entrypoint-initdb.d/data/locations.csv' DELIMITER ',' CSV HEADER;

COPY WeatherData(location_id, year, month, temperature)
FROM '/docker-entrypoint-initdb.d/data/weather.csv' DELIMITER ',' CSV HEADER;

COPY NDVIData(location_id, year, month, ndvi)
FROM '/docker-entrypoint-initdb.d/data/ndvi.csv' DELIMITER ',' CSV HEADER;

COPY PopulationData_1km(location_id, year, population)
FROM '/docker-entrypoint-initdb.d/data/population_1km.csv' DELIMITER ',' CSV HEADER;

COPY PopulationData_5km(location_id, year, population)
FROM '/docker-entrypoint-initdb.d/data/population_5km.csv' DELIMITER ',' CSV HEADER;
