-- Criação do esquema
CREATE SCHEMA IF NOT EXISTS thomas_db;
USE thomas_db;

-- Tabela LINHA_FERROVIARIA
-- 'qtd_tremlinhas' renomeada para 'capacidade_max_trens' para maior clareza.
CREATE TABLE linha_ferroviaria (
    id_linha INT PRIMARY KEY AUTO_INCREMENT,
    nome_linha VARCHAR(255) NOT NULL,
    capacidade_max_trens INT COMMENT 'Número máximo de trens permitidos simultaneamente na linha'
);

-- Tabela ESTACAO
-- Campos padronizados e nome da capacidade mais específico.
CREATE TABLE estacao (
    id_estacao INT PRIMARY KEY AUTO_INCREMENT,
    nome_estacao VARCHAR(255) NOT NULL,
    capacidade_passageiros INT COMMENT 'Capacidade de passageiros que a estação suporta',
    tipo VARCHAR(50) COMMENT 'Ex: Principal, Carga, Intermediária'
);

-- Tabela MAQUINISTA
-- Nomes das colunas padronizados (snake_case) e simplificados.
CREATE TABLE maquinista (
    id_maquinista INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(14) UNIQUE NOT NULL, -- Uso de UNIQUE para garantir um CPF por maquinista
    nome VARCHAR(255) NOT NULL,
    tipo_trem_operado VARCHAR(100) COMMENT 'Tipo de trem que o maquinista está habilitado a operar'
);

-- Tabela TIPO_MANUTENCAO
-- Mantida, é a tabela de lookup para classificar a manutenção.
CREATE TABLE tipo_manutencao (
    id_tipo_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela TREM (Superclasse)
-- 'km' renomeado para 'quilometragem_atual'.
CREATE TABLE trem (
    num_chassi VARCHAR(50) PRIMARY KEY, -- Chave de negócio (Chassi)
    modelo VARCHAR(100),
    quilometragem_atual FLOAT,
    tipo_trem VARCHAR(50) NOT NULL,
    num_vagoes INT,
    fk_id_linha INT NOT NULL COMMENT 'Linha principal à qual o trem está designado',
    FOREIGN KEY (fk_id_linha) REFERENCES linha_ferroviaria(id_linha)
);

-- Tabela TREM_DE_CARGA (Especialização 1:1)
-- 'capacidade_kg' alterada para 'capacidade_toneladas'.
CREATE TABLE trem_de_carga (
    fk_num_chassi VARCHAR(50) PRIMARY KEY,
    capacidade_toneladas FLOAT NOT NULL,
    tipo_carga VARCHAR(100),
    FOREIGN KEY (fk_num_chassi) REFERENCES trem(num_chassi)
);

-- Tabela TREM_DE_PASSAGEIRO (Especialização 1:1)
CREATE TABLE trem_de_passageiro (
    fk_num_chassi VARCHAR(50) PRIMARY KEY,
    num_assentos INT NOT NULL,
    capacidade_total INT NOT NULL,
    FOREIGN KEY (fk_num_chassi) REFERENCES trem(num_chassi)
);

-- Tabela VIAGEM
-- Adição de origem e destino para representar a viagem de forma mais completa.
CREATE TABLE viagem (
    id_viagem INT PRIMARY KEY AUTO_INCREMENT,
    hora_partida DATETIME NOT NULL,
    hora_chegada DATETIME,
    status VARCHAR(50), -- Ex: 'Programada', 'Em Curso', 'Concluída', 'Cancelada'
    fk_id_linha INT NOT NULL,
    fk_num_chassi VARCHAR(50) NOT NULL,
    fk_id_maquinista INT NOT NULL,
    fk_id_estacao_origem INT NOT NULL,
    fk_id_estacao_destino INT NOT NULL,

    FOREIGN KEY (fk_id_linha) REFERENCES linha_ferroviaria(id_linha),
    FOREIGN KEY (fk_num_chassi) REFERENCES trem(num_chassi),
    FOREIGN KEY (fk_id_maquinista) REFERENCES maquinista(id_maquinista),
    FOREIGN KEY (fk_id_estacao_origem) REFERENCES estacao(id_estacao),
    FOREIGN KEY (fk_id_estacao_destino) REFERENCES estacao(id_estacao)
);

-- Tabela MANUTENCAO
-- Corrigido o relacionamento: A manutenção agora é associada ao TREM (num_chassi) e não à linha.
-- Adicionado 'custo_estimado' para informação financeira básica.
CREATE TABLE manutencao (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    data_manutencao DATE NOT NULL,
    custo_estimado DECIMAL(10, 2),
    local_manutencao VARCHAR(255) COMMENT 'Local/Oficina onde a manutenção foi realizada',
    fk_num_chassi VARCHAR(50) NOT NULL COMMENT 'Trem que recebeu a manutenção',

    FOREIGN KEY (fk_num_chassi) REFERENCES trem(num_chassi)
);

-- Tabela LINHA_ESTACAO (Relacionamento N:M entre LINHA_FERROVIARIA e ESTACAO)
-- Tabela de junção que define quais estações fazem parte de quais linhas.
CREATE TABLE linha_estacao (
    fk_id_linha INT NOT NULL,
    fk_id_estacao INT NOT NULL,
    ordem_na_linha INT COMMENT 'Ordem sequencial da estação dentro da linha',
    PRIMARY KEY (fk_id_linha, fk_id_estacao),
    FOREIGN KEY (fk_id_linha) REFERENCES linha_ferroviaria(id_linha),
    FOREIGN KEY (fk_id_estacao) REFERENCES estacao(id_estacao)
);

-- Tabela MANUTENCAO_TIPO (Relacionamento N:M entre MANUTENCAO e TIPO_MANUTENCAO)
-- Tabela de junção que permite que uma manutenção tenha múltiplos tipos (Ex: Elétrica e Preventiva).
CREATE TABLE manutencao_tipo (
    fk_id_manutencao INT NOT NULL,
    fk_id_tipo_manutencao INT NOT NULL,
    PRIMARY KEY (fk_id_manutencao, fk_id_tipo_manutencao),
    FOREIGN KEY (fk_id_manutencao) REFERENCES manutencao(id_manutencao),
    FOREIGN KEY (fk_id_tipo_manutencao) REFERENCES tipo_manutencao(id_tipo_manutencao)
);
