/* Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине. */

USE shop;

SELECT *
FROM users
WHERE id IN (SELECT user_id FROM orders)
ORDER BY id;