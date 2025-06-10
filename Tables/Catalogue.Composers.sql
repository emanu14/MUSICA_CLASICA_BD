USE ClassicalMusic
GO

CREATE TABLE Catalogue.Composers (
    ComposerID int IDENTITY(1,1),
    Name nvarchar(50) NOT NULL,
    CONSTRAINT PK_Composers PRIMARY KEY CLUSTERED (ComposerID ASC)
);
GO

ALTER TABLE Catalogue.Composers ADD CONSTRAINT UQ_Composers_Name UNIQUE (Name)
GO