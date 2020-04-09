/* Определить кто больше поставил лайков (всего): мужчины или женщины. */

USE vk;

SELECT 
IF((SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT id FROM profiles WHERE gender="m")) 
	> 
	(SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT id FROM profiles WHERE gender="f")), 'male', 'female');
