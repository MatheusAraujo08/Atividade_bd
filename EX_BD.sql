use exercicio_licensas;

select *from lcliente;



select count(*) from lcliente;
 
 
select *from llicenca where month(DtAquisicao)=11;


select *from llicenca where year(DtAquisicao)=2007 and month(DtAquisicao)=05;


select idTIPO_Empresa, DescricaoTipo, substr(DescricaoTipo, 1, 5) from ltipo_empresa order by DescricaoTipo asc;
 
 
select idTIPO_Empresa, DescricaoTipo, substr(DescricaoTipo, -5, 5) from ltipo_empresa order by DescricaoTipo desc;


select *, substr(DescricaoTipo, 6, 5) from ltipo_empresa;


select Nome_RazaoSocial, length(Nome_RazaoSocial) from lcliente order by Nome_RazaoSocial asc;


select NumLicenca, DtAquisicao, datediff(curdate(), DtAquisicao) from llicenca;


select UCASE(NomeSetor) from lsetor;
select LCASE(NomeSetor) from lsetor; 


select NomeSoftware, Versao from lsoftware s inner join lversao v on s.idSOFTWARE = v.idSOFTWARE_FK;
   
   
select c.Nome_RazaoSocial, DescricaoTipo, NomeSetor from lcliente c join ltipo_empresa t on c.idTIPO_Empresa_FK = t.idtipo_empresa join lsetor s on c.idSETOR_FK = s.idSETOR;


select idCliente as identificador, nome_razaosocial as nome,
numLicenca as 'licença', DtaAquisicao as data, ValorAquisecao as valor
from lcilente c join llicenca l on l.idCliente_FK = c.idCliente;


m) 


select nome_razaoSocial, descricaoTipo, nomeSetor, UF from Lcliente 
	join ltipo_empresa t on c.idtipo_Empresa_FK = t.idTIPO_Empresa
    join lsetor s on s.idCliente = c.idSetor
	where UF in ("SP", "RS", "PR", "MG");


select sw.NomeSoftware, v.Versao, c.nome_razaoSocial, tp.DescricaoTipo, st.NomeSetor, l.NumLicenca, l.DtAquisicao, l.ValorAquisicao 
   from lcliente c  
	join ltipo_empresa t on c.idTIpo_Empresa_FK = t.idTIpo_Empresa
	join lsetor st on idsetor = idCliente_FK
	join licenca l on c.idCLIENTE = l.idCLIENTE_FK
    join lversao v on versao = versao_FK
	join lsofware sw on v.idSoftware_FK = sw.idSOFTWARE
    order by sw.NomeSoftware, v.Versao, l.DtAquisicao, c.nome_razaoSocial;
    
    
select count(*) as 'Quantidade Vendidas' from llicenca;
select count(NumLicenca) as 'Quantidade Vendidas' from llicenca;
    
    
select sum(ValorAquisicao) valoTotal,
    avg(ValorAquisicao) mediaValores, min(ValorAquisicao), menoValor,
    max(ValorAquisicao) maiorValor from llicencas;
    
    
select count(idCLIENTE) from lcliente
	join lsetor on idSETOR_FK = idSETOR
	where nomeSetor = 'Farmacautica';
    
    
select c.Nome_RazaoSocial as nome from llicenca l
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    group by l.idCLIENTE_FK;
    
    
select c.Nome_RazaoSocial as nome,
    sum(l.ValorAquisicao) as 'Total Aquisições',
	avg(l.ValorAquisicao) as 'Media Aquisições'
    from llicenca l 
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    group by l.idCLIENTE_FK order by c.Nome_RazaoSocial asc;
    
    
select s.NomeSetor as setor,
    count(l.NumLicenca) as 'Total de licenças'
    from llicenca l 
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    join lsetor s on c.idSETOR_FK = s.idSETOR
    group by s.idSETOR order by s.idSETOR asc;
    
    
select t.Descricaotipo as 'tipo empresa',
    count(l.NumLicenca) as 'Total de licenças'
    from llicenca l 
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    join ltipo_empresa t on c.idTIPO_empresa_FK = t.idTIPO_empresa
    group by t.idTIPO_empresa order by t.Descricaotipo asc;
    
    
select count(l.NumLicenca) as 'Total de licenças',
	s.NomeSoftware, v.versao
    from llicenca l 
    join lversao v on l.versao_FK = v.versao
    join lsoftware s on v.idSOFTWARE_FK = s.idSOFTWARE
    group by v.versao,s.idSOFTWARE order by s.NomeSoftware, v.versao;
    
    
select c.Nome_RazaoSocial as nome,
    count(l.licenca) as 'Total Aquisições'
    from llicenca l 
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE
    group by c.Nome_RazaoSocial, s.idSOFTWARE order by c.Nome_RazaoSocial asc;
    
    
select c.Nome_RazaoSocial as nome,
    count(l.ValorAquisicao) as 'Total licenças'
    from llicenca l 
    join lcliente c on c.idcliente = l.idCLIENTE_FK
    group by l.idCLIENTE_FK
    having count(l.ValorAquisicao) > 10;
    
    
    
    
    
    