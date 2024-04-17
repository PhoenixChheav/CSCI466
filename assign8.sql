-- Name: Phoenix Chheav  Section: 0002

-- 1.  List all of the authors' first and last names in alphabetical order by first name.
SELECT AuthorFirst, AuthorLast
  FROM Author
  ORDER BY AuthorFirst ASC;

-- 2.  List all of the cities that have a publisher located in them. List each of the appropriate cities only once.
SELECT DISTINCT City
  FROM Publisher;

-- 3.  Show how many book titles exist in the database.
SELECT COUNT(title) AS CountTitle
  FROM Book;

-- 4.  List name of all of the branches along with total number of books on hand at each of those branches.
SELECT BranchName, SUM(OnHand) AS BooksOnHand
FROM Inventory
JOIN Branch ON Inventory.BranchNum = Branch.BranchNum
GROUP BY BranchName;

-- 5.  Show the number of employees that work at Henry Books.
SELECT SUM(NumEmployees) AS EmployeeCount
  FROM Branch;

-- 6.  List titles of all the books written by Stephen King.
SELECT Title
  FROM Book
  JOIN Wrote ON Book.BookCode = Wrote.BookCode
  JOIN Author ON Wrote.AuthorNum = Author.AuthorNum
  WHERE AuthorFirst = 'Stephen' AND AuthorLast = 'King';

-- 7.  List the title, type and price for all of the paperback books.
SELECT Title, Type, Price
  FROM Book
  WHERE Paperback = 'Y';

-- DESCRIBE Inventory;
-- 8.  Show the names of all of the branches that have at least one book with ten or more copies on hand.
SELECT BranchName
FROM Branch
JOIN Inventory ON Branch.BranchNum = Inventory.BranchNum
WHERE Inventory.OnHand >= 10;

-- 9.  List the title and the full name of the author for each book in reverse alphabetical order by title.
SELECT Title, CONCAT(AuthorFirst, ' ', AuthorLast) AS AuthorName
FROM Book
JOIN Wrote ON Book.BookCode = Wrote.BookCode
JOIN Author ON Wrote.AuthorNum = Author.AuthorNum
ORDER BY Title DESC;

-- 10. List all of publishers by name, along with how many books each of those publishers has published.
SELECT PublisherName, COUNT(*) AS TotalBookPublished
FROM Book
JOIN Publisher ON Book.PublisherCode = Publisher.PublisherCode
GROUP BY PublisherName;

-- 11. Show the number of the books that cost less than $10.00.
SELECT COUNT(*) AS BookUnder10
  FROM Book
  WHERE Price < 10.00;

-- 12. List the last name for all of the authors published by Simon and Schuster.
SELECT AuthorLast
  FROM Author
  JOIN Wrote ON Author.AuthorNum = Wrote.AuthorNum
  JOIN Book ON Wrote.BookCode = Book.BookCode
  JOIN Publisher ON Book.PublisherCode = Publisher.PublisherCode
  WHERE PublisherName = 'Simon and Schuster';

-- 13. Show a list with all the types of books and how many books there are for each of them.
SELECT Type, COUNT(*) Total
  FROM Book
  GROUP BY Type;

-- 14. Show the number of books on hand at the Brentwood Mall location.
-- if no ON it's 47
SELECT SUM(OnHand) AS TotalBooksOnHand
  FROM Inventory, Branch
  WHERE BranchLocation = 'Brentwood Mall'
  AND Inventory.BranchNum = Branch.BranchNum;

-- 15. List of all the branch locations along with the number of employees and the number of books on hand at each of those branches.
SELECT BranchName, NumEmployees, SUM(OnHand) AS TotalBooksOnHand
FROM Branch
JOIN Inventory ON Inventory.BranchNum = Branch.BranchNum
GROUP BY BranchName, NumEmployees;

-- 16. List the titles of all the books which have a sequence number of one. Use a subquery to do it.
SELECT Title, BookCode
FROM Book
WHERE BookCode IN (SELECT BookCode FROM Wrote WHERE Sequence = 1);

-- 17. List all of the publishes whose name begin with "T".
SELECT PublisherName
  FROM Publisher
  WHERE PublisherName LIKE 'T%';

-- 18. List all of the information pertaining to authors that have a double-L in their name ("ll").
SELECT *
  FROM Author
  WHERE CONCAT(AuthorFirst, ' ', AuthorLast) LIKE '%ll%';

-- 19. List all of the book titles that have a book code of 079x, 138x, or 669x.
SELECT Title
  FROM Book
  WHERE BookCode LIKE '%079x%' OR BookCode LIKE '%138x%' OR BookCode LIKE '%669x%';

-- 20. Show the titles of all the books, along with their author's last name and the name of a publisher, sorted in alphabetical order by the publisher's name.
SELECT Title, AuthorLast, PublisherName
  FROM Book
  JOIN Wrote ON Book.BookCode = Wrote.BookCode
  JOIN Author ON Wrote.AuthorNum = Author.AuthorNum
  JOIN Publisher ON Book.PublisherCode = Publisher.PublisherCode
  ORDER BY PublisherName ASC;


-- 21. Do any two of the above items again, accomplishing the task in a different way. (Different SQL for same result). Make sure to identify which items you are doing again.
-- 19b. List all of the book titles that have a book code of 079x, 138x, or 669x.
SELECT Title
  FROM Book
  WHERE BookCode LIKE '079x%' OR BookCode LIKE '138x%' OR BookCode LIKE '669x%';
-- 20b. Show the titles of all the books, along with their author's last name and the name of a publisher, sorted in alphabetical order by the publisher's name.
SELECT Title, AuthorLast, PublisherName
  FROM Book, Author, Publisher, Wrote
  WHERE Book.BookCode = Wrote.BookCode 
  AND Wrote.AuthorNum = Author.AuthorNum
  AND Book.PublisherCode = Publisher.PublisherCode
  ORDER BY PublisherName;

-- 22. By examining the tables, (you, not the script) determine another type of information that would be the interest to a person that worked at Henry Books. Indicate what you chose and provide the query.
SELECT Title, Price, Paperback
  FROM Book
  WHERE Type = 'SFI';