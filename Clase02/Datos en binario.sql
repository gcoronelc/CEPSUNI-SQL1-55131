

declare @dato varbinary(30);
set @dato = cast( 'Gustavo' as varbinary );
print @dato;
go


create table algo(
dato varbinary(100)
);

insert into algo(dato) values(cast( 'Gustavo' as varbinary ));
go


select cast(dato as varchar) from algo;
go


