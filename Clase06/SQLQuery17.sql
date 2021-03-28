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