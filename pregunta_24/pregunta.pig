/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


lines = LOAD 'data.csv' USING PigStorage(',') AS (id:chararray, name:chararray, lastname:chararray, birth:chararray, color:chararray, qty:chararray);
extracted_data = FOREACH lines GENERATE REGEX_EXTRACT(birth, '....-(..)-..', 1) AS month;
STORE extracted_data INTO 'output' USING PigStorage (',');
