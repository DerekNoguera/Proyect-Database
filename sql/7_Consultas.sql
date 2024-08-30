-- Consulta que mustra el hotel con más reservas 
SELECT h.Nombre AS HotelNombre, COUNT(r.ReservaID) AS NumeroDeReservas 
FROM Hoteles h
JOIN Habitaciones ha ON h.HotelID = ha.HotelID  
JOIN Reservas r ON ha.HabitacionID = r.HabitacionID
GROUP BY h.HotelID, h.Nombre
ORDER BY NumeroDeReservas DESC; 


----------------------------------------------------------------
--Consulta para obtener los hoteles con mayor número de reservas.
SELECT h.Nombre AS HotelNombre, COUNT(r.ReservaID) AS NumeroDeReservas
FROM hoteles h
JOIN Habitaciones ha ON h.HotelID = ha.HotelID
JOIN Reservas r ON ha.HabitacionID = r.HabitacionID
GROUP BY h.HotelID, h.Nombre
ORDER BY NumeroDeReservas DESC;
--Consulta que mustra el hotel con más reservas
--h alias de HOTELES, ha alias de HABITACIONES, r Aalias de RESERVAS


----------------------------------------------------------------
--Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una
--fecha dada.
SELECT COUNT(*) AS Habitaciones_disponibles
FROM habitaciones hb
JOIN hoteles h ON hb.HotelID = h.HotelID
LEFT JOIN reservas r ON hb.HabitacionID = r.HabitacionID
AND r.`Fecha_entrada` = '2024-01-28' WHERE h.HotelID = 1 AND hb.Estado = 'Disponible';
# Hace un left join para pasar datos de una tabla a la otra y compararlos, busca eñ en reservas el ID HOTEL
# sea el mismo que el ID de el HOTEL de la tabla hotel, busca la fecha que quiero buscar y pregunto si esta disponible
# Tambien le pregunto al hotel al que quiero consultarlo


----------------------------------------------------------------
--Consulta para buscar hoteles por nombre.
SELECT * FROM hoteles WHERE nombre LIKE "%Riu%";


----------------------------------------------------------------
-- Consulta para buscar hoteles cuya ubicación comienza con un texto específico.
SELECT * FROM hoteles, hotel_direccion
WHERE `Codigo_Postal`  LIKE "992%";


----------------------------------------------------------------
-- Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM hoteles, hotel_direccion WHERE `Estado` LIKE "%gia";

----------------------------------------------------------------
SELECT * FROM hoteles, hotel_direccion WHERE `Ciudad` LIKE "%anta";


----------------------------------------------------------------
-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT r.ReservaID, u.Email AS ReservasMesAnterior
FROM Reservas r
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
WHERE YEAR(r.Fecha_entrada) = YEAR(CURDATE())
AND MONTH(r.Fecha_entrada) = MONTH(DATE_ADD(CURDATE(), INTERVAL -1 MONTH));


-- Consulta para calcular el promedio de reservas diarias en un hotel.
SELECT AVG(num_reservas) AS Promedio_Reservas
FROM (
        SELECT COUNT(*) AS num_reservas
        FROM reservas
        where `Fecha_entrada` = "2024-08-27"
        GROUP BY Fecha_entrada
) AS conteos_por_fecha;


----------------------------------------------------------------
-- -- Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
-- Consulta para identificar el hotel con la mayor ocupación en el mes anterior
SELECT
    h.HotelID, -- Trae el ID de el Hotel y nombre
    h.Nombre AS HotelNombre,
    COUNT(r.ReservaID) AS TotalReservas -- Tambien trae la cantidad de reservas de cada Hotel
FROM
    Hoteles h -- de hoteles como h
JOIN
    Habitaciones hb ON h.HotelID = hb.HotelID -- Une las tablas de hoteles y habitaciones para validar que sea el mismo ID
JOIN
    Reservas r ON hb.HabitacionID = r.HabitacionID -- busca que el ID de la habitacion de habitaciones sea el mismo de `Capacidad`
    -- reservas de habitaciones
WHERE
    r.Fecha_entrada >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01') -- donde la fecha de entrada sea hace un mes atras
    AND r.Fecha_entrada < DATE_FORMAT(CURDATE(), '%Y-%m-01')
GROUP BY
    h.HotelID, h.Nombre -- las pone el un grupo
ORDER BY  -- las ordena
    TotalReservas DESC
LIMIT 1; -- lo limina a 1


----------------------------------------------------------------
-- Consulta para listar los hoteles que tienen habitaciones disponiblesp pero no han sido
-- reservadas en el último mes.
SELECT * FROM Hoteles h
JOIN Habitaciones hb ON h.HotelID = hb.HotelID
LEFT JOIN Reservas r ON hb.HabitacionID = r.HabitacionID
  AND r.Fecha_entrada <= r.`Fecha_entrada`
  AND r.Fecha_salida >= CURDATE() - INTERVAL 1 MONTH
WHERE hb.Estado = 'Disponible'
  AND r.ReservaID IS NULL;

  
-- ¡Claro! Imagina que quieres saber qué hoteles tienen habitaciones libres para que puedas quedarte allí. Pero no solo eso, también quieres asegurarte de que esas habitaciones no hayan sido ocupadas en el último mes.
-- Aquí está lo que hace cada parte del código:
-- Busca todos los hoteles y sus habitaciones:
-- El código empieza buscando todos los hoteles y luego busca las habitaciones que tiene cada hotel.
-- Verifica las reservas:
-- Luego, mira si esas habitaciones han sido reservadas en el último mes.
-- Filtra las habitaciones disponibles:
-- Solo te muestra las habitaciones que están disponibles (que no están ocupadas en este momento).
-- Excluye las habitaciones reservadas en el último mes:
-- Si una habitación ha sido reservada en el último mes, la excluye de la lista.
-- Así que al final, obtienes una lista de hoteles que tienen habitaciones libres y esas habitaciones no han sido reservadas en el último mes. ¡Es como encontrar un hotel con habitaciones vacías que no han sido ocupadas recientemente!

