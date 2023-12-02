/*
New York Restaurants

We have put together a table of restaurants called nomnom and we need your help to answer some questions. Use the SQL commands you just learned and find the best dinner spots in the city.
*/

-- We create the nomnom table that will carry all the data of the restaurants in New York.
CREATE TABLE nomnom (
    name TEXT,
    neighborhood TEXT,
    cuisine TEXT,
    review FLOAT,
    price TEXT,
    health TEXT
);

-- Insert all values into the table
INSERT INTO nomnom (name, neighborhood, cuisine, review, price, health)
    VALUES
    ('Peter Luger Steak House', 'Brooklyn', 'Steak', 4.4, '$$$$', 'A'),
    ('Jongro BBQ', 'Midtown', 'Korean', 4.5, '$$', 'A'),
    ('Pocha 32', 'Midtown', 'Korean', 4, '$$', 'A'),
    ('Nom Wah Tea Parlor', 'Chinatown', 'Chinese', 4.2, '$', 'A'),
    ('Roberta''s', 'Brooklyn', 'Pizza', 4.4, '$$', 'A'),
    ('Speedy Romeo', 'Brooklyn', 'Pizza', 4.4, '$$', 'A'),
    ('Bunna Cafe', 'Brooklyn', 'Ethiopian', 4.6, '$$', 'A'),
    ('Massawa', 'Uptown', 'Ethiopian', 4, '$$', NULL),
    ('Buddha Bodai', 'Chinatown', 'Vegetarian', 4.2, '$$', 'A'),
    ('Nan Xiang Xiao Long Bao', 'Queens', 'Chinese', 4.2, '$', 'A'),
    ('Mission Chinese Food', 'Downtown', 'Chinese', 3.9, '$$', 'A'),
    ('Baohaus', 'Downtown', 'Chinese', 4.2, '$', 'A'),
    ('al di la Trattoria', 'Brooklyn', 'Italian', 4.4, '$$$', 'A'),
    ('Locanda Vini & Olii', 'Brooklyn', 'Italian', 4.4, '$$$', 'A'),
    ('Rao''s', 'Uptown', 'Italian', 4.2, '$$$', 'A'),
    ('Minca', 'Downtown', 'Japanese', 4.4, '$$', 'A'),
    ('Kenka', 'Downtown', 'Japanese', 4.3, '$', 'B'),
    ('Yakitori Taisho', 'Downtown', 'Japanese', 4.1, '$', 'B'),
    ('Xi''an Famous Foods', 'Midtown', 'Chinese', 4.4, '$', 'A'),
    ('Shake Shack', 'Midtown', 'American', 4.4, '$', 'A'),
    ('The Halal Guys', 'Midtown', 'Mediterranean', 4.4, '$', 'A'),
    ('Foodcademy', 'Midtown', 'American', 4.4, '$$', 'A'),
    ('Sonnyboy''s', 'Brooklyn', 'Chinese', 4.2, '$$', 'A'),
    ('The Cole Romano Experience', 'Brooklyn', 'Italian', 2.1, '$$$$$', 'C'),
    ('Timbo Slice', 'Brooklyn', 'Pizza', 2.8, '$', 'B'),
    ('Scorpio Sisters', 'Downtown', 'American', 4.2, '$$', 'A'),
    ('N.E.D', 'Uptown', 'American', 4.2, '$$$', 'A'),
    ('Great NY Noodletown', 'Chinatown', 'Chinese', 4.1, '$$', 'B'),
    ('Golden Unicorn', 'Chinatown', 'Chinese', 3.8, '$$', 'A'),
    ('Wo Hop', 'Chinatown', 'Chinese', 4.2, '$', NULL),
    ('Di Fara Pizza', 'Brooklyn', 'Pizza', 4.2, '$$', 'A'),
    ('Kang Ho Dong Baekjeong', 'Midtown', 'Korean', 4.3, '$$$', 'C'),
    ('Roti Roll Bombay Frankie', 'Uptown', 'Indian', 4.2, '$', 'A'),
    ('Jacob''s Pickles', 'Uptown', 'American', NULL, '$$', NULL),
    ('Dan and John''s Wings', 'Downtown', 'American', 4.5, '$', 'A'),
    ('Ping''s Seafood', 'Chinatown', 'Chinese', 4.2, '$$', 'A'),
    ('XO Kitchen', 'Chinatown', 'Chinese', 4, '$', 'B'),
    ('Carbone', 'Downtown', 'Italian', 4.3, '$$$', 'A'),
    ('I Sodi', 'Downtown', 'Italian', 4.5, '$$$', 'A'),
    ('Lilia', 'Brooklyn', 'Italian', 4.4, '$$$', 'A'),
    ('Enid''s', 'Brooklyn', 'Soul Food', 4, '$$', 'A'),
    ('Jajaja', 'Downtown', 'Vegetarian', 4.5, '$$', 'A'),
    ('Smalls Jazz Club', 'Downtown', 'American', NULL, '$$', 'A'),
    ('Russ & Daughters', 'Downtown', 'American', 4.6, '$$', 'A'),
    ('The Meatball Shop', 'Downtown', 'American', 4.2, '$', 'A'),
    ('Dirt Candy', 'Downtown', 'Vegetarian', 4.4, '$$$', 'A'),
    ('Ippudo', 'Downtown', 'Japanese', 4.4, '$$', 'A'),
    ('St. Anselm', 'Brooklyn', 'Steak', 4.5, '$$', 'A'),
    ('Marea', 'Midtown', 'Italian', 4.5, '$$$$', 'A'),
    ('Lighthouse', 'Brooklyn', 'American', 4.6, '$$', NULL),
    ('Los Hermanos', 'Brooklyn', 'Mexican', 4.4, '$', NULL),
    ('The Standard Biergarten', 'Downtown', 'American', 4, '$$', 'A'),
    ('Ootoya', 'Downtown', 'Japanese', 4.5, '$$', 'A');









--What are the distinc neighborhood's?
SELECT DISTINCT neighborhood
FROM nomnom;

--What are the distinct cuisine types?
select distinct cuisine
from nomnom;

--Suppose we would like some Chinese takeout. What are our options?
select *
from nomnom
where cuisine = 'Chinese';

--Return all the restaurants with review's of 4 and above
select *
from nomnom
where review > 4;

--Suppose Abbi and llana want to have a fancy dinner date. Return all the restaurants that are Italian and $$$.
select *
from nomnom
where cuisine = 'Italian'
and price = '$$$';

/*
Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it.

Can you find it for him using a query?
*/
select *
from nomnom
where name like '%meatball%';

--Let’s order delivery to the house! Find all the close by spots in Midtown, Downtown or Chinatown.
select *
from nomnom
where neighborhood = 'Midtown' 
or neighborhood = 'Downtown'
or neighborhood = 'Chinatown';

--Find all the health grade pending restaurants (empty values).
select * 
from nomnom
where health is null;

--Create a Top 10 Restaurants Ranking based on review's.
select *
from nomnom
order by review desc
limit 10;

/*
Use a CASE statement to change the rating system to:

    review > 4.5 is Extraordinary
    review > 4 is Excellent
    review > 3 is Good
    review > 2 is Fair
    Everything else is Poor

Don’t forget to rename the new column!
*/
select name,
  case
  when review > 4.5 then 'Extraordinary'
  when review > 4 then 'Excellent'
  when review > 3 then 'Good'
  when review > 2 then 'Fair'
  else 'Poor'
  end as 'Review'
from nomnom;
