USE ClassicalMusic;
GO

CREATE TABLE Catalogue.Recordings (
    RecordingID int IDENTITY(1,1),
    PieceID int NOT NULL,
	YearReference smallint NOT NULL,
    CONSTRAINT PK_Recordings PRIMARY KEY CLUSTERED (RecordingID ASC)
);
GO

ALTER TABLE Catalogue.Recordings ADD CONSTRAINT FK_Recordings_PieceID FOREIGN KEY (PieceID)
REFERENCES Catalogue.Pieces (PieceID);
GO