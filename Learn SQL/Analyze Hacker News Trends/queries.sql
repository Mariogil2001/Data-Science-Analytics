/*
Hacker News is a popular website run by Y Combinator. It’s widely known by people in the tech industry as a community site for sharing news, showing off projects, asking questions, among other things.

In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007. It has the following columns:

    id: identifier of the story
    title: the title of the story
    url: the link of the story
    rank: the rankof the story
    score: the score of the story
    timestamp: the time of the story

Let’s get started!
*/

/*
Start by getting a feel for the hacker_news table!
Let’s find the most popular Hacker News stories:
*/
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

/*
Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).
Is this true of Hacker News?
Is a small percentage of Hacker News submitters taking the majority of the points?
First, find the total score of all the stories.
*/
SELECT SUM(score) as total_score
FROM hacker_news;

/*Next, we need to pinpoint the users who have accumulated a lot of points across their stories.
Find the individual users who have gotten combined scores of more than 200, and their combined scores.
GROUP BY and HAVING are needed!
*/
SELECT id, SUM(score)
FROM hacker_news
GROUP BY id
HAVING SUM(score) > 200
ORDER BY 2 DESC;

/*
Then, we want to add these users’ scores together and divide by the total to get the percentage.
Add their scores together and divide it by the total sum. Like so:
*/
SELECT ((top_users_total * 1.0)/ total)*100 as 'Top User Percent of Score'
 FROM (SELECT SUM(top_user_total) AS top_users_total
      FROM (SELECT id, SUM(score) AS top_user_total
          FROM hacker_news
          GROUP BY 1
          HAVING top_user_total > 200)),
      (SELECT SUM(score) AS total
      FROM hacker_news);

/*
Oh no! While we are looking at the power users, some users are rickrolling — 
tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.
The url of the video is:
https://www.youtube.com/watch?v=dQw4w9WgXcQ
How many times has each offending user posted this link?
*/
SELECT id,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%youtube%' -- If I put the youtube link nothing happends bc is a different data base.
GROUP BY id
ORDER BY COUNT(*) DESC;

/*
Hacker News stories are essentially links that take users to other websites.
Which of these sites feed Hacker News the most:
GitHub, Medium, or New York Times?
First, we want to categorize each story based on their source.
We can do this using a CASE statement:
*/
SELECT 
 CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news;

/*
Next, build on the previous query:
Add a column for the number of stories from each URL using COUNT().
Also, GROUP BY the CASE statement.
Remember that you can refer to a column in GROUP BY using a number.
*/
SELECT 
 CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*) as Count
FROM hacker_news
GROUP BY 1;

/*
Every submitter wants their story to get a high score so that the story makes it to the front page, but…
What’s the best time of the day to post a story on Hacker News?
Before we get started, let’s run this query and take a look at the timestamp column:
*/
SELECT timestamp
FROM hacker_news
LIMIT 10;

/*
SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.
It takes two arguments:
strftime(format, column)
Let’s test this function out:
*/

SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

/*
Okay, now we understand how strftime() works. Let’s write a query that returns three columns:
    The hours of the timestamp
    The average score for each hour
    The count of stories for each hour
*/
SELECT strftime('%H', timestamp) as Hour, 
   AVG(score),
   COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;

/*
Let’s edit a few things in the previous query:

    Round the average scores (ROUND()).

    Rename the columns to make it more readable (AS).

    Add a WHERE clause to filter out the NULL values in timestamp.

Take a look at the result again:

What are the best hours to post a story on Hacker News?
*/

SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;

-- The bess hours to post a story is at 17 or 05.