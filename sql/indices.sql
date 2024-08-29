
#Indice de tipo B-TREE a la tabla direccion de usuarios, a la columna ciudad, para optimizar las consultas
#Se eligio esta tabala y consulta para llevar un registro de donde son las personas que visitan los hoteles
CREATE INDEX index_DiUsuarios ON Direccion_Usuarios (Ciudad); 

SELECT * FROM direccion_usuarios WHERE ciudad = 'cali';

SELECT * FROM direccion_usuarios ORDER BY Ciudad;

SELECT Ciudad, COUNT(*) AS NumeroDeVisitas 
FROM Direccion_Usuarios
GROUP BY Ciudad
ORDER BY NumeroDeVisitas DESC;

#Indice en la tabla usuarios en la columna email, que selecciona los emails de los usuarios
CREATE INDEX index_usuario_email ON Usuarios(Email)

# Indice de tipo UNIQUE en la tabla Usuarios, columna email que asegura los emails sean unicos
CREATE UNIQUE INDEX index_email_unique ON Usuarios(Email)

# Indice de tipo B-tree en la tabla Habitaciones, columna HotelID, seleccina las habitaciones que tiene cada hotel
CREATE INDEX index_habitaciones ON Habitaciones(HotelID) 

SELECT * FROM habitaciones WHERE HotelID = 1

SELECT * FROM habitaciones WHERE HotelID = 2