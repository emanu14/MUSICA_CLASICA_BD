USE ClassicalMusic;
GO

CREATE TABLE Catalogue.Tracks (
    TrackID int IDENTITY(1,1),
	RecordingID int NOT NULL,
    MovementID int NOT NULL,
    CONSTRAINT PK_Tracks PRIMARY KEY CLUSTERED (TrackID ASC)
);
GO

ALTER TABLE Catalogue.Tracks ADD CONSTRAINT FK_Tracks_RecordingID FOREIGN KEY (RecordingID)
REFERENCES Catalogue.Recordings (RecordingID);
GO

ALTER TABLE Catalogue.Tracks ADD CONSTRAINT FK_Tracks_MovementID FOREIGN KEY (MovementID)
REFERENCES Catalogue.Movements (MovementID);
GO

ALTER TABLE Catalogue.Tracks ADD CONSTRAINT UQ_Tracks_RecordingID_MovementID UNIQUE (RecordingID, MovementID)
GO

CREATE NONCLUSTERED INDEX IX_Tracks_RecordingID ON Catalogue.Tracks (RecordingID);
GO