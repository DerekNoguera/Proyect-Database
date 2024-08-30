--                         Datos de Prueba

---------------------------------------------------
insert Into Direccion_Usuarios(Calle,Ciudad,Estado)VALUES
    ('Calle 12', 'Atlanta', 'Georgia'),
    ('Calle 9', 'Cali', 'California'),
    ('Calle 10', 'New jersey', 'New York');
    

---------------------------------------------------
insert Into tipo_usuarios (Rol)VALUES
    ("Administrador"),
    ("Cliente");

---------------------------------------------------
INSERT INTO Usuarios (Nombre, Email, Telefono, Direccion, Rol) VALUES
    ('Derek', 'derek@gmail.com', '92910021', 1, 2),
    ('Alexa', 'Alvarez@gmail.com', '90125512', 2, 2),
    ('Vic', 'Vic@gmail.com', '7890965', 3, 1);
    
--------------------------------------------------- 
insert Into Hotel_Direccion(Ciudad, Estado, Codigo_Postal)
    VALUES
    ('Bogota','Colombia','1001'),
    ('Atlanta','Georgia', '992');
    
---------------------------------------------------
insert Into Hoteles(Nombre,Telefono,Estrella, DireccionID)Values
('Hotel Riu','77-12-43-22',4, 1),
('Hotel Inn','55-32-75-33',3,2);



---------------------------------------------------
INSERT INTO Tipo_Habitacion (NombreTipo)
VALUES
    ('Suite'),
    ('Individual'),
    ('Doble'),
    ('Familiar');

---------------------------------------------------
INSERT INTO Habitaciones (HotelID, Numero_habitacion, Tipo_habitacion, Precio_Noche, Descripcion, Capacidad)
VALUES
    (1, 101, 1, 150.00, 'Habitación de lujo con vista al mar', 2), -- Asocia con HotelID = 1
    (1, 102, 3, 100.00, 'Habitación estándar con cama doble', 2),  -- Asocia con HotelID = 1
    (2, 103, 2, 80.00, 'Habitación individual con baño privado', 1),-- Asocia con HotelID = 2
    (2, 103, 1, 80.00, 'Habitación doble con baño privado', 1); -- Asocia con HotelID = 2

    
---------------------------------------------------
INSERT INTO Reservas (UsuarioID, HabitacionID, Fecha_salida, Fecha_entrada, Total_precio)
VALUES
    (1, 3, '2024-09-30', '2024-08-27', 750.00), -- Lo reservo Juan para la habitación 101 (HabitacionID = 1)
    (1, 2, '2024-09-30', '2024-07-15', 675.00); -- Lo reservo Ana para la habitación 103 (HabitacionID = 3)


---------------------------------------------------
INSERT INTO reservas (UsuarioID, HabitacionID, Fecha_salida, Fecha_entrada, Total_precio)
VALUES (2, 3, '2024-09-29', '2024-07-27', 280.00);
#consulta de mes anterior

---------------------------------------------------
INSERT INTO reservas (UsuarioID, HabitacionID, Fecha_salida, Fecha_entrada, Total_precio)
VALUES (5, 3, '2024-09-29', '2024-08-30', 280.00),
VALUES (5, 3, '2024-09-28', '2024-08-30', 260.00);
#Las view