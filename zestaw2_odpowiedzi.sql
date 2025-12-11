-- 26. Wyświetl wszystkie stanowiska pracy, w których nazwa zaczyna się od HR.
SELECT title FROM jobs WHERE title LIKE "HR%";
-- 27. Wyświetl wszystkie stanowiska pracy, gdzie w nazwie znajduje się wyraz Software na początku, w środku lub na końcu nazwy stanowiska pracy.
SELECT title FROM jobs WHERE title like "%Software%";
-- 28. Wyświetl ile wynosi średnia płaca minimalna dla stanowisk pracy, których  nazwa zaczyna się od Sales. Zmień nazwę kolumny na average_min_salary_sales.
SELECT title, AVG(min_salary) as "average_min_salary_sales" FROM jobs WHERE title LIKE "Sales%" GROUP BY title;
-- 29. Wyświetl wszystkie stanowiska pracy, gdzie w nazwie druga litera to u.
SELECT title FROM jobs WHERE title like "_u%";
-- 30. Wyświetl wszystkich pracowników z imieniem zaczynającym się na A i posiadającym przynajmniej pięć znaków.
SELECT * FROM employees WHERE first_name like "A____";
-- 31. Wyświetl wszystkich pracowników z imieniem zaczynającym się na E i kończącym się na a.
SELECT * FROM employees WHERE first_name like "E%a";
-- 32. Wyświetl wszystkich pracowników z adresem email innym niż gmail.com.Rekordy sortuj alfabetycznie po kolumnie
SELECT * FROM employees WHERe email not like "%gmail.com" ORDER BY email ASC;
-- 33. Wyświetl wszystkich pracowników z imieniem Adam, Alice oraz Tom.
SELECT * FROM employees WHERE first_name in ("Adam", "Alice", "Tom");
-- 34. Wyświetl wszystkich pracowników, którzy nie są zatrudnieni w dziale o numerze id 2, 3, oraz 5.
SELECT * FROM employees WHERE department_id not in (2,3,5);
-- 35. Wyświetl wszystkie stanowiska pracy, gdzie płaca minimalna jest poza przedziałem od 3000 do 8000.
SELECT title, min_salary FROM jobs WHERE min_salary < 3000 or min_salary > 8000;
-- 36. Wyświetl wszystkich pracowników, którzy zostali zatrudnieni w 2015 oraz 2016 roku, a także nie pracują w dziale o numerze id 2 oraz 3.
SELECT * FROM employees WHERE hire_date >= '2015-01-01'  AND hire_date < '2017-01-01' AND department_id not in (2,3);  
-- 37. Wyświetl wszystkich pracowników, którzy urodzili się w 1990 roku oraz sortuj rekordy od najstarszego pracownika.
SELECT * FROM employees WHERE birth_date >= '1990-01-01' AND birth_date <'1991-01-01' ORDER BY birth_date ASC;
-- 38. Wyświetl imię, nazwisko oraz datę urodzenia pracowników zatrudnionych na stanowisku pracy o numerze id 3. Informacje wyświetl w jednej kolumnie w
-- formacie <imię> <nazwisko> - <data_urodzenia> i nadaj jej nazwę employee.
SELECT CONCAT(first_name,' ', last_name,' - ', DATE( birth_date)) as 'employee' FROM employees WHERE department_id = 3; 
-- 39. Wyświetl imię oraz nazwisko wszystkich pracowników a także nazwę działu, w którym pracują.
SELECT e.first_name, e.last_name, d.department_name FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id;
-- 40. Wyświetl nazwę wszystkich miast oraz nazwę działów firmy, które znajdują się w danym mieście. Gdy miasto nie posiada żadnego działu umieść wartość NULL.
-- Rekordy sortuj alfabetycznie po kolumnie miasto.
SELECT l.city, d.department_name FROM locations as l
LEFT JOIN departments as d
ON d.location_id = l.id
ORDER BY l.city ASC;
