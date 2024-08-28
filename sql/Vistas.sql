
CREATE VIEW Reservas_dia_Actual  -- Esta vista nos muestra la lista de las reservas del dia
AS SELECT ReservaID, Fecha_entrada
FROM Reservas 
WHERE DATE(Fecha_entrada) = CURDATE();


CREATE VIEW Cantidad_Reservas_Dia_Actual -- Esta vista nos muestra la cantidad de reservas del dia
AS SELECT COUNT(*) AS CantidadReservasDia FROM reservas 
WHERE DATE(Fecha_entrada) = CURDATE();