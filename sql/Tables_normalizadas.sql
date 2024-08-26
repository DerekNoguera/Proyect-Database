create database BaseDatos;
drop Database BaseDatos;
use BaseDatos;



Create Table Direccion_Usuarios(
    DireccionID INT PRIMARY KEY AUTO_INCREMENT,
    Calle Varchar(100),
    Ciudad Varchar(50),
    Estado Varchar(50)
);
create table Usuarios(
    UsuarioID int primary key AUTO_INCREMENT,
    Nombre varchar(50),
    Email Varchar(100) UNIQUE,
    Telefono Varchar(15),
    Direccion INT,
    Foreign Key (Direccion) REFERENCES Direccion_Usuarios(DireccionID)
);



Create table Hotel_Direccion(
    direccion_id INT PRIMARY KEY AUTO_INCREMENT,
    Ciudad Varchar(50),
    Estado Varchar(50),
    Codigo_Postal varchar(10)
);
create Table Hoteles(
    HotelID int primary key AUTO_INCREMENT,
    Nombre Varchar(50),
    DireccionID INT,
    Telefono Varchar(15),
    Estrella INT,
    Foreign Key (DireccionID) REFERENCES Hotel_Direccion(direccion_id)
);



Create Table Tipo_Habitacion(
    TipoID int PRIMARY KEY AUTO_INCREMENT,
    NombreTipo VARCHAR(50) NOT NULL
);
create Table Habitaciones(
    HabitacionID int PRIMARY KEY AUTO_INCREMENT,
    HotelID int,
    Numero_habitacion INT,
    Tipo_habitacion INT,
    Precio_Noche Decimal(10,2),
    Descripcion TEXT,
    Capacidad INT,
    Foreign Key (HotelID) REFERENCES Hoteles(HotelID),
    Foreign Key (Tipo_habitacion) REFERENCES Tipo_Habitacion(TipoID)
);



create Table Reservas(
    ReservaID int primary Key auto_increment,
    UsuarioID int,
    HabitacionID int,
    Fecha_salida DATE,
    Fecha_entrada Date,
    Total_precio Decimal(10,2),
    Foreign Key (UsuarioID) REFERENCES Usuarios(UsuarioID),
    Foreign Key (HabitacionID) REFERENCES Habitaciones(HabitacionID)
);



-- Consultas SQL (Queries):
-- ○ Consulta para obtener los hoteles con mayor número de reservas.
-- ○ Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una
-- fecha dada.
-- ○ Consulta para buscar hoteles por nombre.
-- ○ Consulta para buscar hoteles cuya ubicación comienza con un texto específico.
-- ○ Consulta para buscar hoteles cuya ubicación termina con un texto específico.
-- ○ Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
-- ○ Consulta para calcular el promedio de reservas diarias en un hotel.
-- ○ Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
-- ○ Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido
-- reservadas en el último mes.