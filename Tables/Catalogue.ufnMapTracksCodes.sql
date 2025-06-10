USE ClassicalMusic;
GO

CREATE OR ALTER FUNCTION Catalogue.ufnMapCodesTracks (@Codes nvarchar(max), @TypeLinkID int, @RecordingID int)
RETURNS TABLE
WITH SCHEMABINDING
AS RETURN
    WITH Tracks AS (
		SELECT (ROW_NUMBER() OVER (ORDER BY TrackID)) AS Position, TrackID
		FROM Catalogue.Tracks
		WHERE Tracks.RecordingID=@RecordingID
	),
	Codes AS (
		SELECT CAST([key] AS int) + 1 AS Position, TRIM([value]) AS Code
		FROM OPENJSON(@Codes)
	)
	SELECT Tracks.TrackID, @TypeLinkID AS TypeLinkID, Codes.Code
	FROM Tracks
	INNER JOIN Codes ON Tracks.Position=Codes.Position;
GO