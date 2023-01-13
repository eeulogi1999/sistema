SELECT *
FROM ppagos
LEFT JOIN cajas ON ppagos.ppa_caj_id = cajas.caj_id
where cajas.caj_tipo = 3 and  cajas.caj_numero = 6 and cajas.caj_tga_id = 10