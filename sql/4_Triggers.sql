---------------------------------------------------  DELIMITER //
DELIMITER//

CREATE TRIGGER actualizar_disponibilidad_habitaciones
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Estado = "Ocupado"
    WHERE HabitacionID = NEW.HabitacionID;
END;
DELIMITER;

---------------------------------------------------
DELIMITER//

CREATE TRIGGER Actualizar_Ocupacion_habitaciones
AFTER DELETE ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Estado = "Disponible"
    WHERE HabitacionID = OLD.HabitacionID;
END
DELIMITER ;
---------------------------------------------------
drop Trigger actualizar_disponibilidad_habitaciones;
drop Trigger Actualizar_Ocupacion_habitaciones;