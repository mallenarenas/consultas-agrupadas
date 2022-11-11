CREATE DATABASE desafio2_mallen_arenas_482;

\c desafio2_mallen_arenas_482

CREATE TABLE IF NOT EXISTS inscritos(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- 1) ¿Cuántos registros hay?
SELECT COUNT(*) FROM inscritos;
-- 2) ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM inscritos;
-- 3) ¿Cuál o cuáles son los registros de mayor antigüedad?
    -- HINT: ocupar subconsultas
SELECT * FROM INSCRITOS WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
-- 4) ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
-- ahora en adelante)
SELECT fecha, SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha; 
-- 5) ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) FROM inscritos GROUP BY fuente;
-- 6) ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
-- inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha ORDER BY cantidad DESC LIMIT 1;
-- 7) ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
-- personas fueron?
    -- HINT: si hay más de un registro, tomar el primero
SELECT * FROM inscritos WHERE fuente='Blog' ORDER BY cantidad DESC LIMIT 1;
-- 8) ¿Cuántas personas en promedio se inscriben en un día?
SELECT AVG(cantidad) FROM (SELECT fecha, SUM(cantidad) as cantidad FROM inscritos GROUP BY fecha) AS avg_personasxdia;
-- 9) ¿Qué días se inscribieron más de 50 personas?
SELECT * FROM (SELECT fecha, SUM(cantidad) as cantidad FROM inscritos GROUP BY fecha) AS personasxdia WHERE cantidad > 50;
-- 10) ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
    -- HINT: ingresa manualmente la fecha del tercer día
SELECT AVG(cantidad) FROM (SELECT fecha, SUM(cantidad) as cantidad FROM inscritos GROUP BY fecha HAVING fecha >= date('2021-01-03')) AS avg_personasxdia;
