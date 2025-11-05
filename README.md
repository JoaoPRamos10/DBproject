# DBproject
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/JoaoPRamos10/DBproject)

## Equipe
Caio Porto, Eduarda Carolline, João Augusto, João Pedro Prosini e Rhauan Rafael

## Tema
**Sistema de Linhas Ferroviárias**

## Explicação do Projeto
Este projeto tem como objetivo modelar um banco de dados para gerenciar informações relacionadas a linhas ferroviárias, estações, trens, maquinistas e seus respectivos relacionamentos. A estrutura do banco de dados busca atender às necessidades de controle e operação de uma rede ferroviária, garantindo uma organização eficiente das informações.

## Funcionalidades
*   **Cadastro de Linhas Ferroviárias:** Armazenamento de informações como nome, tipo de transporte (carga, passageiros, misto) e distância.
*   **Cadastro de Estações:** Informações como nome, localização, capacidade de atendimento e serviços oferecidos.
*   **Cadastro de Trens:** Dados como modelo, capacidade, ano de fabricação e tipo de serviço.
*   **Cadastro de Maquinistas:** Controle dos maquinistas responsáveis por diferentes linhas ferroviárias.
*   **Relacionamento entre Entidades:** Conexões entre linhas, estações, trens e maquinistas.
*   **Atributos Multivalorados:** Tipos de serviços nas estações e nos trens.
*   **Generalização e Especialização:** Subtipos de trens como Trem de Passageiro e Trem de Carga.

## Estrutura do Banco de Dados
### Entidades Principais
*   Linha Ferroviária
*   Estação
*   Trem
*   Maquinista
*   Manutenção
*   Tipo de Manutenção

### Entidades Secundarias
*   Trem de Carga
*   Trem de Passageiro

### Relacionamentos
*   Uma linha ferroviária pode passar por várias estações.
*   Uma linha ferroviária pode ter vários trens.
*   Uma estação pode oferecer vários serviços.
*   Um maquinista pode ser responsável por uma ou mais linhas ferroviárias.

### Generalização/Especialização
A entidade Trem pode ser especializada em Trem de Passageiro e Trem de Carga.

## Modelo de Dados
* **Linha Ferroviária:** id_linha (PK), nome_linha, qtd_tremlinha
* **Estação:** id_estacao (PK), nome_estacao, capacidade_estacao, tipo_estacao
* **Manutenção:** id_manutenção (PK), data
* **Maquinista:** maquinista_id (PK), maquinista_cpf, maquinista_nome, tipo_operado
* **Trem (Generalização):** num_chassi (PK), Modelo, km, tipo_trem, num_vagoes
* **Trem de Carga (Especialização):** (Herda de Trem) capacidade_kg, tipo_carga
* **Trem de Passageiro (Especialização):** (Herda de Trem) num_assentos, capacidade_total

## Modelo Conceitual (DER)
![Diagrama Entidade-Relacionamento do Sistema de Linhas Ferroviárias](modelo_conceitual.png)

## Modelo Lógico (Esquema Relacional)

Abaixo está a definição das tabelas, com suas colunas, chaves primárias (PK) e chaves estrangeiras (FK).

### Tabela: `LINHA_FERROVIARIA`
Esta tabela armazena as informações centrais de cada linha.
* `id_linha` (PK, Inteiro, NOT NULL)
* `nome_linha` (Texto)
* `qtd_tremlinhas` (Inteiro)

### Tabela: `ESTACAO`
Armazena todas as estações que podem fazer parte de uma ou mais linhas.
* `id_estacao` (PK, Inteiro, NOT NULL)
* `nome_estacao` (Texto)
* `capacidade_estacao` (Inteiro)
* `tipo_estacao` (Texto)

### Tabela: `MAQUINISTA`
Armazena os dados dos operadores/maquinistas.
* `maquinista_id` (PK, Inteiro, NOT NULL)
* `maquinista_cpf` (Texto, UNIQUE, NOT NULL)
* `maquinista_nome` (Texto)
* `tipo_operado` (Texto)

### Tabela: `MANUTENCAO`
Registra cada evento de manutenção. Cada manutenção está ligada a *exatamente uma* linha, conforme o relacionamento (1,1) `TEM`.
* `id_manutencao` (PK, Inteiro, NOT NULL)
* `data` (Data)
* `fk_id_linha` (FK, Inteiro, NOT NULL) - *Referencia `LINHA_FERROVIARIA(id_linha)`*

### Tabela: `TIPO_MANUTENCAO`
Tabela de "lookup" para os tipos de manutenção (ex: "Preventiva", "Corretiva"). O DER a define como uma entidade.
* `id_tipo_manutencao` (PK, Inteiro, NOT NULL)
* `nome_tipo` (Texto, NOT NULL)
* `descricao` (Texto)

### Tabela: `TREM` (Superclasse)
Tabela central para a generalização. Armazena os atributos comuns a *todos* os tipos de trem.
* `num_chassi` (PK, Texto, NOT NULL)
* `modelo` (Texto)
* `km` (Decimal/Float)
* `tipo_trem` (Texto) - *Pode ser usado como "discriminador" (Carga/Passageiro)*
* `num_vagoes` (Inteiro)
* `fk_id_linha` (FK, Inteiro, NOT NULL) - *Relacionamento (1,1) `POSSUEM`*
* `fk_maquinista_id` (FK, Inteiro, NULL) - *Relacionamento (0,1) `OPERA` (um trem pode não ter um maquinista associado no momento)*

### Tabela: `TREM_DE_CARGA` (Subclasse)
Armazena atributos *específicos* de trens de carga.
* `fk_num_chassi` (PK, FK, Texto, NOT NULL) - *É ao mesmo tempo PK e FK, referenciando `TREM(num_chassi)`*
* `capacidade_kg` (Decimal/Float)
* `tipo_carga` (Texto)

### Tabela: `TREM_DE_PASSAGEIRO` (Subclasse)
Armazena atributos *específicos* de trens de passageiros.
* `fk_num_chassi` (PK, FK, Texto, NOT NULL) - *É ao mesmo tempo PK e FK, referenciando `TREM(num_chassi)`*
* `num_assentos` (Inteiro)
* `capacidade_total` (Inteiro)

---
## Tabelas Associativas (Relacionamentos N:M)

Estas tabelas são criadas para resolver os relacionamentos "Muitos-para-Muitos" (N:M).

### Tabela: `LINHA_ESTACAO`
Resolve o relacionamento N:M `PERTENCE` entre `LINHA_FERROVIARIA` e `ESTACAO`.
* `fk_id_linha` (PK, FK, Inteiro, NOT NULL) - *Referencia `LINHA_FERROVIARIA(id_linha)`*
* `fk_id_estacao` (PK, FK, Inteiro, NOT NULL) - *Referencia `ESTACAO(id_estacao)`*
* *(Chave primária composta: `(fk_id_linha, fk_id_estacao)`)*

### Tabela: `MANUTENCAO_TIPO`
Resolve o relacionamento N:M `AFIM DE` entre `MANUTENCAO` e `TIPO_MANUTENCAO`.
* `fk_id_manutencao` (PK, FK, Inteiro, NOT NULL) - *Referencia `MANUTENCAO(id_manutencao)`*
* `fk_id_tipo_manutencao` (PK, FK, Inteiro, NOT NULL) - *Referencia `TIPO_MANUTENCAO(id_tipo_manutencao)`*
* *(Chave primária composta: `(fk_id_manutencao, fk_id_tipo_manutencao)`)*

---

## Tecnologias Utilizadas
*   **SGBD:** MySQL, PostgreSQL ou outro SGBD relacional
*   **Ferramentas de Modelagem:** Diagramas Entidade-Relacionamento (DER)
*   **SQL:** Para criação e manipulação de tabelas
