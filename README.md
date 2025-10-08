<body>
  <h1>DBproject</h1>

  <h2>Equipe</h2>
  <p>Caio Porto, Eduarda Carolline, João Augusto, João Pedro Prosini e Rhauan Rafael</p>

  <h2>Tema</h2>
  <p><strong>Sistema de Linhas Ferroviárias</strong></p>

  <h2>Explicação do Projeto</h2>
  <p>
    Este projeto tem como objetivo modelar um banco de dados para gerenciar informações relacionadas a linhas ferroviárias, estações, trens, operadores e seus respectivos relacionamentos. A estrutura do banco de dados busca atender às necessidades de controle e operação de uma rede ferroviária, garantindo uma organização eficiente das informações.
  </p>

  <h2>Funcionalidades</h2>
  <ul>
    <li><strong>Cadastro de Linhas Ferroviárias:</strong> Armazenamento de informações como nome, tipo de transporte (carga, passageiros, misto) e distância.</li>
    <li><strong>Cadastro de Estações:</strong> Informações como nome, localização, capacidade de atendimento e serviços oferecidos.</li>
    <li><strong>Cadastro de Trens:</strong> Dados como modelo, capacidade, ano de fabricação e tipo de serviço.</li>
    <li><strong>Cadastro de Operadores:</strong> Controle dos operadores responsáveis por diferentes linhas ferroviárias.</li>
    <li><strong>Relacionamento entre Entidades:</strong> Conexões entre linhas, estações, trens e operadores.</li>
    <li><strong>Atributos Multivalorados:</strong> Tipos de serviços nas estações e nos trens.</li>
    <li><strong>Generalização e Especialização:</strong> Subtipos de trens como Trem de Passageiro e Trem de Carga.</li>
  </ul>

  <h2>Estrutura do Banco de Dados</h2>
  <h3>Entidades Principais</h3>
  <ul>
    <li>Linha Ferroviária</li>
    <li>Estação</li>
    <li>Trem</li>
    <li>Operador</li>
  </ul>

  <h3>Relacionamentos</h3>
  <ul>
    <li>Uma linha ferroviária pode passar por várias estações.</li>
    <li>Uma linha ferroviária pode ter vários trens.</li>
    <li>Uma estação pode oferecer vários serviços.</li>
    <li>Um operador pode ser responsável por uma ou mais linhas ferroviárias.</li>
  </ul>

  <h3>Generalização/Especialização</h3>
  <p>A entidade Trem pode ser especializada em Trem de Passageiro e Trem de Carga.</p>

  <h2>Modelo de Dados</h2>
  <ul>
    <li><strong>Linha Ferroviária:</strong> ID_Linha, Nome, Distância, Tipo de Transporte</li>
    <li><strong>Estação:</strong> ID_Estação, Nome, Localização, Capacidade</li>
    <li><strong>Trem:</strong> ID_Trem, Modelo, Capacidade, Ano de Fabricação</li>
    <li><strong>Operador:</strong> ID_Operador, Nome, Tipo de Operação</li>
  </ul>

  <h2>Tecnologias Utilizadas</h2>
  <ul>
    <li><strong>SGBD:</strong> MySQL, PostgreSQL ou outro SGBD relacional</li>
    <li><strong>Ferramentas de Modelagem:</strong> Diagramas Entidade-Relacionamento (DER)</li>
    <li><strong>SQL:</strong> Para criação e manipulação de tabelas</li>
  </ul>
</body>
