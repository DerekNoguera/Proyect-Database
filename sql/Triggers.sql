
CREATE TRIGGER gg
AFTER INSERT ON disponibles
BEGIN
    UPDATE habitaciones
    SET Disponibilidad = 'Ocupado'
    WHERE id_habitacion = NEW.id_habitacion_disponible;
END