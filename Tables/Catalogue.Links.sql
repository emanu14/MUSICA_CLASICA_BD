USE ClassicalMusic;
GO

CREATE TABLE Catalogue.Links (
    LinkID int IDENTITY(1,1),
	TrackID int NOT NULL,
    TypeLinkID int NOT NULL,
    Code nvarchar(150) NOT NULL,
    CONSTRAINT PK_Links PRIMARY KEY CLUSTERED (LinkID ASC)
);
GO

ALTER TABLE Catalogue.Links ADD CONSTRAINT FK_Links_TrackID FOREIGN KEY (TrackID)
REFERENCES Catalogue.Tracks (TrackID);
GO

ALTER TABLE Catalogue.Links ADD CONSTRAINT FK_Links_TypeLinkID FOREIGN KEY (TypeLinkID)
REFERENCES Catalogue.TypesLinks (TypeLinkID);
GO

CREATE NONCLUSTERED INDEX IX_Links_TrackID ON Catalogue.Links (TrackID);
GO