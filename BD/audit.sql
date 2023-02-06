SELECT *
FROM ppagos
LEFT JOIN cajas ON ppagos.ppa_caj_id = cajas.caj_id
where cajas.caj_tipo = 3 and  cajas.caj_numero = 6 and cajas.caj_tga_id = 10

DELETE FROM `asistencias`  WHERE asi_horaE BETWEEN "2023-01-01" AND "2023-01-08"


-- now 2023-01-26
SET global general_log = 1;
SET global log_output = 'table';


SET GLOBAL general_log = 'OFF';
RENAME TABLE general_log TO general_log_temp;
DELETE FROM `general_log_temp` WHERE `event_time` < '2023-01-27';
RENAME TABLE general_log_temp TO general_log;
SET GLOBAL general_log = 'ON';
select * from mysql.general_log
--jdsiuf