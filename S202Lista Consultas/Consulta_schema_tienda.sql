SELECT nombre FROM producto;
SELECT nombre,precio FROM producto;
SELECT * FROM producto;
SELECT nombre, ROUND(precio, 2) AS precio_euros, ROUND(precio * 1.2, 2) AS precio_usd FROM producto;
SELECT nombre AS "nombre_de_producto", ROUND(precio, 2) AS "euros", ROUND(precio * 1.2, 2) AS "dolares" FROM producto;
SELECT UPPER(nombre) AS "nombre_de_producto_MAY", precio FROM producto;
SELECT LOWER(nombre) AS "nombre_de_producto_MIN", precio FROM producto;
SELECT  nombre, UPPER(LEFT(nombre,2)) AS "Dos_Letras" FROM fabricante;
SELECT nombre, ROUND(precio) AS "Precio_Redondeo" FROM producto;
SELECT nombre, TRUNCATE (precio,0) AS "Precio_NoDecimales" FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre,precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM FABRICANTE LIMIT 5;
SELECT * FROM FABRICANTE LIMIT 2 OFFSET 3;
SELECT nombre,precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.nombre ASC;
SELECT p.codigo AS codigo_prodcuto, p.nombre AS nombre_prodcuto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MIN(precio) FROM producto);
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MAX(precio) FROM producto);
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Crucial' AND precio>200;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN('Asus','Hewlett-Packard','Seagate');
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%e';    
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%';    
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio >= 180 ORDER BY p.precio DESC, f.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.codigo AS cod_fabricante, f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.codigo AS cod_fabricante, f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL;
SELECT nombre AS nombre_producto, precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT p.nombre AS nombre_producto FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo' AND p.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = f.codigo);
SELECT p.nombre AS nombre_producto FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard' AND p.precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = f.codigo);
SELECT p.codigo AS cod_producto, p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')) ;
SELECT p.codigo AS cod_producto, p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE precio >= (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));









