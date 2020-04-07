/* (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')*/

USE shop;

SELECT * FROM users
	WHERE
	DATE_FORMAT(birthday_at, '%M') in ('may', 'august');
	