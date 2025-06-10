USE ClassicalMusic;
GO

CREATE TABLE Catalogue.Movements (
    MovementID int IDENTITY(1,1),
    PieceID int NOT NULL,
	Name nvarchar(100) NULL,
    CONSTRAINT PK_Movements PRIMARY KEY CLUSTERED (MovementID ASC)
);
GO

ALTER TABLE Catalogue.Movements ADD CONSTRAINT FK_Movements_PieceID FOREIGN KEY (PieceID)
REFERENCES Catalogue.Pieces (PieceID);
GO

CREATE NONCLUSTERED INDEX IX_Movements_PieceID ON Catalogue.Movements (PieceID);
GO