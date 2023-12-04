
CREATE TABLE hacker_news (
    id text,
    title text,
    url text,
    rank float,
    score float,
    timestamp DATETIME
);

DROP TABLE IF EXISTS hacker_news;

/*
Para obtener los datos se ha descargado un JSON de http://eliot-jones.com:5690/api/results/rust
Luego se ha abierto con Microsoft Excel y se ha abierto el archivo e importado de la forma correcta
A continuación se han usado las lineas de acontinuación para meterlo en data.bd
*/
.mode csv
.separator ";"
.import "C:\\Users\\mario\\OneDrive\\Escritorio\\Cursos\\Data-Science-Analytics\\Learn SQL\\Analyze Hacker News Trends\\archivo.csv" hacker_news
