USE BooksDB
SELECT original_publication_year, COUNT(book_id)
    FROM Books 
    WHERE language_code NOT LIKE 'en%' AND
        original_publication_year BETWEEN 2000 AND 2010
    GROUP by original_publication_year

SELECT original_publication_year, COUNT(book_id)
    FROM Books 
    WHERE original_publication_year  BETWEEN 1800 AND 1900
    GROUP by original_publication_year


    USE BooksDB
SELECT COUNT(*) book_id
FROM Books
WHERE original_publication_year < 1800





USE BooksDB
SELECT * 
    FROM BOOKS 
    WHERE AUTHORS IN ('Bill Waterson', 'Brandon Sanderson', 'J.K. Rowling, Mary GrandPré')
    ORDER BY authors ASC, title ASC, average_rating DESC




SELECT Max(start_lng)AS easterly_pickup
FROM RideShareDB.dbo.lyft

select language_code

SELECT min(start_lat)AS northerly_pickup
FROM RideShareDB.dbo.lyft


SELECT  CHARINDEX('the', title)>0
from BooksDB.dbo.books

SELECT TOP 300 b.title, 
            b.average_rating, 
            b.books_count,
            tr.user_id, 
            tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
--WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating


-- Query 1: LEFT JOIN - 92760 - LEFT JOIN with NULL - 83557
SELECT COUNT(*)
    FROM BooksDB.dbo.books AS b
    LEFT JOIN BooksDB.dbo.to_read AS tr
    ON b.best_book_id = tr.book_id
    WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating;

-- INNER JOIN - 83557
SELECT COUNT(*)
    FROM BooksDB.dbo.books AS b
    INNER JOIN BooksDB.dbo.to_read AS tr
    ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;

SELECT TOP 300 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
RIGHT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;

SELECT TOP 1000 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
FULL JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
--ORDER BY b.average_rating;

SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
--WHERE b.title IS NOT NULL
ORDER BY tr.book_id;

SELECT TOP 1 b.title,bt.count
FROM BooksDB.dbo.books AS b
JOIN BooksDB.dbo.book_tags AS bt
ON b.best_book_id= bt.goodreads_book_id
ORDER by bt.count desc

SELECT top 10 tag_id
from BooksDB.dbo.book_tags
ORDER BY tag_id DESC

SELECT *
FROM BOOKSDB.dbo.tags

SELECT  TR.USER_ID,
        B.TITLE,
        COUNT(TR.BOOK_ID) AS USER_READ
    FROM BooksDB.dbo.books AS b
    JOIN BooksDB.dbo.to_read AS tr
    ON b.book_id = tr.book_id
    GROUP BY TR.USER_ID, B.TITLE
    ORDER BY USER_READ DESC

select top 1 * from booksdb.dbo.book_tags order by count desc

SELECT TOP 10 b.title AS Popular_title,count(tr.user_id)
FROM BooksDB.dbo.books AS b
JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
GROUP BY b.title,count(tr.user_id)

SELECT  TOP 10 
        B.TITLE AS Popular_Title,
        COUNT(TR.USER_ID) AS User_Count_To_Read
    FROM BOOKSDB.DBO.BOOKS AS B
        JOIN BOOKSDB.DBO.TO_READ AS TR
        ON B.BOOK_ID = TR.BOOK_ID
    GROUP BY B.TITLE
    ORDER BY User_Count_To_Read DESC

SELECT  TOP 10 
        TR.USER_ID AS Top_User,
        COUNT(B.TITLE) AS Title_Count
    FROM BOOKSDB.DBO.BOOKS AS B
        JOIN BOOKSDB.DBO.TO_READ AS TR
        ON B.BOOK_ID = TR.BOOK_ID
    GROUP BY TR.USER_ID
    ORDER BY Title_Count DESC


    SELECT tag_name,COUNT(tag_id)
    FROM BooksDB.dbo.tags
    WHERE tag_name LIKE '%women%'
    GROUP BY tag_name


SELECT *
from BooksDB.dbo.ratings
--ORDER BY rating DESC

select *
from BooksDB.dbo.tags


--Highlight popular women writers based on ratings from BooksDB by writing a query that returns tag_id, the number of times each tag_id is used and the tag_name. 
--Use the GROUP BY and HAVING clause to narrow your focus and try multiple keywords, such as "woman" and "female".

SELECT  T.TAG_ID, 
        T.TAG_NAME, 
        BT.COUNT
        FROM BOOKSDB.DBO.BOOK_TAGS BT,
             BOOKSDB.DBO.TAGS T
        WHERE   BT.TAG_ID = T.TAG_ID
            GROUP BY T.TAG_ID, T.TAG_NAME, BT.COUNT
            HAVING T.TAG_NAME LIKE '%women%' OR T.TAG_NAME LIKE '%female%' 
            ORDER BY BT.COUNT DESC

SELECT  B.AUTHORS,
        B.AVERAGE_RATING,
        T.TAG_ID, 
        T.TAG_NAME, 
        BT.COUNT
        FROM BOOKSDB.DBO.BOOKS B,
             BOOKSDB.DBO.BOOK_TAGS BT,
             BOOKSDB.DBO.TAGS T
        WHERE   B.BOOK_ID = BT.GOODREADS_BOOK_ID AND
                BT.TAG_ID = T.TAG_ID
            GROUP BY B.AUTHORS, B.AVERAGE_RATING, T.TAG_ID, T.TAG_NAME, BT.COUNT
            HAVING T.TAG_NAME LIKE '%women%' OR T.TAG_NAME LIKE '%female%' 
            ORDER BY B.AVERAGE_RATING DESC

SELECT  B.AUTHORS,
        B.AVERAGE_RATING,
        B.TITLE,
        T.TAG_ID, 
        T.TAG_NAME, 
        BT.COUNT
        FROM BOOKSDB.DBO.BOOKS B,
             BOOKSDB.DBO.BOOK_TAGS BT,
             BOOKSDB.DBO.TAGS T
        WHERE   B.BOOK_ID = BT.GOODREADS_BOOK_ID AND
                BT.TAG_ID = T.TAG_ID
            GROUP BY B.AUTHORS, B.AVERAGE_RATING, T.TAG_ID, T.TAG_NAME, BT.COUNT,B.title
            HAVING T.TAG_NAME LIKE '%women%' OR T.TAG_NAME LIKE '%female%' 
            ORDER BY B.AVERAGE_RATING DESC


SELECT  TOP 10 
        TR.USER_ID AS Top_User,
        COUNT(B.TITLE) AS Title_Count
    FROM BOOKSDB.DBO.BOOKS AS B
        JOIN BOOKSDB.DBO.TO_READ AS TR
        ON B.BOOK_ID = TR.BOOK_ID
    GROUP BY TR.USER_ID
    ORDER BY Title_Count DESC

SELECT  B.AUTHORS,
        B.AVERAGE_RATING,
        B.TITLE,
        T.TAG_ID, 
        T.TAG_NAME
        FROM BOOKSDB.DBO.BOOKS B         
            JOIN BOOKSDB.DBO.TAGS T
             ON   BT.TAG_ID = T.TAG_ID
            GROUP BY B.AUTHORS, B.AVERAGE_RATING, T.TAG_ID, T.TAG_NAME,B.title
            HAVING T.TAG_NAME LIKE '%women%' OR T.TAG_NAME LIKE '%female%' 
            ORDER BY B.AVERAGE_RATING DESC


SELECT B.BOOK_ID,
        B.TITLE,
        B.AUTHORS,
        BT.TA

SELECT  b.id,
        B.book_id,
        B.TITLE,
        B.AUTHORS,
        B.AVERAGE_RATING,
        T.TAG_ID, 
        T.TAG_NAME, 
        BT.COUNT
        FROM BOOKSDB.DBO.BOOKS B,
             BOOKSDB.DBO.BOOK_TAGS BT,
             BOOKSDB.DBO.TAGS T
        WHERE   B.BOOK_ID = BT.GOODREADS_BOOK_ID AND
                BT.TAG_ID = T.TAG_ID
            GROUP BY b.id,B.BOOK_ID, B.TITLE, B.AUTHORS, B.AVERAGE_RATING, T.TAG_ID, T.TAG_NAME, BT.COUNT
            HAVING T.TAG_NAME LIKE '%spring%' 
            ORDER BY B.AVERAGE_RATING DESC

        SELECT  B.AUTHORS,
        B.AVERAGE_RATING,
        B.TITLE,
        T.TAG_ID, 
        T.TAG_NAME, 
        BT.COUNT
        FROM BOOKSDB.DBO.BOOKS B
           JOIN  BOOKSDB.DBO.BOOK_TAGS BT
            ON   B.BOOK_ID = BT.GOODREADS_BOOK_ID 
             JOIN BOOKSDB.DBO.TAGS T
             ON   BT.TAG_ID = T.TAG_ID
            GROUP BY B.AUTHORS, B.AVERAGE_RATING, T.TAG_ID, T.TAG_NAME, BT.COUNT,B.title
            HAVING T.TAG_NAME LIKE '%women%' OR T.TAG_NAME LIKE '%female%' 
            ORDER BY B.AVERAGE_RATING DESC


            SELECT *
            from LaborStatisticsDB.dbo.seasonal

            SELECT *
            from LaborStatisticsDB.dbo.supersector

            SELECT *
            FROM LaborStatisticsDB.dbo.industry
            WHERE industry_name LIKE '%commercial%'

-- What is the series id for women employees in the commercial banking industry in the financial activities supersector?

-- financial activities supersector
    SELECT *
            FROM LaborStatisticsDB.dbo.supersector
            WHERE supersector_name = 'Financial activities'

--commercial banking industry
 SELECT *
            FROM LaborStatisticsDB.dbo.industry
            WHERE industry_name = 'Commercial banking'

    SELECT *
    FROM LaborStatisticsDB.dbo.series
    WHERE supersector_code = 55 AND
          industry_code = 55522110 AND
          series_title = 'Women employees' 
    

    SELECT data_type_code,series_title
    from LaborStatisticsDB.dbo.series
    WHERE series_title = 'Women employees'

SELECT * FROM BooksDB.dbo.books

select best_book_id, ratings_1,ratings_5 
FROM booksdb.dbo.books
WHERE ratings_1 > 1000 AND ratings_5 > 1000
ORDER BY best_book_id
--group by best_book_id, ratings_1,ratings_5
--having ratings_1 > 1000 AND ratings_5 > 1000

SELECT best_book_id,ratings_1,ratings_5
FROM BooksDB.dbo.books 
WHERE ratings_1 > 1000
UNION 
SELECT best_book_id,ratings_1,ratings_5
FROM BooksDB.dbo.books
WHERE ratings_5 >1000 
ORDER BY best_book_id


SELECT best_book_id,language_code
FROM BooksDB.dbo.books
WHERE language_code = 'en-US' AND language_code != 'en-GB'

SELECT tag_id, count FROM BooksDB.dbo.book_tags
WHERE [count] >100000
GROUP BY tag_id,count

SELECT tag_name FROM BooksDB.dbo.tags
WHERE tag_id = '30574'

SELECT * from BooksDB.dbo.book_tags
WHERE count >100000

select * FROM BooksDB.dbo.books

SELECT title,authors
FROM BooksDB.dbo.books
WHERE authors LIKE '%,%'

SELECT tag_name
FROM BooksDB.dbo.tags
WHERE tag_name LIKE '%Meditation%'

SELECT 
       distinct B.TITLE
        --T.TAG_ID, 
       -- T.TAG_NAME        
        FROM BOOKSDB.DBO.BOOKS B
           JOIN  BOOKSDB.DBO.BOOK_TAGS BT
            ON   B.BOOK_ID = BT.GOODREADS_BOOK_ID 
             JOIN BOOKSDB.DBO.TAGS T
             ON   BT.TAG_ID = T.TAG_ID
            WHERE T.TAG_NAME LIKE '%Meditation%' 


SELECT * FROM  
    BOOKSDB.DBO.BOOKS
    --BOOKSDB.DBO.BOOK_TAGS
    --BOOKSDB.DBO.TAGS
    --BOOKSDB.DBO.RATINGS

SELECT B.ORIGINAL_PUBLICATION_YEAR, 
       AVG(B.AVERAGE_RATING)
    FROM BOOKSDB.DBO.books B
    ORDER BY ORIGINAL_PUBLICATION_YEAR DESC

SELECT B.ORIGINAL_PUBLICATION_YEAR, 
       AVG(B.AVERAGE_RATING)
    FROM BOOKSDB.DBO.books B
    GROUP BY B.ORIGINAL_PUBLICATION_YEAR
    ORDER BY ORIGINAL_PUBLICATION_YEAR DESC

    SELECT * FROM LaborStatisticsDB.dbo.supersector

SELECT * FROM May2024JunkDB.shanthi.book

SELECT * FROM May2024JunkDB.shanthi.genre
WHERE genres = 'Mystery'

SELECT * FROM May2024JunkDB.shanthi.book
WHERE genre_id = 6

select * FROM May2024JunkDB.shanthi.reference_books

SELECT PATRON_ID,
       LOAN_ID,
       BOOK_ID
INTO May2024JunkDB.shanthi.#patron_loan_temp
FROM May2024JunkDB.shanthi.loan


SELECT P.FIRST_NAME,
       P.LAST_NAME,
       B.BOOK_ID,
       B.TITLE,
       G.GENRES
       FROM May2024JunkDB.shanthi.book B,
            May2024JunkDB.shanthi.patron P,
            May2024JunkDB.shanthi.loan L,
            May2024JunkDB.shanthi.genre G
       WHERE P.LOAN_ID = L.LOAN_ID AND
             L.BOOK_ID = B.BOOK_ID AND
             B.GENRE_ID = G.GENRE_ID



SELECT p.first_name,p.last_name,g.genres
FROM May2024JunkDB.shanthi.patron as p,
     May2024JunkDB.shanthi.genre as g
WHERE p.patron_id = (SELECT l.patron_id FROM May2024JunkDB.shanthi.loan as l
                     WHERE p.patron_id = l.patron_id AND l.book_id = 
                     (SELECT b.book_id FROM May2024JunkDB.shanthi.book as b
                    WHERE l.book_id = b.book_id And b.genre_id = 
                    (SELECT g.genre_id FROM May2024JunkDB.shanthi.genre as g 
                    WHERE b.genre_id = g.genre_id)))
             
SELECT * FROM 
    May2024JunkDB.shanthi.patron
    --May2024JunkDB.shanthi.loan
    --May2024JunkDB.shanthi.book

SELECT * from  
       -- LaborStatisticsDB.dbo.[period]
      --LaborStatisticsDB.dbo.january_2017
    --LaborStatisticsDB.dbo.annual_2016
    --LaborStatisticsDB.dbo.industry
LaborStatisticsDB.dbo.datatype
   -- LaborStatisticsDB.dbo.series
    --LaborStatisticsDB.dbo.seasonal
    --WHERE DATA_TYPE_CODE IN (1,25,26)
    WHERE data_type_text like '%PRODUCTION AND NONSUPERVISORY EMPLOYEES%'

    What is the total weekly payroll for production and nonsupervisory employees across all industries in January 2017? Round to the nearest penny.

SELECT AVG(J.VALUE) FROM 
        LaborStatisticsDB.dbo.january_2017 J,
        LaborStatisticsDB.dbo.series S,
        LaborStatisticsDB.dbo.datatype DT
    WHERE J.SERIES_ID = S.SERIES_ID AND
          S.DATA_TYPE_CODE = DT.DATA_TYPE_CODE AND
          DT.DATA_TYPE_TEXT = 'ALL EMPLOYEES'




SELECT * FROM 
        LaborStatisticsDB.dbo.january_2017 J,
        LaborStatisticsDB.dbo.series S,
        LaborStatisticsDB.dbo.datatype DT
    WHERE J.SERIES_ID = S.SERIES_ID AND
          S.DATA_TYPE_CODE = DT.DATA_TYPE_CODE AND
          DT.DATA_TYPE_TEXT = 'AVERAGE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'

select * from LaborStatisticsDB.dbo.january_2017
select * from LaborStatisticsDB.dbo.[period]

SELECT ROUND(AVG(a.VALUE),2) AS AVERAGE_EARNINGS,s.industry_code,i.industry_name
FROM LaborStatisticsDB.dbo.annual_2016 as a ,
     LaborStatisticsDB.dbo.series as s ,
     LaborStatisticsDB.dbo.industry as i
WHERE a.series_id = s.series_id AND 
       s.industry_code = i.industry_code AND 
       a.SERIES_ID IN (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series WHERE data_type_code = 30)
GROUP BY s.industry_code,i.industry_name
ORDER BY AVERAGE_EARNINGS DESC
UNION
SELECT ROUND(AVG(j.VALUE),2) AS AVERAGE_EARNINGS,s.industry_code,i.industry_name
FROM LaborStatisticsDB.dbo.january_2017 as j ,
     LaborStatisticsDB.dbo.series as s ,
LaborStatisticsDB.dbo.industry as i
WHERE j.series_id = s.series_id AND 
       s.industry_code = i.industry_code AND 
       j.SERIES_ID IN (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series WHERE data_type_code = 30)
GROUP BY s.industry_code,i.industry_name
ORDER BY AVERAGE_EARNINGS DESC

select * from LaborStatisticsDB.dbo.industry

SELECT ROUND(SUM(VALUE),2) AS AVERAGE_EARNINGS,[year],[period]
FROM LaborStatisticsDB.dbo.annual_2016
WHERE SERIES_ID IN (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series
WHERE data_type_code = 82)
GROUP BY [year],[period]
UNION
SELECT ROUND(SUM(VALUE),2) AS AVERAGE_EARNINGS,[year],[period]
FROM LaborStatisticsDB.dbo.january_2017
WHERE SERIES_ID IN  (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series
WHERE data_type_code = 82)
GROUP BY [year],[period]

SELECT ROUND(SUM(a.VALUE),2) AS TOTAL_EARNINGS,
       s.industry_code,
       i.industry_name
FROM (SELECT * FROM LaborStatisticsDB.dbo.annual_2016 UNION ALL SELECT * FROM LaborStatisticsDB.dbo.january_2017) as a,
     LaborStatisticsDB.dbo.series as s,
     LaborStatisticsDB.dbo.industry as i
WHERE a.series_id = s.series_id AND 
       s.industry_code = i.industry_code AND 
       a.SERIES_ID IN (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series WHERE data_type_code = 82)
GROUP BY s.industry_code,i.industry_name
ORDER BY TOTAL_EARNINGS DESC


441450646	05000000	Total private
1774.38	32324000	Petroleum and coal products


SELECT ROUND(SUM(a.VALUE),2) AS TOTAL_EARNINGS,
       a.year,
       a.period
FROM (SELECT * FROM LaborStatisticsDB.dbo.annual_2016 UNION ALL SELECT * FROM LaborStatisticsDB.dbo.january_2017) as a,
     LaborStatisticsDB.dbo.series as s,
     LaborStatisticsDB.dbo.industry as i
WHERE a.series_id = s.series_id AND 
       s.industry_code = i.industry_code AND 
       a.SERIES_ID IN (SELECT SERIES_ID FROM LaborStatisticsDB.dbo.series WHERE data_type_code = 82)
GROUP BY a.year,a.period 
ORDER BY TOTAL_EARNINGS DESC

SELECT S.INDUSTRY_CODE,I.INDUSTRY_NAME,SUM(VALUE)
FROM  LaborStatisticsDB.dbo.january_2017 J,
      LaborStatisticsDB.dbo.series S,
      LaborStatisticsDB.dbo.industry I,
      LaborStatisticsDB.dbo.datatype DT 
WHERE J.SERIES_ID = S.SERIES_ID AND
          I.INDUSTRY_CODE = S.INDUSTRY_CODE AND
          S.DATA_TYPE_CODE = DT.DATA_TYPE_CODE AND
          DT.DATA_TYPE_TEXT = 'AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
          GROUP BY S.INDUSTRY_CODE,I.INDUSTRY_NAME
          --ORDER BY SUM(VALUE) DESC
UNION
SELECT S.INDUSTRY_CODE,I.INDUSTRY_NAME,SUM(VALUE)
FROM  LaborStatisticsDB.dbo.annual_2016 A,
      LaborStatisticsDB.dbo.series S,
      LaborStatisticsDB.dbo.industry I,
      LaborStatisticsDB.dbo.datatype DT 
WHERE A.SERIES_ID = S.SERIES_ID AND
          I.INDUSTRY_CODE = S.INDUSTRY_CODE AND
          S.DATA_TYPE_CODE = DT.DATA_TYPE_CODE AND
          DT.DATA_TYPE_TEXT = 'AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
          GROUP BY S.INDUSTRY_CODE,I.INDUSTRY_NAME
          ORDER BY SUM(VALUE) DESC

SELECT s.series_id,
       i.industry_code,
       i.industry_name,
       j.value
FROM LaborStatisticsDB.dbo.series as s 
   JOIN  LaborStatisticsDB.dbo.january_2017 j  
   ON s.series_id = j.series_id
   JOIN LaborStatisticsDB.dbo.industry as i 
   ON s.industry_code = i.industry_code
   JOIN LaborStatisticsDB.dbo.datatype d 
   ON s.data_type_code = d.data_type_code
   WHERE j.[value] > (SELECT AVG(a.value) FROM LaborStatisticsDB.dbo.annual_2016 as a
                       WHERE d.data_type_code = 82 )

select avg(a.value)
        from LaborStatisticsDB.dbo.annual_2016 a,
             LaborStatisticsDB.dbo.series s,
             LaborStatisticsDB.dbo.industry i,
             LaborStatisticsDB.dbo.datatype d
        where a.series_id = s.series_id AND
              s.industry_code = i.industry_code AND
              s.data_type_code = d.data_type_code AND
              d.data_type_code = 82

        --819960.3448275862

select count(*)
        from LaborStatisticsDB.dbo.january_2017 j,
             LaborStatisticsDB.dbo.series s,
             LaborStatisticsDB.dbo.industry i,
             LaborStatisticsDB.dbo.datatype d 
             --laborstatisticsDB.dbo.annual_2016 a
            where j.series_id = s.series_id AND
              s.industry_code = i.industry_code AND
              s.data_type_code = d.data_type_code AND
              d.data_type_code = 82 AND
              j.[value] > 
                (select AVG(a.value) 
                        from LaborStatisticsDB.dbo.annual_2016 a,
                              LaborStatisticsDB.dbo.series s,
                              LaborStatisticsDB.dbo.datatype d 
                            WHERE a.series_id = s.series_id AND
                                  s.data_type_code = d.data_type_code AND
                                  d.data_type_code = 82)

SELECT s.series_id,
       i.industry_code,
       i.industry_name,
       j.value
FROM LaborStatisticsDB.dbo.series as s 
   JOIN  LaborStatisticsDB.dbo.january_2017 j  
   ON s.series_id = j.series_id
   JOIN LaborStatisticsDB.dbo.industry as i 
   ON s.industry_code = i.industry_code
   JOIN LaborStatisticsDB.dbo.datatype d 
   ON s.data_type_code = d.data_type_code
   WHERE j.[value] > (SELECT AVG(a.value) FROM LaborStatisticsDB.dbo.annual_2016 as a WHERE d.data_type_code = 82) AND
         d.data_type_code = 82


