/* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем. */

USE vk;

-- Первая выборка определяет пользователя от которого пришло наибольшее количество сообщений нашему заданному пользователю
SELECT 
	COUNT(*) AS count_1,
	from_user_id
FROM messages
WHERE from_user_id IN (SELECT initiator_user_id FROM friend_requests WHERE target_user_id = 7 AND status = 'approved'
		UNION 
		SELECT target_user_id FROM friend_requests fr WHERE initiator_user_id = 7 AND status = 'approved') AND to_user_id = 7
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Вторая выборка определяет пользователя которому которому пришло наибольшее количество сообщений от заданного пользователя
SELECT 
	COUNT(*) AS count_2,
	to_user_id 
FROM messages
WHERE to_user_id IN (SELECT initiator_user_id FROM friend_requests WHERE target_user_id = 7 AND status = 'approved'
		UNION 
		SELECT target_user_id FROM friend_requests fr WHERE initiator_user_id = 7 AND status = 'approved') AND from_user_id = 7
GROUP BY to_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

/* Сравнивая значения count_1 и count_2 можно определить, с каким человеком у нашего заданного пользователя была активная переписка. */
