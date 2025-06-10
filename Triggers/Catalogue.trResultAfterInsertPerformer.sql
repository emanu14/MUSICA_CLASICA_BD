USE ClassicalMusic;
GO

CREATE OR ALTER TRIGGER Catalogue.trResultAfterInsertPerformer
ON Catalogue.Performers
AFTER INSERT
AS
	SET NOCOUNT ON;
	SELECT * FROM INSERTED;
;
GO