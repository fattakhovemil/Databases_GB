/* Выведите список товаров products и разделов catalogs, который соответствует товару. */

USE shop;

SELECT *
FROM products JOIN catalogs ON products.catalog_id = catalogs.id;
