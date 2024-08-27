
DELIMITER //
CREATE PROCEDURE Cancelar_Reserva(
    IN p_ReservaID INT
)

BEGIN
DELETE FROM Reservas WHERE ReservaID = p_ReservaID
END
DELIMITER;

CALL Cancelar_Reserva()

