USE ClassicalMusic;
GO

CREATE OR ALTER TRIGGER Catalogue.trCreateTracksAfterInsertRecording
ON Catalogue.Recordings
AFTER INSERT
AS
	SET NOCOUNT ON;
	INSERT INTO Catalogue.Tracks (RecordingID, MovementID)
	SELECT INSERTED.RecordingID, Movements.MovementID
	FROM INSERTED
	INNER JOIN Catalogue.Movements ON INSERTED.PieceID=Movements.PieceID;
;
GO