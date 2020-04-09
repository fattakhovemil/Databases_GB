/* Подсчитать общее количество лайков, которые получили пользователи младше 10 лет. */

USE vk;

SELECT
	COUNT(*)
FROM likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE birthday > CURRENT_DATE() - INTERVAL 10 YEAR 
    ); 	
