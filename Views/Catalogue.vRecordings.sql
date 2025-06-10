USE ClassicalMusic;
GO

CREATE OR ALTER VIEW Catalogue.vRecordings
WITH SCHEMABINDING
AS
SELECT
	RecordingsPerformers.RecordingPerformerID AS RecordingPerformerID,
	Recordings.RecordingID AS RecordingID,
	Pieces.PieceID AS PieceID,
	Pieces.Name AS Piece,
	Composers.ComposerID AS ComposerID,
	Composers.Name AS Composer,
	TypesPieces.TypePieceID AS TypePieceID,
	TypesPieces.Name AS TypePiece,
	Performers.PerformerID AS PerformerID,
	Performers.Name AS Performer,
	Recordings.YearReference AS YearReference
FROM Catalogue.Recordings
	INNER JOIN Catalogue.RecordingsPerformers ON Recordings.RecordingID=RecordingsPerformers.RecordingID
		INNER JOIN Catalogue.Performers ON RecordingsPerformers.PerformerID=Performers.PerformerID
	INNER JOIN Catalogue.Pieces ON Recordings.PieceID=Pieces.PieceID
		LEFT JOIN Catalogue.Composers ON Pieces.ComposerID=Composers.ComposerID
		LEFT JOIN Catalogue.TypesPieces ON Pieces.TypePieceID=TypesPieces.TypePieceID;
GO


CREATE UNIQUE CLUSTERED INDEX IX_vRecordings
ON Catalogue.vRecordings (RecordingPerformerID);
GO

CREATE NONCLUSTERED INDEX IX_vRecordings_Piece
ON Catalogue.vRecordings (Piece);
GO

CREATE NONCLUSTERED INDEX IX_vRecordings_Composer
ON Catalogue.vRecordings (Composer);
GO

CREATE NONCLUSTERED INDEX IX_vRecordings_Performer
ON Catalogue.vRecordings (Performer);
GO