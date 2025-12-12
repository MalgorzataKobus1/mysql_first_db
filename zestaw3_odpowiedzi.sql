-- zadania zestaw 3 
-- 1Wyświetl imię oraz nazwisko wszystkich pracowników, nazwę działu, w którym pracują a także nazwę miasta, w którym siedzibę ma dany dział.
USE cwiczenia_DB;
SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
INNER JOIN locations as l
ON d.location_id = l.id;
-- 2. Wyświetl nazwę wszystkich działów oraz nazwę miast, w których znajdują się dane działy. Rekordy sortuj alfabetycznie po kolumnie miasto.
SELECT d.department_name, l.city
FROM departments as d
INNER JOIN locations as l
ON d.location_id = l.id
ORDER BY l.city ASC;
-- 3. Wyświetl imię oraz datę urodzenia pracowników urodzony po 1 stycznia 1994 r. a także nazwę działu, w którym pracują.
SELECT e.first_name, e.birth_date, d.department_name
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
WHERE birth_date > '1994-01-01';
-- 4. Wyświetl imię pracowników zatrudnionych w dziale o numerze id 1 i 6, a także nazwę działu, w którym pracują oraz nazwę miasta, w którym znajduje
-- się dany dział. Rekordy sortuj alfabetycznie po kolumnie imię.
SELECT e.first_name, d.department_name, l.city
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
INNER JOIN locations as l
ON d.location_id = l.id
WHERE department_id in (1,6)
ORDER BY first_name ASC;
-- 5. Wyświetl ilu jest pracowników w każdym dziale. Liczbę pracowników zapisz w kolumnie number_of_employees.
SELECT d.department_name, COUNT(first_name) as 'number_of_employees'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
GROUP BY d.department_name
ORDER BY d.department_name ASC;
-- 6. Wyświetl ilu jest pracowników na każdym stanowisku pracy. Liczbę pracowników zapisz w kolumnie number_of_employees oraz posortuj rekordy malejąco.
SELECT j.title, COUNT(e.id) as 'number_of_employees'
FROM employees as e
INNER JOIN jobs as j
ON e.job_id = j.id
GROUP BY j.title
ORDER BY j.title ASC;
-- 7. Wyświetl ile jest działów w każdym mieście. Liczbę działów zapisz w kolumnie number_of_departments.
SELECT l.city, COUNT(d.department_name) as 'number_of_departments'
FROM  departments as d
RIGHT JOIN locations as l
ON d.location_id = l.id
GROUP BY l.city
ORDER BY number_of_departments ASC;
-- 8,9. Wyświetl ilu jest pracowników na każdym stanowisku pracy w poszczególnych działach. Liczbę pracowników zapisz w kolumnie number_of_employees.
-- Dodatkowo dodaj kolumnę miasto, (w którym znajduje się dział), nazwa działu oraz nazwa stanowiska pracy. Rekordy posortuj rosnąco po liczbie pracowników.
SELECT d.department_name, j.title as job_title,l.city, COUNT(e.id) as 'number_of_employees'
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
INNER JOIN jobs as j
ON e.job_id = j.id
INNER JOIN locations as l
ON d.location_id = l.id
GROUP BY d.department_name, j.title, l.city
ORDER BY number_of_employees DESC;
-- 10. Wyświetl wszystkie nazwiska, które nosi przynajmniej dwóch pracowników. Dodatkowo zapisz liczbę pracowników w kolumnie number_of_employees oraz posortuj rekordy malejąco po liczbie pracowników.
SELECT e.last_name, count(last_name) as 'number_of_employees' 
FROM employees as e
GROUP BY e.last_name
HAVING COUNT(last_name)>1
ORDER BY number_of_employees DESC;
-- 11. Wyświetl wszystkie imiona zaczynające się od litery A, które nosi przynajmniej dwóch pracowników. Dodatkowo zapisz liczbę pracowników w kolumnie number_of_employees.
SELECT e.first_name, count(e.first_name) as 'number_of_employees' 
FROM employees as e
WHERE first_name LIKE 'A%'
GROUP BY e.first_name
HAVING COUNT(first_name)>1;
-- 12. Wyświetl nazwy wszystkich stanowisk pracy, na których zatrudniono więcej niż pięciu pracowników. Dodatkowo zapisz liczbę pracowników w kolumnie
-- number_of_employees oraz posortuj rekordy rosnąco po liczbie pracowników zatrudnionych na poszczególnych stanowiskach.
SELECT j.title as 'job_title', COUNT(e.id) as 'number_of_employees' 
FROM employees as e
INNER JOIN jobs as j
ON e.job_id = j.id
GROUP BY j.title
HAVING COUNT(e.id) > 5
ORDER BY number_of_employees ASC;
-- 13. Wyświetl nazwy działów znajdujących się w mieście Cracow, w których pracuje przynajmniej pięciu pracowników. Dodatkowo zapisz liczbę pracowników w kolumnie number_of_employees.
SELECT d.department_name, l.city, COUNT(e.id) as 'number_of_employees' 
FROM employees as e
INNER JOIN departments as d
ON e.department_id = d.id
INNER JOIN locations as l
ON d.location_id = l.id
WHERE l.city = 'Cracow'
GROUP BY d.department_name, l.city
HAVING COUNT(e.id) >= 5
ORDER BY number_of_employees ASC;

