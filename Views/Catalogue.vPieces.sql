USE ClassicalMusic;
GO

CREATE OR ALTER VIEW Catalogue.vPieces
WITH SCHEMABINDING
AS
SELECT
	Pieces.PieceID AS PieceID,
	Pieces.Name AS Piece,
	Composers.ComposerID AS ComposerID,
	Composers.Name AS Composer,
	Pieces.YearPublished AS YearPublished,
	TypesPieces.TypePieceID AS TypePieceID,
	TypesPieces.Name AS TypePiece
FROM Catalogue.Pieces
	LEFT JOIN Catalogue.Composers ON Composers.ComposerID=Pieces.ComposerID
	LEFT JOIN Catalogue.TypesPieces ON TypesPieces.TypePieceID=Pieces.TypePieceID;
GO

CREATE UNIQUE CLUSTERED INDEX IX_vPieces
ON Catalogue.vPieces (PieceID);
GO

CREATE NONCLUSTERED INDEX IX_vPieces_Piece
ON Catalogue.vPieces (Piece);
GO

CREATE NONCLUSTERED INDEX IX_vPieces_Composer
ON Catalogue.vPieces (Composer);
GO

CREATE NONCLUSTERED INDEX IX_vPieces_TypePiece
ON Catalogue.vPieces (TypePiece);
GO