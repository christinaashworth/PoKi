
-- What grades are stored in the database?

SELECT * 
FROM Grade;

-- What emotions may be associated with a poem?

SELECT e.Name
FROM Emotion e;

-- How many poems are in the database?

SELECT Count(Poem.Id) AS NumberOfPoems
FROM Poem;

-- Sort authors alphabetically by name. What are the names of the top 76 authors?

SELECT Top 76 a.Name 
FROM Author a
ORDER BY a.Name asc;
	

-- Starting with the above query, add the grade of each of the authors.

SELECT Top 76 a.Name as AuthorName, g.Name as GradeName
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.Name asc;


-- Starting with the above query, add the recorded gender of each of the authors.

SELECT Top 76 a.Name as AuthorName, g.Name as GradeName, gen.Name as GenderName
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
LEFT JOIN Gender gen ON a.GenderId = gen.Id
ORDER BY a.Name asc;

-- What is the total number of words in all poems in the database?

SELECT SUM(WordCount) 
From Poem p;

-- Which poem has the fewest characters?

SELECT Top 1 p.Title, p.charCount
FROM Poem p
ORDER BY p.charCount asc;

-- How many authors are in the third grade?

SELECT COUNT(a.Id) 
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
WHERE g.Name = '3rd Grade'; 

-- How many authors are in the first, second or third grades?

SELECT COUNT(a.Id) AS First2nd3rdGradeAuthors
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
WHERE g.Name = '3rd Grade' OR g.Name = '2nd Grade' OR g.Name = '1st Grade'; 


-- What is the total number of poems written by fourth graders?

SELECT COUNT(p.Id) AS NumberOf4thGradePoems
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
LEFT JOIN Grade g ON a.GradeId = g.Id
WHERE g.Name = '4th Grade';

-- How many poems are there per grade?

SELECT COUNT(p.Id) AS NumberOfPoems, g.Name
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
LEFT JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.Name
ORDER BY g.Name asc;

-- How many authors are in each grade? (Order your results by grade starting with 1st Grade)

SELECT COUNT(a.Id) AS NumberOfAuthors, g.Name
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.Name
ORDER BY g.Name asc;

-- What is the title of the poem that has the most words?

SELECT TOP 1 p.Title, p.WordCount 
FROM Poem p
ORDER BY p.WordCount desc;

-- Which author(s) have the most poems? (Remember authors can have the same name.)

SELECT a.Id, a.Name, count(p.Id) AS NumberOfPoems
FROM Author a
	JOIN Poem p on a.Id = p.AuthorId
GROUP BY a.Id, a.Name
ORDER BY NumberOfPoems desc


-- How many poems have an emotion of sadness?

SELECT count(pe.Id) AS SadPoems
FROM PoemEmotion pe
	LEFT JOIN Emotion e ON pe.EmotionId = e.Id
WHERE Name = 'Sadness'

-- How many poems are not associated with any emotion?

SELECT count (p.Id) As NullPoems
FROM PoemEmotion

-- Which emotion is associated with the least number of poems?


-- Which grade has the largest number of poems with an emotion of joy?


-- Which gender has the least number of poems with an emotion of fear?