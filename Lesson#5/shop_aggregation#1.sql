/* Подсчитайте средний возраст пользователей в таблице users. */

USE shop;

SELECT
  ROUND(AVG(
    (YEAR(CURRENT_DATE) - YEAR(birthday_at)) -                             
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday_at, '%m%d'))))
FROM users