USE ClassicalMusic;
GO

CREATE OR ALTER TRIGGER Catalogue.trResultAfterInsertComposer
ON Catalogue.Composers
AFTER INSERT
AS
	SET NOCOUNT ON;
	SELECT * FROM INSERTED;
;
GO