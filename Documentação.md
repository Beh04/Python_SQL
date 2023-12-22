# Python com T-SQL!
Projeto de ciência de dados para a modelagem de uma base de dados grande, retirada de um banco de dados relacional com consultas em T-SQL.

## Problema de negócio a ser solucionado

A empresa Contoso trata-se de uma gigante do varejo, e para otimizarmos suas operações de abastecimento e logística, vizando a redução de custos e a otimização da cadeia de suprimentos (Supply Chain), teremos que realizar um modelo preditivo da quantidade de vendas para o próximo ano (no caso 2010).

## Requesitos
Para esse projeto, utilizaremos o SQL Server Developer, uma versão totalmente gratuita para praticar:

[Baixar SQL Server Developer e SSMS (Interface do SQL Server)](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)

Utilizaremos também o **Python** juntamente com o **Jupyter Notebook**.

Por fim, para nossa base de dados, retiramos de uma empresa fictícia da Microsoft, onde podemos baixar o arquivo e recuperar dentro do nosso SQL Server após a instalação:

[Baixar o banco de dados Contoso](https://www.microsoft.com/en-us/download/details.aspx?id=18279)

## Entendimento dos dados e problema
Após recuperar o banco de dados para dentro do nosso SQL Server local, vamos começar o entendimento dos nossos dados.
Para esse entendimento, exploramos o nosso banco de dados, e para resolver esta problemática, teremos que selecionar os dados corretos.

Então, utilizaremos T-SQL para pegarmos somente o necessário ainda em nosso banco de dados:

[Código em T-SQL explicado](T-SQL/Base%20de%20dados.sql)

[Arquivo do diagrama do banco de dados](T-SQL/Diagrama.pdf)

No diagrama, temos as tabelas utilizadas para a formação da nossa nova base de dados e também é possível ver as colunas e dados que temos a disposição:

![arq](Img/tabelas_utilizadas.PNG)

### Estrutura dos Dados

Os dados são estruturados da seguinte forma:

- **agendamentos**: Uma lista de objetos, onde cada objeto representa um agendamento único e contém:
  - **pet**: Informações sobre o pet, incluindo:
    - `nome`: Nome do pet.
    - `informacoes`: Detalhes do pet, como espécie, raça, cor e gênero.
    - `peso`: Peso do pet em Kg.
  - **dono**: Informações sobre o dono do pet, incluindo:
    - `nome`: Nome do dono.
    - `endereco`: Endereço do dono.
    - `email`: E-mail do dono.
    - `telefone`: Telefone do dono.
  - **agendamento**: Detalhes do agendamento, incluindo:
    - `hora`: Hora do agendamento.
    - `data`: Data do agendamento.
    - `servico`: Tipo de serviço agendado (banho, tosa, banho&tosa)
