USE ClassicalMusic
GO

CREATE TABLE Catalogue.Pieces (
    PieceID int IDENTITY(1,1),
    Name nvarchar(100) NOT NULL,
    ComposerID int NULL,
    YearPublished smallint NULL,
    TypePieceID int NULL,
    CONSTRAINT PK_Pieces PRIMARY KEY CLUSTERED (PieceID ASC)
);
GO

ALTER TABLE Catalogue.Pieces ADD CONSTRAINT FK_Pieces_ComposerID FOREIGN KEY (ComposerID)
REFERENCES Catalogue.Composeres (ComposerID)
GO

ALTER TABLE Catalogue.Pieces ADD CONSTRAINT FK_Pieces_TypePieceID FOREIGN KEY (TypePieceID)
REFERENCES Catalogue.TypesPieces (TypePieceID)
GO