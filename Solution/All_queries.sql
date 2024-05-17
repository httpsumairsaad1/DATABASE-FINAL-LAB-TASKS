USE FINAL;

-- QUESTION 9:
-- oldest director
SELECT name, birthdate
FROM director
ORDER BY birthdate ASC
LIMIT 1;

-- youngest director
SELECT name, birthdate
FROM director
ORDER BY birthdate DESC
LIMIT 1;

-- QUESTION 12:
SELECT d.name, AVG(m.rating) AS avg_rating
FROM director d
JOIN movie m ON d.id = m.id
WHERE m.rating > 8.5
GROUP BY d.name;

SELECT * FROM MOVIE;
SELECT AVG(runtime) FROM movie; -- the avg 153.00;
-- QUESTION 13:
SELECT TITLE, RUNTIME
FROM MOVIE 
WHERE RUNTIME > (SELECT AVG(RUNTIME) FROM MOVIE);

-- QUESTION 11:
SELECT m.title, COUNT(ai.actor_id) AS num_actors
FROM movie m
JOIN acted_in ai ON m.id = ai.movie_id
GROUP BY m.id, m.title
ORDER BY num_actors DESC;


-- ==========================================================
SELECT * FROM ACTOR;
SELECT * FROM MOVIE;
SELECT * FROM PRODUCED_BY;
SELECT * FROM STUDIO;
-- QUESTION 10;
SELECT DISTINCT a.id, a.name
FROM actor a
JOIN acted_in ai ON a.id = ai.actor_id
JOIN movie m ON ai.movie_id = m.id
JOIN produced_by pb ON m.id = pb.movie_id
JOIN (SELECT movie_id
      FROM produced_by
      WHERE studio_id IN (SELECT id FROM studio WHERE name = 'Warner Bros. Pictures')
      UNION
      SELECT movie_id
      FROM produced_by
      WHERE studio_id IN (SELECT id FROM studio WHERE name = 'Paramount Pictures')
     ) AS wp_movies ON m.id = wp_movies.movie_id;

SELECT * FROM MOVIE;
SELECT * FROM GENRE;
-- QUESTION 8:
SELECT m.ID, m.TITLE, m.RELEASEDATE, m.RUNTIME, m.RATING
FROM MOVIE m
LEFT JOIN GENRE g ON m.ID = g.ID
WHERE g.NAME != 'Action' OR g.NAME IS NULL;

-- QUESTION 7:
SELECT DISTINCT a.id, a.name, a.birthdate, g.name
FROM actor a
LEFT JOIN movie m ON a.id = m.id
LEFT JOIN belongs_to bt ON m.id = bt.movie_id
LEFT JOIN genre g ON bt.genre_id = g.id
WHERE g.name NOT IN ('Drama', 'Thriller') OR g.id IS NULL;

SELECT * FROM MOVIE;
-- QUESTION 6 (NOT WORKING):
SELECT a.id, a.name, a.birthdate
FROM actor a
JOIN movie m ON a.id = m.id
WHERE m.releasedate > '1970-01-01'
GROUP BY a.id, a.name, a.birthdate
HAVING COUNT(m.id) >= 3;


-- QUESTION 5:
SELECT s.name AS studio_name, AVG(m.runtime) AS avg_runtime
FROM studio s
JOIN movie m ON s.id = m.id
GROUP BY s.id, s.name
ORDER BY s.name;

-- QUESTION 4:
SELECT g.name AS genre_name, COUNT(m.id) AS movie_count
from genre g
left join movie m ON g.id = m.id
group by g.id, g.name
order by g.name;



-- Question 3:
SELECT m.id, m.title, m.releasedate, m.runtime, m.rating
FROM movie m
JOIN directed d ON m.id = d.movie_id
JOIN director di ON d.director_id = di.id
WHERE di.gender = 'Male'
ORDER BY m.releasedate;

SELECT * FROM ACTOR;
SELECT * FROM MOVIE;
-- QUESTION 2:
SELECT a.id, a.name, a.birthdate
FROM actor a
LEFT JOIN movie m ON a.id = m.id
WHERE m.id IS NULL;

-- QUESTION 1:
SELECT m.title AS movie_title, g.name AS genre_name, s.name AS studio_name
FROM movie m
LEFT JOIN genre g ON m.id = g.id
LEFT JOIN studio s ON m.id = s.id;



