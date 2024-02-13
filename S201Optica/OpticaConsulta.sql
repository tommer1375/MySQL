SELECT * FROM Venta WHERE idClientes=2 AND Fecha_Venta>='2023-01-01' AND Fecha_Venta<='2023-05-01';
SELECT idGafas FROM Venta WHERE idEmpleados=3;
SELECT p.Nombre FROM Proveedor p INNER JOIN Gafas g ON p.Proveedor_id = g.idProovedor INNER JOIN Venta v ON g.Gafas_id = v.idGafas;