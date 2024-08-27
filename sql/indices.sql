
CREATE INDEX index_DiUsuarios ON Direccion_Usuarios (Ciudad); --Indice de tipo B-TREE a la tabla direccion de usuarios, a la columna ciudad, para optimizar las consultas
--Se eligio esta tabala y consulta para llevar un registro de donde son las personas que visitan los hoteles

SELECT * FROM direccion_usuarios WHERE ciudad = 'cali';

SELECT * FROM direccion_usuarios ORDER BY Ciudad;

SELECT Ciudad, COUNT(*) AS NumeroDeVisitas 
FROM Direccion_Usuarios
GROUP BY Ciudad
ORDER BY NumeroDeVisitas DESC;