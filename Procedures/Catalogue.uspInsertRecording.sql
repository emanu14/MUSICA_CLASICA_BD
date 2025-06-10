USE ClassicalMusic;
GO

CREATE OR ALTER PROCEDURE Catalogue.uspInsertRecording (
    @PieceID int,
    @YearReference smallint,
    @PerformersIDs nvarchar(max),
    @CodesYoutube nvarchar(max),
    @CodesSpotify nvarchar(max)
) AS BEGIN
SET XACT_ABORT ON;

BEGIN TRY
	BEGIN TRANSACTION;

	-- Validate passed PieceID exists
	IF NOT EXISTS (
		SELECT TOP 1 Pieces.PieceID 
		FROM Catalogue.Pieces 
		WHERE Pieces.PieceID=@PieceID)
	THROW 50001, '@PieceID not found', 1;

	DECLARE @NPassedPerformerIDs int = (
		SELECT COUNT(*)
		FROM OPENJSON(@PerformersIDs)
	);

	DECLARE @NFoundPerformerIDs int = (
		SELECT COUNT(CAST(TRIM([value]) AS int))
		FROM OPENJSON(@PerformersIDs) AS PassedPerformersIDs
		INNER JOIN Catalogue.Performers ON Performers.PerformerID=CAST(TRIM(PassedPerformersIDs.[value]) AS int)
	);

	-- Validate passed PerformersIDs exist
	IF @NPassedPerformerIDs != @NFoundPerformerIDs THROW 50001, 'Some PerformersIDs not found', 1;

	DECLARE @NPassedCodesYoutube int = (
		SELECT COUNT(*)
		FROM OPENJSON(@CodesYoutube)
	);

	DECLARE @NPassedCodesSpotify int = (
		SELECT COUNT(*)
		FROM OPENJSON(@CodesSpotify)
	);

	DECLARE @NMovements int = (
		SELECT COUNT(*)
		FROM Catalogue.Movements
		WHERE Movements.PieceID=@PieceID
	);

	-- Validate the number of passed codes equals the number of movements of the piece
	IF @NPassedCodesYoutube != @NPassedCodesSpotify OR @NPassedCodesYoutube != @NMovements
	THROW 50001, 'The number of codes passed does not match the number of movements the piece has', 1;

	-- INSERT Recording
	INSERT INTO Catalogue.Recordings (PieceID, YearReference)
	VALUES (@PieceID, @YearReference);

	DECLARE @RecordingID int = SCOPE_IDENTITY();

	-- INSERT RecordingsPerformers
	INSERT INTO Catalogue.RecordingsPerformers (RecordingID, PerformerID)
	SELECT @RecordingID, CAST(TRIM([value]) AS int)
	FROM OPENJSON(@PerformersIDs);

	-- INSERT Links
	INSERT INTO Catalogue.Links (TrackID, TypeLinkID, Code)
	SELECT *
	FROM Catalogue.ufnMapCodesTracks(@CodesYoutube, 1, @RecordingID);

	INSERT INTO Catalogue.Links (TrackID, TypeLinkID, Code)
	SELECT *
	FROM Catalogue.ufnMapCodesTracks(@CodesSpotify, 2, @RecordingID);

	-- Show results
	SELECT *
	FROM Catalogue.Recordings
	WHERE RecordingID=@RecordingID;
	
	SELECT *
	FROM Catalogue.RecordingsPerformers
	WHERE RecordingID=@RecordingID;
	
	SELECT Tracks.RecordingID, Tracks.TrackID, Tracks.MovementID, Links.LinkID, Links.TypeLinkID, Links.Code 
	FROM Catalogue.Tracks
	INNER JOIN Catalogue.Links ON Tracks.TrackID=Links.TrackID
	WHERE Tracks.RecordingID=@RecordingID;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
	PRINT 'ERROR ' + CONVERT(varchar(10), ERROR_NUMBER()) + ': ' + ERROR_MESSAGE();
END CATCH;

SET XACT_ABORT OFF;
END;
GO