# MUSICA_CLASICA_BD
Proyecto personal, base de datos para guardar grabaciones de música clásica.

Encontrar grabaciones específicas de música clásica en internet puede ser difícil, de este problema surge la idea para esta base de datos, que permite relacionar piezas de música clásica con grabaciones, intérpretes y links a Youtube y Spotify donde se pueden escuchar. 

Base de datos completa, con vistas, optimizadas para búsquedas con índices, funciones, procedimientos, triggers, uso de transacciones y manejo de errores.

Diagrama ER

![MUSICA_CLASICA drawio](https://github.com/user-attachments/assets/a2488ba4-d3e7-48be-8190-13a044f72ff5)

Para insertar COMPOSERS y PERFORMERS, usar el comando INSERT.

Para insertar PIECES, usar el procedimiento Catalogue.uspInsertPiece. Es necesario que @Composer y @TypePiece existan con ese nombre en las tablas COMPOSERS y TYPESPIECES. Por ejemplo:

EXEC Catalogue.uspInsertPiece
	@Name = 'Symphony No. 7 in A Major, Op. 92',
	@Composer = 'Ludwig van Beethoven',
	@YearPublished = 1813,
	@TypePiece = 'Symphony',
	@Movements = '["I. Poco sostenuto – Vivace","II. Allegretto","III. Presto – Assai meno presto","IV. Allegro con brio"]';
GO

Para insertar RECORDINGS, usar el procedimiento Catalogue.uspInsertRecording. Es necesario pasar JSONs con los IDs de los intérpretes (conductor, ensamble, solista) y los IDs de los movimientos de la pieza. Nótese que los links deben corresponder a los movimientos de la pieza, en este caso, son 4 movimientos. Por ejemplo:

EXEC Catalogue.uspInsertRecording
	  @PieceID = 10,
    @YearReference = 1980,
    @PerformersIDs = '["7","6"]',
    @CodesYoutube = '["CJT90o_89wU","3J4nPes_V3k","Q6cfuTkQE7s","-732aQO7A-M"]',
    @CodesSpotify = '["5fP93DIqPgCNgLbquhUm6y","72JO99FDTqAVmfBPlwtUfk","2jnceUbwp0glgRaqHIUETw","5rt7DmygVh2dFgYAYn032t"]';
GO
