

SELECT SUM(P.Cantidad_Productos) AS Total_Productos_Vendidos
FROM Pedido P
JOIN Productos Pr ON P.idProductos = Pr.Productos_id
JOIN Categorías_Productos CP ON Pr.Categorías_Productos_Categorías_id = CP.Categorías_id
JOIN Clientes C ON P.idCliente = C.Clientes_id
JOIN Localidad L ON C.Localidad_id = L.idLocalidad
WHERE CP.nombre = 'Bebidas'
AND L.idLocalidad = 2;
  
SELECT COUNT(*) AS Total_Pedidos_Efectuados FROM Pedido P JOIN Trabajador T ON P.idTienda = T.idTienda WHERE T.Trabajador_id = 2;