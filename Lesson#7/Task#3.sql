/*Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов.*/

DROP DATABASE IF EXISTS fly;
CREATE DATABASE fly;
USE fly;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
	`label` VARCHAR(50),
	`name` VARCHAR(50)
);

DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(50),
	`to` VARCHAR(50)
);

INSERT INTO cities(`label`,`name` )
VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');

INSERT INTO flights(`from`, `to`)
VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
	
SELECT 
	id,
	(SELECT name FROM cities WHERE cities.`label` = flights.`from`) AS `from`,
	(SELECT name FROM cities WHERE cities.`label` = flights.`to`) AS `to`
FROM flights;