#crea un store producere que cree una reserva ;
DELIMITER //
CREATE PROCEDURE Crear_reserva(
    IN p_UsuarioID INT,
    IN p_HabitacionID INT,
    IN p_Fecha_salida DATE,
    IN p_Fecha_entrada DATE,
    IN p_Total_precio Decimal(10,2)
)
Begin
    INSERT INTO Reservas(UsuarioID,HabitacionID,Fecha_salida,Fecha_entrada,Total_precio)
    VALUES(p_UsuarioID, p_HabitacionID, p_Fecha_salida, p_Fecha_entrada, p_Total_precio);
END
DELIMITER ;
call Crear_reserva(1, 1, '2024-09-15', '2024-09-10', 850.00);

DROP Procedure Crear_reserva;


DELIMITER//

Create PROCEDURE Eliminar_reserva(
    in p_ReservaID INT
)
begin
    DELETE FROM Reservas WHERE ReservaID = p_ReservaID;
END
DELIMITER;

call Eliminar_reserva(2)