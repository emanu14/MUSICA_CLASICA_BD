USE ClassicalMusic;
GO

CREATE OR ALTER FUNCTION Catalogue.ufnBuildLink (@Link nvarchar(200), @TypeLinkID int)
RETURNS nvarchar(200)
WITH SCHEMABINDING
AS
BEGIN
    DECLARE @BuiltLink nvarchar(200);
    BEGIN IF @TypeLinkID = 1
        SET @BuiltLink = CONCAT('https://www.youtube.com/watch?v=', @Link)
    ELSE IF @TypeLinkID = 2
        SET @BuiltLink = CONCAT('https://open.spotify.com/track/', @Link)
    ELSE
        SET @BuiltLink = NULL
    END;
    RETURN @BuiltLink;
END;
GO