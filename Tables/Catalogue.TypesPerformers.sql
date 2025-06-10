USE ClassicalMusic
GO

CREATE TABLE Catalogue.TypesPerformers (
    TypePerformerID int IDENTITY(1,1),
    Name nvarchar(50) NOT NULL,
    CONSTRAINT PK_TypesPerformers PRIMARY KEY CLUSTERED (TypePerformerID ASC)
);
GO

ALTER TABLE Catalogue.TypesPerformers ADD CONSTRAINT UQ_TypesPerformers_Name UNIQUE (Name)
GO

INSERT INTO Catalogue.TypesPerformers VALUES
('Conductor'),
('Soloist'),
('Orchestra'),
('String Quartet');
GO