USE ClassicalMusic;
GO

CREATE TABLE Catalogue.Performers (
    PerformerID int IDENTITY(1,1),
    Name nvarchar(50) NOT NULL,
    TypePerformerID int NOT NULL,
    CONSTRAINT PK_Performers PRIMARY KEY CLUSTERED (PerformerID ASC)
);
GO

ALTER TABLE Catalogue.Performers ADD CONSTRAINT FK_Performers_TypePerformerID FOREIGN KEY (TypePerformerID)
REFERENCES Catalogue.TypesPerformers (TypePerformerID);
GO