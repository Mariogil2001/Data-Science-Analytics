# Data Science: Analytics.
## Autores ✒️
**Mario Gil Domingo**
###  Construido con 🛠️
* [Visual Code Studio](https://code.visualstudio.com/download) 
* [Python](https://www.python.org/)
* [SQL Visual code](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)
* [SQL Visual code viewer](https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer)
* [Pandas](https://pandas.pydata.org/)
* [Matplotlib](https://matplotlib.org/)

### Contenido del repositorio 💬

02-12-2023
- Creada base de datos para el curso de **LEARN SQL** de [Codeacademy](https://www.codecademy.com/learn).
- Añadido Proyecto **Create a table**.
 ```
 CREATE TABLE friends (
   id INTEGER,
   name TEXT,
   birthday DATE
);
```
- Añadido tabla "nomnom" a la basde de datos para el proyecto New York Restaurants.
- Añadido Proyecto **New York Restaurants**.

![Tabla New York Restaurant](/Learn%20SQL/New%20York%20Restaurant/New_york_restaurant.png)

04-12-2023
- Añadido proyecto sobre Tendencias en las Startups en el apartado de **LEARN SQL** de [Codeacademy](https://www.codecademy.com/learn). Donde se incluye la creación de la base de datos con el archivo *startup_database.sql* y donde se hacen todas las queries en *queries.sql*
```
CREATE TABLE startups (
    name text,
    location text,
    category text,
    employees INT,
    raised INT,
    valuation INT,
    founded INT,
    stage text,
    ceo text,
    info TEXT
);
```
- Añadido proyecto sobre las Tendencias en las noticias de Hacker News para el apartado de **LEARN SQL** de [Codeacademy](https://www.codecademy.com/learn). Donde se incluye la creación de la base de datos con el archivo *database.sql* y donde se hacen todas las queries en *queries.sql* Además de la base de datos en un archivo csv y del archivo JSON de donde viene.

```
CREATE TABLE hacker_news (
    id text,
    title text,
    url text,
    rank float,
    score float,
    timestamp DATETIME
);
.mode csv
.separator ";"
.import "Data-Science-Analytics\\Learn SQL\\Analyze Hacker News Trends\\archivo.csv" hacker_news
```