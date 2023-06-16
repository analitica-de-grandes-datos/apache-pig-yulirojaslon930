/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.csv' USING PigStorage(',') as (driverId:int,truckId:int,eventTime:chararray,eventType:chararray,longitude:double,latitude:double,eventKey:chararray,correlationId:chararray,driverName:chararray,routeId:biginteger,routeName:chararray,eventDate:chararray);
filtered = LIMIT lines 10;
cols = FOREACH filtered GENERATE driverId, truckId, eventTime;
orderdata = ORDER cols by driverId, truckId, eventTime;
STORE orderdata INTO 'output' USING PigStorage (',');