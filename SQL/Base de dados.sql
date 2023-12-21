create or alter view vw_base_previsao
as 
select top (200000)
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
from FactSales as FS inner join	
					DimChannel as DC on FS.channelKey = DC.ChannelKey
					inner join DimProduct as DP on FS.ProductKey = DP.ProductKey
					inner join DimProductSubcategory as DPS on DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
					inner join DimProductCategory as DPC on DPS.ProductCategoryKey = DPC.ProductCategoryKey
					inner join DimDate as DT on FS.DateKey = DT.Datekey
order by [ID da Venda]

go

select * from vw_base_previsao