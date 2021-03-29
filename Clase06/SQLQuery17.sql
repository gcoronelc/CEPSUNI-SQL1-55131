-- APLICANDO CASE

select M.*,
	CASE 
		WHEN mat_nota >= 18 then 'Excelente'
		WHEN mat_nota >= 14 then 'Bueno' 
		WHEN mat_nota >= 10 then 'Regular'
		ELSE 'Malo'
	END CALIFICADION 
from educa..MATRICULA M;
go


select 
	IdCurso codigo,
	sum(case when RIGHT(IdCiclo,2) = '01' then cp.Matriculados else 0 end) [01],
	sum(case when RIGHT(IdCiclo,2) = '02' then cp.Matriculados else 0 end) [02],
	sum(case when RIGHT(IdCiclo,2) = '03' then cp.Matriculados else 0 end) [03],
	sum(case when RIGHT(IdCiclo,2) = '04' then cp.Matriculados else 0 end) [04],
	sum(case when RIGHT(IdCiclo,2) = '05' then cp.Matriculados else 0 end) [05],
	sum(case when RIGHT(IdCiclo,2) = '06' then cp.Matriculados else 0 end) [06],
	sum(case when RIGHT(IdCiclo,2) = '07' then cp.Matriculados else 0 end) [07],
	sum(case when RIGHT(IdCiclo,2) = '08' then cp.Matriculados else 0 end) [08],
	sum(case when RIGHT(IdCiclo,2) = '09' then cp.Matriculados else 0 end) [09],
	sum(case when RIGHT(IdCiclo,2) = '10' then cp.Matriculados else 0 end) [10],
	sum(case when RIGHT(IdCiclo,2) = '11' then cp.Matriculados else 0 end) [11],
	sum(case when RIGHT(IdCiclo,2) = '12' then cp.Matriculados else 0 end) [12],
	sum(Matriculados) Total
from edutec..CursoProgramado cp
where IdCiclo like '2020%'
group by IdCurso;
go


select 
	IdCurso codigo,
	sum(case when RIGHT(IdCiclo,2) = '01' then cp.Matriculados else 0 end) [01],
	sum(case when RIGHT(IdCiclo,2) = '02' then cp.Matriculados else 0 end) [02],
	sum(case when RIGHT(IdCiclo,2) = '03' then cp.Matriculados else 0 end) [03],
	sum(case when RIGHT(IdCiclo,2) = '04' then cp.Matriculados else 0 end) [04],
	sum(case when RIGHT(IdCiclo,2) = '05' then cp.Matriculados else 0 end) [05],
	sum(case when RIGHT(IdCiclo,2) = '06' then cp.Matriculados else 0 end) [06],
	sum(case when RIGHT(IdCiclo,2) = '07' then cp.Matriculados else 0 end) [07],
	sum(case when RIGHT(IdCiclo,2) = '08' then cp.Matriculados else 0 end) [08],
	sum(case when RIGHT(IdCiclo,2) = '09' then cp.Matriculados else 0 end) [09],
	sum(case when RIGHT(IdCiclo,2) = '10' then cp.Matriculados else 0 end) [10],
	sum(case when RIGHT(IdCiclo,2) = '11' then cp.Matriculados else 0 end) [11],
	sum(case when RIGHT(IdCiclo,2) = '12' then cp.Matriculados else 0 end) [12],
	sum(Matriculados) Total
from edutec..CursoProgramado cp
where IdCiclo like '2020%'
group by IdCurso;
go


SELECT 
	IDCURSO CODIGO,
	SUM( IIF( RIGHT(IDCICLO,2) = '01', CP.MATRICULADOS, 0)) [01],
	SUM( IIF( RIGHT(IDCICLO,2) = '02', CP.MATRICULADOS, 0)) [02],
	SUM( IIF( RIGHT(IDCICLO,2) = '03', CP.MATRICULADOS, 0)) [03],
	SUM( IIF( RIGHT(IDCICLO,2) = '04', CP.MATRICULADOS, 0)) [04],
	SUM( IIF( RIGHT(IDCICLO,2) = '05', CP.MATRICULADOS, 0)) [05],
	SUM( IIF( RIGHT(IDCICLO,2) = '06', CP.MATRICULADOS, 0)) [06],
	SUM( IIF( RIGHT(IDCICLO,2) = '07', CP.MATRICULADOS, 0)) [07],
	SUM( IIF( RIGHT(IDCICLO,2) = '08', CP.MATRICULADOS, 0)) [08],
	SUM( IIF( RIGHT(IDCICLO,2) = '09', CP.MATRICULADOS, 0)) [09],
	SUM( IIF( RIGHT(IDCICLO,2) = '10', CP.MATRICULADOS, 0)) [10],
	SUM( IIF( RIGHT(IDCICLO,2) = '11', CP.MATRICULADOS, 0)) [11],
	SUM( IIF( RIGHT(IDCICLO,2) = '12', CP.MATRICULADOS, 0)) [12],
	SUM(MATRICULADOS) TOTAL
FROM EDUTEC..CURSOPROGRAMADO CP
WHERE IDCICLO LIKE '2020%'
GROUP BY IDCURSO;
GO