CREATE SEQUENCE cidade_id_seq start 1 increment 1;

CREATE TABLE cidade (
    id bigint not null,
    nome_cidade varchar(80) not null,
    nome_estado varchar(80) not null,
    primary key (id)
);
