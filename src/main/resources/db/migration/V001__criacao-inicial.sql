CREATE SEQUENCE cozinha_id_seq start 1 increment 1;

CREATE TABLE cozinha (
    id bigint not null,
    nome varchar(60),
    primary key (id)
);