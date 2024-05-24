# Projeto de Coleta e Armazenamento de Dados

Este projeto trata-se de um estudo de caso em que, como arquiteto de Big Data, devemos utilizar o banco de Dados `MySQL` para armazenar e gerencias os dados de uma coleta sobre licenças medicas.
Os dados das pesquisas encontram-se de distribuídos de forma difusa em vários documentos no formato .csv, logo, ler e tratar estes dados fara parte do trabalho.

Para isso sera criado um Banco de dados relacional de acordo com o diagrama abaixo.

![alt text](coleta_armazenamento_dados_licenca_medica/Diagrama_model4.png)

## Ferramentas Utilizadas

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Plotly](https://img.shields.io/badge/plotly-150458?style=for-the-badge&logo=plotly&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Poetry](https://img.shields.io/badge/poetry-60A5FA?style=for-the-badge&logo=poetry&logoColor=white)
![Jupyter](https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white)

## Como

Este projeto foi dividido basicamente em quatro partes, das quais descrevo abaixo:

1 - Criação do Banco de Dados;
2 - Coleta e Inserção dos Dados no DB;
3 - Analise e Tratamento dos Dados;
4 - Visualização e Consulta dos Dados.

### Criar Esquema do Banco Relacional

Para isso existem diversas ferramentas que podem auxiliar disponíveis no mercado, pagas e gratuitas. Independente da escolhida, o resultado final são linhas de código sql.

O esquema é essencial para a criação das tabelas e das relações entre as chaves. Aqui foi utilizado o [MySQL Workbench](https://www.mysql.com/products/workbench/).

Como resultado, foi produzido o arquivo chamado `Diagrama_db.sql` que vai conter um código contendo toda nossa estrutura. O código é puro SQL. Fique livre para abrir o arquivo e entender melhor.

### Criar Banco de Dados

#### Usando MySQL Workbench

No próprio [MySQL Workbench](https://www.mysql.com/products/workbench/) é possível criar um banco de dados e disponibiliza-lo no endereço local.

Criamos um banco de dados e um usuário com as seguintes informações:

```json
'user':'db_med',
'password': 'db_med',
'host': '127.0.0.1', #padrao
'database' : 'db_med'
```

Criado o Banco de Dados, utilize o arquivo `Diagrama_db.sql` para criar as tabelas e as relações entre elas.

Caso tenha dificuldade com essa parte, [GoogleIt](https://www.google.com/).

### Coleta e Limpeza de Dados

Os dados estão dispostos na pasta `src/processamento_licencas_medicas` e estão no formato `.csv`.
Estes arquivos serão lidos e transformados em um DF.
O processo de coleta e limpeza dos dados foi feito utilizando o [Pandas](https://pandas.pydata.org/).
O processo pode ser verificado no arquivo `` deste repositório. 




## Clonando Repositório

```bash
git clone 
```

## Dependências

Existem algumas dependências necessárias para rodar o projeto, e vamos resolver isso facilmente com a instalação do poetry. Poetry é uma ferramenta interessante e recomendo conhece-la caso não tenha familiaridade.

```bash
pip install poetry
```

Acesse a pasta onde o repositório foi clonado. Estando na mesma pasta em que os arquivos `poetry.lock e pyproject.toml` execute o comando:

```bash
poetry install
```

Pronto, ambiente virtual criado e dependências instaladas.

#### Usando Docker


`Posteriormente exclicarei como vazer isso com um banco de dados rodando do docker para que a reproducao desse projeto na maquina local fique mais facil`