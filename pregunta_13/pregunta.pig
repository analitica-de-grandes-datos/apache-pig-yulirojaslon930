/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

SELECT
    color
FROM 
    u 
WHERE 
    color 
LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig
*/

datos = LOAD './data.csv' using PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, nivel:int);
seleccion = FOREACH datos GENERATE color;
salida =  FILTER seleccion BY color matches '[b].*';
STORE salida INTO 'output/' using PigStorage(',');