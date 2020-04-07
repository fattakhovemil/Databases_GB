/* 	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 	Следует учесть, что необходимы дни недели текущего года, а не года рождения. */

USE shop;

SELECT COUNT(*) FROM (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) AS count_day FROM users) AS stats 
WHERE count_day=1; -- count_day=1 это воскресенье, count_day=2 это понедельник и т.д.

