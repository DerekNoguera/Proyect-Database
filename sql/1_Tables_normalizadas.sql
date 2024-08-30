create database BaseDatos;
drop Database BaseDatos;
use BaseDatos;

----------------------------------------------------------------
# Una tabla con la direccion de usuarios para enviarsela a Usuarios es necesaria si quieres 
# Hacerla 3FN
Create Table Direccion_Usuarios(
    DireccionID INT PRIMARY KEY AUTO_INCREMENT,
    Calle Varchar(100),
    Ciudad Varchar(50),
    Estado Varchar(50)
);

----------------------------------------------------------------
CREATE TABLE Tipo_Usuarios(
    TipoUsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Rol VARCHAR(50)
);

----------------------------------------------------------------
#Recibe una llave foranea de la tabla Direccion_Usuarios y se crea la tabla usuarios
create table Usuarios(
    UsuarioID int primary key AUTO_INCREMENT,
    Nombre varchar(50),
    Email Varchar(100) UNIQUE,
    Telefono Varchar(15),
    Direccion INT,
    Rol INT,
    FOREIGN Key (Rol) REFERENCES Tipo_Usuarios(TipoUsuarioID),
    Foreign Key (Direccion) REFERENCES Direccion_Usuarios(DireccionID)
);

----------------------------------------------------------------
#Crea la tabla Hotel_Direccion para  que son las direcciones de los hoteles y se le dan
# como llaves foraneas a Hoteles
Create table Hotel_Direccion(
    direccion_id INT PRIMARY KEY AUTO_INCREMENT,
    Ciudad Varchar(50),
    Estado Varchar(50),
    Codigo_Postal varchar(10)
);

----------------------------------------------------------------
#Crea Hoteles y recibe datos como llave foranea de Hotel_direccion y es una nueva tabla que almacena datos de los hoteles
create Table Hoteles(
    HotelID int primary key AUTO_INCREMENT,
    Nombre Varchar(50),
    DireccionID INT,
    Telefono Varchar(15),
    Estrella INT,
    Foreign Key (DireccionID) REFERENCES Hotel_Direccion(direccion_id)
);

----------------------------------------------------------------
#crea tipos de habitaciones Suit, Individual, doble y familiar
Create Table Tipo_Habitacion(
    TipoID int PRIMARY KEY AUTO_INCREMENT,
    NombreTipo VARCHAR(50) NOT NULL
);

----------------------------------------------------------------
#Habitaciones es una tabla que tiene los datos de la habitacion y recibe como llave foranea el esto de si es Disponible,
#Ocupado o reservado, tambien recibe el ID de el hotel de la tabla Hoteles para saber que hotel es, y recibe Tipo de habitaciones
#Coomo llave foranea de la tabla tipo de habitacions para saber si es SUit, Matrimonial ETC, y tambien se crean otros datos
create Table Habitaciones(
    HabitacionID int PRIMARY KEY AUTO_INCREMENT,
    HotelID int,
    Numero_habitacion INT,
    Tipo_habitacion INT,
    Precio_Noche Decimal(10,2),
    Descripcion TEXT,
    Capacidad INT,
    Estado Varchar(50) DEFAULT "Disponible",
    Foreign Key (HotelID) REFERENCES Hoteles(HotelID),
    Foreign Key (Tipo_habitacion) REFERENCES Tipo_Habitacion(TipoID)
);

----------------------------------------------------------------
#Crea una tabla para las reservas pero la insercion de datos de esta tabla se hacen con los Store Procedure de el archivo 
#Store_procedure que inserta datos y tambien puede eliminarlos por ID
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