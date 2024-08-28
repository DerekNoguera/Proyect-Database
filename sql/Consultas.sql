
SELECT h.Nombre AS HotelNombre, COUNT(r.ReservaID) AS NumeroDeReservas -- Consulta que mustra el hotel con más reservas 
FROM Hoteles h
JOIN Habitaciones ha ON h.HotelID = ha.HotelID  --h alias de HOTELES, ha alias de HABITACIONES, r Aalias de RESERVAS
JOIN Reservas r ON ha.HabitacionID = r.HabitacionID
GROUP BY h.HotelID, h.Nombre
ORDER BY NumeroDeReservas DESC; 

SELECT * FROM hoteles WHERE nombre LIKE "%Scam%";

SELECT * FROM hoteles WHERE nombre LIKE "H%";

SELECT * FROM hoteles WHERE nombre LIKE "%m";

SELECT r.ReservaID, u.Email AS ReservasMesAnterior
FROM Reservas r
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID 
WHERE YEAR(r.Fecha_entrada) = YEAR(CURDATE())
AND MONTH(r.Fecha_entrada) = MONTH(DATE_ADD(CURDATE(), INTERVAL -1 MONTH));

