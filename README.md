# DBproject
Equipe: Caio Porto, Eduarda Carolline, João Augusto, João Pedro Prosini e Rhauan Rafael

Tema: Sistema de Linhas Ferroviárias

Explicação do Projeto: Este projeto tem como objetivo modelar um banco de dados para gerenciar informações relacionadas a linhas ferroviárias, estações, trens, operadores e seus respectivos relacionamentos. A estrutura do banco de dados busca atender às necessidades de controle e operação de uma rede ferroviária, garantindo uma organização eficiente das informações.

Funcionalidades

Cadastro de Linhas Ferroviárias: Armazenamento de informações sobre diferentes linhas ferroviárias, como nome, tipo de transporte (carga, passageiros, misto) e distância.

Cadastro de Estações: Informações sobre as estações ferroviárias, como nome, localização, capacidade de atendimento e serviços oferecidos.

Cadastro de Trens: Armazenamento de dados sobre trens, como modelo, capacidade, ano de fabricação e tipo de serviço (passageiro, carga).

Cadastro de Operadores: Controle dos operadores responsáveis por diferentes linhas ferroviárias e seus respectivos serviços.

Relacionamento entre Entidades: Definição de como as entidades se conectam (ex: uma linha pode ter várias estações, um trem pode operar em várias linhas, etc.).

Atributos Multivalorados: Para dados que podem ter múltiplos valores, como tipos de serviços nas estações e tipos de serviço dos trens.

Generalização e Especialização: Modelagem de subtipos de trens, como Trem de Passageiro e Trem de Carga, que herdam atributos da entidade genérica Trem.

Estrutura do Banco de Dados

Entidades principais:

Linha Ferroviária

Estação

Trem

Operador

Relacionamentos:

Uma linha ferroviária pode passar por várias estações.

Uma linha ferroviária pode ter vários trens.

Uma estação pode oferecer vários serviços.

Um operador pode ser responsável por uma ou mais linhas ferroviárias.

Generalização/Especialização:

A entidade Trem pode ser especializada em Trem de Passageiro e Trem de Carga.

Modelo de Dados

O modelo de dados foi projetado para refletir os requisitos de uma rede ferroviária real, utilizando o conceito de entidades e relacionamentos. Abaixo estão algumas das principais entidades e seus atributos:

Linha Ferroviária: ID_Linha, Nome, Distância, Tipo de Transporte

Estação: ID_Estação, Nome, Localização, Capacidade

Trem: ID_Trem, Modelo, Capacidade, Ano de Fabricação

Operador: ID_Operador, Nome, Tipo de Operação

Tecnologias Utilizadas

Sistema de gerenciamento de banco de dados (SGBD): MySQL, PostgreSQL ou outro SGBD relacional

Ferramentas de modelagem: Diagramas Entidade-Relacionamento (DER)

SQL para criação e manipulação de tabelas
--------------------------------------------------
