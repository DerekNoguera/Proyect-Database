#crea un store producere que cree una reserva ;
drop Procedure `Crear_reserva`;
drop PROCEDURE `Eliminar_reserva`;


#Hace un store producere de Crear_reserva para crear una nueva recerva y agregarla a la tabla reservas 
#donde envia el ID de el usuarios, ID de habitacion para saber si es la habitacion 101,102,103, fecha de salida
# fecha de entrada y precio.
DELIMITER // 
CREATE PROCEDURE Crear_reserva(
    IN p_UsuarioID INT,
    IN p_HabitacionID INT,
    IN p_Fecha_salida DATE,
    IN p_Fecha_entrada DATE,
    IN p_Total_precio Decimal(10,2)
)
BEGIN
    INSERT INTO Reservas (UsuarioID, HabitacionID, Fecha_salida, Fecha_entrada, Total_precio)
    VALUES (p_UsuarioID, p_HabitacionID, p_Fecha_salida, p_Fecha_entrada, p_Total_precio);
END 
DELIMITER ;


#ELimina los datos por el ID de la Reserva 
DELIMITER//

Create PROCEDURE Eliminar_reserva(
    in p_ReservaID INT)
begin
    DELETE FROM Reservas WHERE ReservaID = p_ReservaID;
END;
DELIMITER;



#Envia los datos como paramtros para haceer el insert
CALL Crear_reserva(2, 3, '2024-07-15', '2024-09-10', 1000.00);

#Se le envia el ID como parametro y los elimina de la tabla de resrevas
call Eliminar_reserva(4)

