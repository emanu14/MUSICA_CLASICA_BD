USE ClassicalMusic;
GO

CREATE OR ALTER VIEW Catalogue.vTracks
WITH SCHEMABINDING
AS
SELECT
	Tracks.TrackID AS TrackID,
	Tracks.RecordingID AS RecordingID,
	Tracks.MovementID AS MovementID,
	Movements.Name AS Movement,
	Links.LinkID AS LinkID,
	Links.TypeLinkID AS TypeLinkID,
	TypesLinks.Name AS TypeLink,
	Catalogue.ufnBuildLink(Links.Code, Links.TypeLinkID) AS Link
FROM Catalogue.Tracks
	INNER JOIN Catalogue.Movements ON Tracks.MovementID=Movements.MovementID
	INNER JOIN Catalogue.Links ON Tracks.TrackID=Links.TrackID
		INNER JOIN Catalogue.TypesLinks ON Links.TypeLinkID=TypesLinks.TypeLinkID;
GO

CREATE UNIQUE CLUSTERED INDEX IX_vTracks
ON Catalogue.vTracks (LinkID);
GO

CREATE NONCLUSTERED INDEX IX_vTracks_RecordingID
ON Catalogue.vTracks (RecordingID);
GO

select * from Catalogue.vTracks