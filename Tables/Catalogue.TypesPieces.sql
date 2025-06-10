USE ClassicalMusic
GO

CREATE TABLE Catalogue.TypesPieces (
    TypePieceID int IDENTITY(1,1),
    Name nvarchar(50) NOT NULL,
    CONSTRAINT PK_TypesPieces PRIMARY KEY CLUSTERED (TypePieceID ASC)
);
GO

ALTER TABLE Catalogue.TypesPieces ADD CONSTRAINT UQ_TypesPieces_Name UNIQUE (Name)
GO

INSERT INTO Catalogue.TypesPieces VALUES
('Symphony'),
('Piano Sonata'),
('Piano Concerto'),
('Violin Concerto'),
('String Quartet'),
('Overture'),
('Fantasy'),
('Variations');
GO