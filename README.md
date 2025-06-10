# MUSICA_CLASICA_BD
Proyecto personal, base de datos para guardar grabaciones de música clásica.

Base de datos completa, con vistas, optimizadas para búsquedas con índices, funciones, procedimientos, triggers, uso de transacciones y manejo de errores.

Diagrama ER
![MUSICA_CLASICA drawio](https://github.com/user-attachments/assets/a2488ba4-d3e7-48be-8190-13a044f72ff5)

Para insertar COMPOSERS y PERFORMERS, usar el comando INSERT.

Para insertar PIECES, usar el procedimiento Catalogue.uspInsertPiece
CREATE COMPOSERS -> INSERT command
CREATE PERFORMERS -> INSERT command
CREATE PIECES -> Catalogue.uspInsertPiece
CREATE RECORDINGS -> Catalogue.uspInsertRecording
