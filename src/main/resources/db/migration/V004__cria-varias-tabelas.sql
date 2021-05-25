CREATE SEQUENCE forma_pagamento_id_seq start 1 increment 1;
CREATE SEQUENCE grupo_id_seq start 1 increment 1;
CREATE SEQUENCE permissao_id_seq start 1 increment 1;
CREATE SEQUENCE produto_id_seq start 1 increment 1;
CREATE SEQUENCE restaurante_id_seq start 1 increment 1;
CREATE SEQUENCE usuario_id_seq start 1 increment 1;

CREATE TABLE forma_pagamento (id bigint not null, descricao varchar(60) not null, data_atualizacao timestamp not null, primary key (id));
CREATE TABLE grupo (id bigint not null, nome varchar(60) not null, primary key (id));
CREATE TABLE grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id));
CREATE TABLE permissao (id bigint not null, descricao varchar(60) not null, nome varchar(100) not null, primary key (id));
CREATE TABLE produto (id bigint not null, ativo boolean not null, descricao TEXT not null, nome varchar(80) not null, preco numeric(19, 2) not null, restaurante_id bigint not null, primary key (id));
CREATE TABLE restaurante (id bigint not null, data_atualizacao timestamp not null, data_cadastro timestamp not null, endereco_bairro varchar(60), endereco_cep varchar(9), endereco_complemento varchar(60), endereco_logradouro varchar(100), endereco_numero varchar(20), nome varchar(80) not null, taxa_frete numeric(19, 2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id));
CREATE TABLE restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null, primary key (restaurante_id, forma_pagamento_id));
CREATE TABLE usuario (id bigint not null, data_cadastro timestamp not null, email varchar(255) not null, nome varchar(80) not null, senha varchar(255) not null, primary key (id));
CREATE TABLE usuario_grupo (usuario_id bigint not null, grupo_id bigint not null, primary key (usuario_id, grupo_id));

ALTER TABLE grupo_permissao add constraint fk_grupo_permissao_permissao foreign key (permissao_id) references permissao;
ALTER TABLE grupo_permissao add constraint fk_grupo_permissao_grupo foreign key (grupo_id) references grupo;
ALTER TABLE produto add constraint fk_produto_restaurante foreign key (restaurante_id) references restaurante;

ALTER TABLE restaurante add constraint fk_restaurante_cozinha foreign key (cozinha_id) references cozinha;
ALTER TABLE restaurante add constraint fk_restaurante_cidade foreign key (endereco_cidade_id) references cidade;

ALTER TABLE restaurante_forma_pagamento add constraint fk_rest_forma_pagto_forma_pagto foreign key (forma_pagamento_id) references forma_pagamento;
ALTER TABLE restaurante_forma_pagamento add constraint fk_rest_forma_pagto_restaurante foreign key (restaurante_id) references restaurante;
ALTER TABLE usuario_grupo add constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo;
ALTER TABLE usuario_grupo add constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario;
