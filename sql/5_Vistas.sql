
#Vista nos muestra la lista de las reservas del dia
CREATE VIEW Reservas_dia_Actual  
AS SELECT ReservaID, Fecha_entrada
FROM Reservas 
WHERE DATE(Fecha_entrada) = CURDATE();

#Vista nos muestra la cantidad de reservas del dia
CREATE VIEW Cantidad_Reservas_Dia_Actual 
AS SELECT COUNT(*) AS CantidadReservasDia FROM reservas 
WHERE DATE(Fecha_entrada) = CURDATE();

# Vista muestra las reservas ordenadas de la mas reciente a la mas antigua
CREATE VIEW Reservas_Ordenadas AS 
SELECT ReservaID, Fecha_Entrada
FROM reservas
ORDER BY Fecha_entrada DESC

# Vista muestra los hoteles con más reservas o más visitados
CREATE VIEW Hotel_Mas_Reservas_Nombre AS 
SELECT h.Nombre AS HotelNombre
FROM Hoteles h
JOIN Habitaciones ha ON h.HotelID = ha.HotelID
JOIN Reservas r ON ha.HabitacionID = r.HabitacionID
GROUP BY h.HotelID, h.Nombre
ORDER BY COUNT(r.ReservaID) DESC

#Vista que nos muetra las habitaciones las habitaciones disponibles
CREATE VIEW Habitaciones_disponibles_Por_Hotel AS
SELECT 
h.Nombre AS NombreHotel,
ha.Numero_habitacion,
ha.Capacidad, ha.Precio_Noche, ha.Estado 
FROM habitaciones ha
JOIN Hoteles h ON h.HotelID = ha.HotelID
WHERE ha.estado = 'Disponible'
ORDER BY h.Nombre, ha.Numero_habitacion