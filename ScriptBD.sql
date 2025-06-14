USE [master]
GO
/****** Object:  Database [ClassicalMusic]    Script Date: 6/10/2025 12:01:04 PM ******/
CREATE DATABASE [ClassicalMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClassicalMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ClassicalMusic.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClassicalMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ClassicalMusic_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClassicalMusic] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClassicalMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClassicalMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClassicalMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClassicalMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClassicalMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClassicalMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClassicalMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClassicalMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClassicalMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClassicalMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClassicalMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClassicalMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClassicalMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClassicalMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClassicalMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClassicalMusic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClassicalMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClassicalMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClassicalMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClassicalMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClassicalMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClassicalMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClassicalMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClassicalMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [ClassicalMusic] SET  MULTI_USER 
GO
ALTER DATABASE [ClassicalMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClassicalMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClassicalMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClassicalMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClassicalMusic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClassicalMusic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClassicalMusic', N'ON'
GO
ALTER DATABASE [ClassicalMusic] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClassicalMusic] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClassicalMusic]
GO
/****** Object:  Schema [Catalogue]    Script Date: 6/10/2025 12:01:04 PM ******/
CREATE SCHEMA [Catalogue]
GO
/****** Object:  Table [Catalogue].[Composers]    Script Date: 6/10/2025 12:01:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Composers](
	[ComposerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Composers] PRIMARY KEY CLUSTERED 
(
	[ComposerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Composers_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[TypesPieces]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[TypesPieces](
	[TypePieceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesPieces] PRIMARY KEY CLUSTERED 
(
	[TypePieceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TypesPieces_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Performers]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Performers](
	[PerformerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypePerformerID] [int] NOT NULL,
 CONSTRAINT [PK_Performers] PRIMARY KEY CLUSTERED 
(
	[PerformerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Pieces]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Pieces](
	[PieceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ComposerID] [int] NULL,
	[YearPublished] [smallint] NULL,
	[TypePieceID] [int] NULL,
 CONSTRAINT [PK_Pieces] PRIMARY KEY CLUSTERED 
(
	[PieceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Recordings]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Recordings](
	[RecordingID] [int] IDENTITY(1,1) NOT NULL,
	[PieceID] [int] NOT NULL,
	[YearReference] [smallint] NOT NULL,
 CONSTRAINT [PK_Recordings] PRIMARY KEY CLUSTERED 
(
	[RecordingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[RecordingsPerformers]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[RecordingsPerformers](
	[RecordingPerformerID] [int] IDENTITY(1,1) NOT NULL,
	[RecordingID] [int] NOT NULL,
	[PerformerID] [int] NOT NULL,
 CONSTRAINT [PK_RecordingsPerformers] PRIMARY KEY CLUSTERED 
(
	[RecordingPerformerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_RecordingsPerformers_RecordingID_PerformerID] UNIQUE NONCLUSTERED 
(
	[RecordingID] ASC,
	[PerformerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Catalogue].[vRecordings]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [Catalogue].[vRecordings]
WITH SCHEMABINDING
AS
SELECT
	RecordingsPerformers.RecordingPerformerID AS RecordingPerformerID,
	Recordings.RecordingID AS RecordingID,
	Pieces.PieceID AS PieceID,
	Pieces.Name AS Piece,
	Composers.ComposerID AS ComposerID,
	Composers.Name AS Composer,
	TypesPieces.TypePieceID AS TypePieceID,
	TypesPieces.Name AS TypePiece,
	Performers.PerformerID AS PerformerID,
	Performers.Name AS Performer,
	Recordings.YearReference AS YearReference
FROM Catalogue.Recordings
	INNER JOIN Catalogue.RecordingsPerformers ON Recordings.RecordingID=RecordingsPerformers.RecordingID
		INNER JOIN Catalogue.Performers ON RecordingsPerformers.PerformerID=Performers.PerformerID
	INNER JOIN Catalogue.Pieces ON Recordings.PieceID=Pieces.PieceID
		LEFT JOIN Catalogue.Composers ON Pieces.ComposerID=Composers.ComposerID
		LEFT JOIN Catalogue.TypesPieces ON Pieces.TypePieceID=TypesPieces.TypePieceID;
GO
/****** Object:  View [Catalogue].[vPieces]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [Catalogue].[vPieces]
WITH SCHEMABINDING
AS
SELECT
	Pieces.PieceID AS PieceID,
	Pieces.Name AS Piece,
	Composers.ComposerID AS ComposerID,
	Composers.Name AS Composer,
	Pieces.YearPublished AS YearPublished,
	TypesPieces.TypePieceID AS TypePieceID,
	TypesPieces.Name AS TypePiece
FROM Catalogue.Pieces
	LEFT JOIN Catalogue.Composers ON Composers.ComposerID=Pieces.ComposerID
	LEFT JOIN Catalogue.TypesPieces ON TypesPieces.TypePieceID=Pieces.TypePieceID;
GO
/****** Object:  Table [Catalogue].[TypesPerformers]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[TypesPerformers](
	[TypePerformerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesPerformers] PRIMARY KEY CLUSTERED 
(
	[TypePerformerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TypesPerformers_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Catalogue].[vPerformers]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Catalogue].[vPerformers]
WITH SCHEMABINDING
AS
SELECT
	Performers.PerformerID AS PerformerID,
	Performers.Name AS Name,
	TypesPerformers.TypePerformerID AS TypePerformerID,
	TypesPerformers.Name AS Type
FROM Catalogue.Performers
	INNER JOIN Catalogue.TypesPerformers ON Performers.TypePerformerID=TypesPerformers.TypePerformerID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vPerformers]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_vPerformers] ON [Catalogue].[vPerformers]
(
	[PerformerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Tracks]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Tracks](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[RecordingID] [int] NOT NULL,
	[MovementID] [int] NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Tracks_RecordingID_MovementID] UNIQUE NONCLUSTERED 
(
	[RecordingID] ASC,
	[MovementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Catalogue].[ufnMapCodesTracks]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [Catalogue].[ufnMapCodesTracks] (@Codes nvarchar(max), @TypeLinkID int, @RecordingID int)
RETURNS TABLE
WITH SCHEMABINDING
AS RETURN
    WITH Tracks AS (
		SELECT (ROW_NUMBER() OVER (ORDER BY TrackID)) AS Position, TrackID
		FROM Catalogue.Tracks
		WHERE Tracks.RecordingID=@RecordingID
	),
	Codes AS (
		SELECT CAST([key] AS int) + 1 AS Position, TRIM([value]) AS Code
		FROM OPENJSON(@Codes)
	)
	SELECT Tracks.TrackID, @TypeLinkID AS TypeLinkID, Codes.Code
	FROM Tracks
	INNER JOIN Codes ON Tracks.Position=Codes.Position;
GO
/****** Object:  Table [Catalogue].[TypesLinks]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[TypesLinks](
	[TypeLinkID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesLinks] PRIMARY KEY CLUSTERED 
(
	[TypeLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_TypesLinks_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Movements]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Movements](
	[MovementID] [int] IDENTITY(1,1) NOT NULL,
	[PieceID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Movements] PRIMARY KEY CLUSTERED 
(
	[MovementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Catalogue].[Links]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Catalogue].[Links](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[TrackID] [int] NOT NULL,
	[TypeLinkID] [int] NOT NULL,
	[Code] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Catalogue].[ufnBuildLink]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [Catalogue].[ufnBuildLink] (@Link nvarchar(200), @TypeLinkID int)
RETURNS nvarchar(200)
WITH SCHEMABINDING
AS
BEGIN
    DECLARE @BuiltLink nvarchar(200);
    BEGIN IF @TypeLinkID = 1
        SET @BuiltLink = CONCAT('https://www.youtube.com/watch?v=', @Link)
    ELSE IF @TypeLinkID = 2
        SET @BuiltLink = CONCAT('https://open.spotify.com/track/', @Link)
    ELSE
        SET @BuiltLink = NULL
    END;
    RETURN @BuiltLink;
END;
GO
/****** Object:  View [Catalogue].[vTracks]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [Catalogue].[vTracks]
WITH SCHEMABINDING
AS
SELECT
	Tracks.TrackID AS TrackID,
	Tracks.RecordingID AS RecordingID,
	Tracks.MovementID AS MovementID,
	Movements.Name AS Movement,
	Links.LinkID AS LinkID,
	Links.TypeLinkID AS TypeLinkID,
	TypesLinks.Name AS TypeLink,
	Catalogue.ufnBuildLink(Links.Code, Links.TypeLinkID) AS Link
FROM Catalogue.Tracks
	INNER JOIN Catalogue.Movements ON Tracks.MovementID=Movements.MovementID
	INNER JOIN Catalogue.Links ON Tracks.TrackID=Links.TrackID
		INNER JOIN Catalogue.TypesLinks ON Links.TypeLinkID=TypesLinks.TypeLinkID;
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vTracks]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_vTracks] ON [Catalogue].[vTracks]
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Links_TrackID]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Links_TrackID] ON [Catalogue].[Links]
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movements_PieceID]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movements_PieceID] ON [Catalogue].[Movements]
(
	[PieceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordingsPerformers_RecordingID]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_RecordingsPerformers_RecordingID] ON [Catalogue].[RecordingsPerformers]
(
	[RecordingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tracks_RecordingID]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tracks_RecordingID] ON [Catalogue].[Tracks]
(
	[RecordingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vPerformers_Name]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_vPerformers_Name] ON [Catalogue].[vPerformers]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vTracks_RecordingID]    Script Date: 6/10/2025 12:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_vTracks_RecordingID] ON [Catalogue].[vTracks]
(
	[RecordingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Catalogue].[Links]  WITH CHECK ADD  CONSTRAINT [FK_Links_TrackID] FOREIGN KEY([TrackID])
REFERENCES [Catalogue].[Tracks] ([TrackID])
GO
ALTER TABLE [Catalogue].[Links] CHECK CONSTRAINT [FK_Links_TrackID]
GO
ALTER TABLE [Catalogue].[Links]  WITH CHECK ADD  CONSTRAINT [FK_Links_TypeLinkID] FOREIGN KEY([TypeLinkID])
REFERENCES [Catalogue].[TypesLinks] ([TypeLinkID])
GO
ALTER TABLE [Catalogue].[Links] CHECK CONSTRAINT [FK_Links_TypeLinkID]
GO
ALTER TABLE [Catalogue].[Movements]  WITH CHECK ADD  CONSTRAINT [FK_Movements_PieceID] FOREIGN KEY([PieceID])
REFERENCES [Catalogue].[Pieces] ([PieceID])
GO
ALTER TABLE [Catalogue].[Movements] CHECK CONSTRAINT [FK_Movements_PieceID]
GO
ALTER TABLE [Catalogue].[Performers]  WITH CHECK ADD  CONSTRAINT [FK_Performers_TypePerformerID] FOREIGN KEY([TypePerformerID])
REFERENCES [Catalogue].[TypesPerformers] ([TypePerformerID])
GO
ALTER TABLE [Catalogue].[Performers] CHECK CONSTRAINT [FK_Performers_TypePerformerID]
GO
ALTER TABLE [Catalogue].[Pieces]  WITH CHECK ADD  CONSTRAINT [FK_Pieces_ComposerID] FOREIGN KEY([ComposerID])
REFERENCES [Catalogue].[Composers] ([ComposerID])
GO
ALTER TABLE [Catalogue].[Pieces] CHECK CONSTRAINT [FK_Pieces_ComposerID]
GO
ALTER TABLE [Catalogue].[Pieces]  WITH CHECK ADD  CONSTRAINT [FK_Pieces_TypePieceID] FOREIGN KEY([TypePieceID])
REFERENCES [Catalogue].[TypesPieces] ([TypePieceID])
GO
ALTER TABLE [Catalogue].[Pieces] CHECK CONSTRAINT [FK_Pieces_TypePieceID]
GO
ALTER TABLE [Catalogue].[Recordings]  WITH CHECK ADD  CONSTRAINT [FK_Recordings_PieceID] FOREIGN KEY([PieceID])
REFERENCES [Catalogue].[Pieces] ([PieceID])
GO
ALTER TABLE [Catalogue].[Recordings] CHECK CONSTRAINT [FK_Recordings_PieceID]
GO
ALTER TABLE [Catalogue].[RecordingsPerformers]  WITH CHECK ADD  CONSTRAINT [FK_RecordingsPerformers_PerformerID] FOREIGN KEY([PerformerID])
REFERENCES [Catalogue].[Performers] ([PerformerID])
GO
ALTER TABLE [Catalogue].[RecordingsPerformers] CHECK CONSTRAINT [FK_RecordingsPerformers_PerformerID]
GO
ALTER TABLE [Catalogue].[RecordingsPerformers]  WITH CHECK ADD  CONSTRAINT [FK_RecordingsPerformers_RecordingID] FOREIGN KEY([RecordingID])
REFERENCES [Catalogue].[Recordings] ([RecordingID])
GO
ALTER TABLE [Catalogue].[RecordingsPerformers] CHECK CONSTRAINT [FK_RecordingsPerformers_RecordingID]
GO
ALTER TABLE [Catalogue].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_MovementID] FOREIGN KEY([MovementID])
REFERENCES [Catalogue].[Movements] ([MovementID])
GO
ALTER TABLE [Catalogue].[Tracks] CHECK CONSTRAINT [FK_Tracks_MovementID]
GO
ALTER TABLE [Catalogue].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_RecordingID] FOREIGN KEY([RecordingID])
REFERENCES [Catalogue].[Recordings] ([RecordingID])
GO
ALTER TABLE [Catalogue].[Tracks] CHECK CONSTRAINT [FK_Tracks_RecordingID]
GO
/****** Object:  StoredProcedure [Catalogue].[uspInsertPiece]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Catalogue].[uspInsertPiece] (
    @Name nvarchar(100),
    @Composer nvarchar(50) = NULL,
    @YearPublished smallint = NULL,
    @TypePiece nvarchar(50) = NULL,
    @Movements nvarchar(max) = NULL
) AS BEGIN
SET XACT_ABORT ON;

BEGIN TRY
BEGIN TRANSACTION;

	DECLARE @ComposerID int = (SELECT TOP 1 ComposerID FROM Catalogue.Composers WHERE Name=@Composer);

	-- Validate passed composer exists
	IF (@Composer IS NOT NULL) AND (@ComposerID IS NULL)
	THROW 50001, '@Composer not found', 1;

	DECLARE @TypePieceID int = (SELECT TOP 1 TypePieceID FROM Catalogue.TypesPieces WHERE Name=@TypePiece);

	-- Validate passed type of piece exists
	IF (@TypePiece IS NOT NULL) AND (@TypePieceID IS NULL)
	THROW 50001, '@TypePiece not found', 1;

	-- INSERT Piece
	INSERT INTO Catalogue.Pieces (Name, ComposerID, YearPublished, TypePieceID)
	VALUES (@Name, @ComposerID, @YearPublished, @TypePieceID);

	DECLARE @PieceID int = SCOPE_IDENTITY();

	-- INSERT Movements
	IF @Movements IS NULL BEGIN
		INSERT INTO Catalogue.Movements (PieceID, Name) VALUES (@PieceID, NULL);
	END
	ELSE BEGIN
		INSERT INTO Catalogue.Movements (PieceID, Name)
		SELECT @PieceID, TRIM([value])
		FROM OPENJSON(@Movements);
	END;

	-- Show results
	SELECT * FROM Catalogue.Pieces WHERE PieceID=@PieceID;
	SELECT * FROM Catalogue.Movements WHERE PieceID=@PieceID;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
	PRINT 'ERROR ' + CONVERT(varchar(10), ERROR_NUMBER()) + ': ' + ERROR_MESSAGE();
END CATCH;

SET XACT_ABORT OFF;
END;
GO
/****** Object:  StoredProcedure [Catalogue].[uspInsertRecording]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Catalogue].[uspInsertRecording] (
    @PieceID int,
    @YearReference smallint,
    @PerformersIDs nvarchar(max),
    @CodesYoutube nvarchar(max),
    @CodesSpotify nvarchar(max)
) AS BEGIN
SET XACT_ABORT ON;

BEGIN TRY
	BEGIN TRANSACTION;

	-- Validate passed PieceID exists
	IF NOT EXISTS (
		SELECT TOP 1 Pieces.PieceID 
		FROM Catalogue.Pieces 
		WHERE Pieces.PieceID=@PieceID)
	THROW 50001, '@PieceID not found', 1;

	DECLARE @NPassedPerformerIDs int = (
		SELECT COUNT(*)
		FROM OPENJSON(@PerformersIDs)
	);

	DECLARE @NFoundPerformerIDs int = (
		SELECT COUNT(CAST(TRIM([value]) AS int))
		FROM OPENJSON(@PerformersIDs) AS PassedPerformersIDs
		INNER JOIN Catalogue.Performers ON Performers.PerformerID=CAST(TRIM(PassedPerformersIDs.[value]) AS int)
	);

	-- Validate passed PerformersIDs exist
	IF @NPassedPerformerIDs != @NFoundPerformerIDs THROW 50001, 'Some PerformersIDs not found', 1;

	DECLARE @NPassedCodesYoutube int = (
		SELECT COUNT(*)
		FROM OPENJSON(@CodesYoutube)
	);

	DECLARE @NPassedCodesSpotify int = (
		SELECT COUNT(*)
		FROM OPENJSON(@CodesSpotify)
	);

	DECLARE @NMovements int = (
		SELECT COUNT(*)
		FROM Catalogue.Movements
		WHERE Movements.PieceID=@PieceID
	);

	-- Validate the number of passed codes equals the number of movements of the piece
	IF @NPassedCodesYoutube != @NPassedCodesSpotify OR @NPassedCodesYoutube != @NMovements
	THROW 50001, 'The number of codes passed does not match the number of movements the piece has', 1;

	-- INSERT Recording
	INSERT INTO Catalogue.Recordings (PieceID, YearReference)
	VALUES (@PieceID, @YearReference);

	DECLARE @RecordingID int = SCOPE_IDENTITY();

	-- INSERT RecordingsPerformers
	INSERT INTO Catalogue.RecordingsPerformers (RecordingID, PerformerID)
	SELECT @RecordingID, CAST(TRIM([value]) AS int)
	FROM OPENJSON(@PerformersIDs);

	-- INSERT Links
	INSERT INTO Catalogue.Links (TrackID, TypeLinkID, Code)
	SELECT *
	FROM Catalogue.ufnMapCodesTracks(@CodesYoutube, 1, @RecordingID);

	INSERT INTO Catalogue.Links (TrackID, TypeLinkID, Code)
	SELECT *
	FROM Catalogue.ufnMapCodesTracks(@CodesSpotify, 2, @RecordingID);

	-- Show results
	SELECT *
	FROM Catalogue.Recordings
	WHERE RecordingID=@RecordingID;
	
	SELECT *
	FROM Catalogue.RecordingsPerformers
	WHERE RecordingID=@RecordingID;
	
	SELECT Tracks.RecordingID, Tracks.TrackID, Tracks.MovementID, Links.LinkID, Links.TypeLinkID, Links.Code 
	FROM Catalogue.Tracks
	INNER JOIN Catalogue.Links ON Tracks.TrackID=Links.TrackID
	WHERE Tracks.RecordingID=@RecordingID;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
	PRINT 'ERROR ' + CONVERT(varchar(10), ERROR_NUMBER()) + ': ' + ERROR_MESSAGE();
END CATCH;

SET XACT_ABORT OFF;
END;
GO
/****** Object:  Trigger [Catalogue].[trResultAfterInsertComposer]    Script Date: 6/10/2025 12:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Catalogue].[trResultAfterInsertComposer]
ON [Catalogue].[Composers]
AFTER INSERT
AS
	SET NOCOUNT ON;
	SELECT * FROM INSERTED;
;
GO
ALTER TABLE [Catalogue].[Composers] ENABLE TRIGGER [trResultAfterInsertComposer]
GO
/****** Object:  Trigger [Catalogue].[trResultAfterInsertPerformer]    Script Date: 6/10/2025 12:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Catalogue].[trResultAfterInsertPerformer]
ON [Catalogue].[Performers]
AFTER INSERT
AS
	SET NOCOUNT ON;
	SELECT * FROM INSERTED;
;
GO
ALTER TABLE [Catalogue].[Performers] ENABLE TRIGGER [trResultAfterInsertPerformer]
GO
/****** Object:  Trigger [Catalogue].[trCreateTracksAfterInsertRecording]    Script Date: 6/10/2025 12:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Catalogue].[trCreateTracksAfterInsertRecording]
ON [Catalogue].[Recordings]
AFTER INSERT
AS
	SET NOCOUNT ON;
	INSERT INTO Catalogue.Tracks (RecordingID, MovementID)
	SELECT INSERTED.RecordingID, Movements.MovementID
	FROM INSERTED
	INNER JOIN Catalogue.Movements ON INSERTED.PieceID=Movements.PieceID;
;
GO
ALTER TABLE [Catalogue].[Recordings] ENABLE TRIGGER [trCreateTracksAfterInsertRecording]
GO
USE [master]
GO
ALTER DATABASE [ClassicalMusic] SET  READ_WRITE 
GO
