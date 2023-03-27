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

--report

SELECT gpe.gpe_nombre,gpe.gpe_apellidos,res.mov_fecha
FROM `company5_bd_cacel`.personas as gpe
INNER JOIN (SELECT age.age_gpe_id, mov.mov_fecha
FROM agentes as age
INNER JOIN (SELECT `mov_age_id`,MIN(`mov_fechaE`) as mov_fecha FROM `movimientos` WHERE `mov_tipo` = 2 GROUP BY `mov_age_id`) as mov
ON age.age_id = mov.mov_age_id) as res
ON gpe.gpe_id = res.age_gpe_id;

SELECT res.age_id,gpe.gpe_id,gpe.gpe_nombre,gpe.gpe_apellidos,res.mov_fecha 
FROM `company5_bd_cacel`.personas as gpe 
INNER JOIN (SELECT age.age_id,age.age_gpe_id, mov.mov_fecha 
FROM agentes as age 
INNER JOIN (SELECT `mov_age_id`,MIN(`mov_fechaE`) as mov_fecha 
FROM `movimientos` WHERE `mov_tipo` = 2 GROUP BY `mov_age_id`) as mov 
ON age.age_id = mov.mov_age_id) as res ON gpe.gpe_id = res.age_gpe_id;