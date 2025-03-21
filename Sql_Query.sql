use sql_inte_spotify;
select  * from new_spotify_app;
## 📌 Insight: This lists the top 10 most popular songs in the dataset.
SELECT song_title, artist, popularity_category
FROM new_spotify_app
WHERE popularity_category = 'High'
ORDER BY popularity_category DESC
LIMIT 10;
##  Average Song Duration by Genre
SELECT genre, AVG(duration_min) AS avg_duration
FROM new_spotify_app
GROUP BY genre
ORDER BY avg_duration DESC;

## . Total Number of Songs by Popularity Category
SELECT popularity_category, COUNT(*) AS total_songs
FROM new_spotify_app
GROUP BY popularity_category
ORDER BY total_songs DESC;

## Top 5 Artists with the Most Songs
SELECT artist, COUNT(*) AS song_count
FROM new_spotify_app
GROUP BY artist
ORDER BY song_count DESC
LIMIT 5;
##  Songs with the Highest Stream Count
SELECT song_title, artist, stream
FROM new_spotify_app
ORDER BY stream DESC
LIMIT 10;

##Yearly Song Releases Trend
SELECT release_year, COUNT(*) AS song_count
FROM new_spotify_app
GROUP BY release_year
ORDER BY release_year;

## Explicit vs. Non-Explicit Songs Ratio
SELECT 
    explicit_content, 
    COUNT(*) AS total_songs
FROM new_spotify_app
GROUP BY explicit_content;

## Most Common Song Duration Category
SELECT CASE 
           WHEN duration_min < 3 THEN 'Short (<3 min)'
           WHEN duration_min BETWEEN 3 AND 5 THEN 'Medium (3-5 min)'
           ELSE 'Long (>5 min)'
       END AS duration_category, 
       COUNT(*) AS total_songs
FROM new_spotify_app
GROUP BY duration_category
ORDER BY total_songs DESC;

## Most Popular Genre
SELECT genre, COUNT(*) AS total_songs
FROM new_spotify_app
GROUP BY genre
ORDER BY total_songs DESC
LIMIT 5;
## Find Most Streamed Old Songs & Their Composers

SELECT 
    song_title, 
    artist, 
    composer,
    release_year,
    log_streams
FROM new_spotify_app
WHERE release_year < 2000
ORDER BY log_streams DESC
LIMIT 10;
