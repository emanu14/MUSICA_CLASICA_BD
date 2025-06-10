USE ClassicalMusic
GO

CREATE TABLE Catalogue.TypesLinks (
    TypeLinkID int IDENTITY(1,1),
    Name nvarchar(50) NOT NULL,
    CONSTRAINT PK_TypesLinks PRIMARY KEY CLUSTERED (TypeLinkID ASC)
);
GO

ALTER TABLE Catalogue.TypesLinks ADD CONSTRAINT UQ_TypesLinks_Name UNIQUE (Name)
GO

INSERT INTO Catalogue.TypesLinks VALUES
('Youtube'),
('Spotify');
GO