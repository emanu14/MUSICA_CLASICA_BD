USE ClassicalMusic;
GO

CREATE VIEW Catalogue.vPerformers
WITH SCHEMABINDING
AS
SELECT
	Performers.PerformerID AS PerformerID,
	Performers.Name AS Name,
	TypesPerformers.TypePerformerID AS TypePerformerID,
	TypesPerformers.Name AS Type
FROM Catalogue.Performers
	INNER JOIN Catalogue.TypesPerformers ON Performers.TypePerformerID=TypesPerformers.TypePerformerID;
GO

CREATE UNIQUE CLUSTERED INDEX IX_vPerformers
ON Catalogue.vPerformers (PerformerID);
GO

CREATE NONCLUSTERED INDEX IX_vPerformers_Name
ON Catalogue.vPerformers (Name);
GO