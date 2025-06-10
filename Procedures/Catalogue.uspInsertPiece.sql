USE ClassicalMusic;
GO

CREATE OR ALTER PROCEDURE Catalogue.uspInsertPiece (
    @Name nvarchar(100),
    @Composer nvarchar(50) = NULL,
    @YearPublished smallint = NULL,
    @TypePiece nvarchar(50) = NULL,
    @Movements nvarchar(max) = NULL
) AS BEGIN
SET XACT_ABORT ON;

BEGIN TRY
	BEGIN TRANSACTION;

	DECLARE @ComposerID int = (SELECT TOP 1 ComposerID FROM Catalogue.Composers WHERE Name=@Composer);

	-- Validate passed composer exists
	IF (@Composer IS NOT NULL) AND (@ComposerID IS NULL)
	THROW 50001, '@Composer not found', 1;

	DECLARE @TypePieceID int = (SELECT TOP 1 TypePieceID FROM Catalogue.TypesPieces WHERE Name=@TypePiece);

	-- Validate passed type of piece exists
	IF (@TypePiece IS NOT NULL) AND (@TypePieceID IS NULL)
	THROW 50001, '@TypePiece not found', 1;

	-- INSERT Piece
	INSERT INTO Catalogue.Pieces (Name, ComposerID, YearPublished, TypePieceID)
	VALUES (@Name, @ComposerID, @YearPublished, @TypePieceID);

	DECLARE @PieceID int = SCOPE_IDENTITY();

	-- INSERT Movements
	IF @Movements IS NULL BEGIN
		INSERT INTO Catalogue.Movements (PieceID, Name) VALUES (@PieceID, NULL);
	END
	ELSE BEGIN
		INSERT INTO Catalogue.Movements (PieceID, Name)
		SELECT @PieceID, TRIM([value])
		FROM OPENJSON(@Movements);
	END;

	-- Show results
	SELECT * FROM Catalogue.Pieces WHERE PieceID=@PieceID;
	SELECT * FROM Catalogue.Movements WHERE PieceID=@PieceID;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
	PRINT 'ERROR ' + CONVERT(varchar(10), ERROR_NUMBER()) + ': ' + ERROR_MESSAGE();
END CATCH;

SET XACT_ABORT OFF;
END;
GO