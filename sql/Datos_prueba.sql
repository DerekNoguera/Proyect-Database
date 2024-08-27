--                         Datos de Prueba
# Estos son lo datos que se le insertan a Direcciones de Usuario
insert Into Direccion_Usuarios(Calle,Ciudad,Estado)VALUES
    ('Calle 12', 'Atlanta', 'Georgia'),
    ('Calle 9', 'Cali', 'California');


#Estos son los datos de los Usuarios que reciben los ID de direcciones de arriba
# QUiere decir que si el ID de derek es 1 entonces derek es de Atlanta Georgia
INSERT INTO Usuarios (Nombre, Email, Telefono, Direccion) VALUES
    ('Derek', 'derek@gmail.com', '92910021', 1),
    ('Alexa', 'Alvarez@gmail.com', '90125512', 2);


#Direcciones de Hotel que tambien son datos de prueba
insert Into Hotel_Direccion(Ciudad, Estado, Codigo_Postal)
    VALUES
    ('Bogota','Colombia','1001'),
    ('Atlanta','Georgia', '992');


# Los datos de Hoteles tambien se le especifica la Key Foranea de Direccion
# Si el hotel Scam es DIreccionID 2 entonces quiere decir que la direccion 
#de el hotel scam es Atlanta Georgia 992
insert Into Hoteles(Nombre,Telefono,Estrella, DireccionID)Values
('Scam','28391901',4, 2),
('Hotel Inn','55555555',3,2);


#Tipos de habitacion
INSERT INTO Tipo_Habitacion (NombreTipo)
VALUES 
    ('Suite'),
    ('Individual'),
    ('Doble'),
    ('Familiar');


# Habitaciones que estan asociadas con los hoteles y tipos de habitaciones, se dice que tipo de habitacion si es 1,2
# 3,4,5 si por ejemplo el valor 1 es Tipo de habitacion 1 entonces es una SUIT
INSERT INTO Habitaciones (HotelID, Numero_habitacion, Tipo_habitacion, Precio_Noche, Descripcion, Capacidad)
VALUES 
    (1, 101, 1, 150.00, 'Habitación de lujo con vista al mar', 2), -- Asocia con HotelID = 1
    (1, 102, 2, 100.00, 'Habitación estándar con cama doble', 2),  -- Asocia con HotelID = 1
    (2, 103, 3, 80.00, 'Habitación individual con baño privado', 1); -- Asocia con HotelID = 2


-- #Estado de las habitaciones
-- insert Into estado (Descripcion) VALUES
--     ('Disponible'),
--     ('Reservado'),
--     ('Ocupada');



-- INSERT INTO Reservas (UsuarioID, HabitacionID, Fecha_salida, Fecha_entrada, Total_precio)
-- VALUES 
--     (1, 1, '2024-09-15', '2024-09-10', 750.00), -- Lo reservo Juan para la habitación 101 (HabitacionID = 1)
--     (2, 3, '2024-09-20', '2024-09-18', 200.00), -- Lo reservo Ana para la habitación 103 (HabitacionID = 3)
--     (1, 2, '2024-09-25', '2024-09-22', 240.00); -- Lo reservo Juan para la habitación 102 (HabitacionID = 2)

