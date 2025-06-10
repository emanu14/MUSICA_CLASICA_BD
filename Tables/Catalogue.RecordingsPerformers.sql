USE ClassicalMusic;
GO

CREATE TABLE Catalogue.RecordingsPerformers (
    RecordingPerformerID int IDENTITY(1,1),
    RecordingID int NOT NULL,
	PerformerID int NOT NULL,
    CONSTRAINT PK_RecordingsPerformers PRIMARY KEY CLUSTERED (RecordingPerformerID ASC)
);
GO

ALTER TABLE Catalogue.RecordingsPerformers ADD CONSTRAINT FK_RecordingsPerformers_RecordingID FOREIGN KEY (RecordingID)
REFERENCES Catalogue.Recordings (RecordingID);
GO

ALTER TABLE Catalogue.RecordingsPerformers ADD CONSTRAINT FK_RecordingsPerformers_PerformerID FOREIGN KEY (PerformerID)
REFERENCES Catalogue.Performers (PerformerID);
GO

ALTER TABLE Catalogue.RecordingsPerformers ADD CONSTRAINT UQ_RecordingsPerformers_RecordingID_PerformerID UNIQUE (RecordingID, PerformerID)
GO

CREATE NONCLUSTERED INDEX IX_RecordingsPerformers_RecordingID ON Catalogue.RecordingsPerformers (RecordingID);
GO