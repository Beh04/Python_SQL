use ContosoRetailDW -- Utilizar o database correto

go

create or alter view vw_base_previsao -- Quando formos conectar no Jupyter Notebook no python, iremos puxar pela view
as 
select top (200000) -- Nossa tabela de vendas possui 3 milhões de linhas, vamos pegar só 200 mil neste projeto (haja processamento...)
	FS.SalesKey as 'ID da Venda'
	,format(DT.Datekey,'dd/MM/yyyy') as 'Data da Venda'
	,DT.CalendarYear as 'Ano'
	,DT.CalendarMonthLabel as 'Mês'
	,DP.ProductKey as 'ID do Produto'
	,DP.ProductName as 'Nome do Produto'
	,DC.ChannelName as 'Nome do Canal'
	,DPC.ProductCategoryName as 'Nome da Categoria'
	,DPS.ProductSubcategoryName as 'Nome da Subcategoria'
	,FS.UnitPrice as 'Preço Unitário'
	,FS.SalesQuantity as 'Qtd. Vendida'
	,FS.UnitPrice * FS.SalesQuantity as 'Faturamento'
/*Nesta parte vamos realizar nossos joins com nossas tabelas dimensões para trazermos informações importante para nossa nova base
que será formada e armezenada na view*/
from FactSales as FS inner join	
	DimChannel as DC on FS.channelKey = DC.ChannelKey -- Tabela de Canais de venda
	inner join DimProduct as DP on FS.ProductKey = DP.ProductKey -- Tabela de produtos
	inner join DimProductSubcategory as DPS on DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey -- Tabela de Subcategoria dos produtos
	inner join DimProductCategory as DPC on DPS.ProductCategoryKey = DPC.ProductCategoryKey -- Tabela de Categoria dos produtos
	inner join DimDate as DT on FS.DateKey = DT.Datekey -- Tabela de Datas
order by [ID da Venda]

go

select * from vw_base_previsao -- É essa visão que vamos puxar na conexão do nosso Jupyter Notebook com o SQL Server e será nossa nova base