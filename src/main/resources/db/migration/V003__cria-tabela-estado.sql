CREATE SEQUENCE estado_id_seq start 1 increment 1;

CREATE TABLE estado (
    id bigint NOT NULL,
    nome varchar(80) NOT NULL,
    primary key (id)
);

ALTER TABLE cidade ADD COLUMN estado_id BIGINT NULL;

UPDATE cidade SET estado_id = e.id FROM (SELECT id, nome FROM estado) AS e WHERE e.nome = nome_estado;

ALTER TABLE cidade ALTER COLUMN estado_id SET NOT NULL;

ALTER TABLE cidade ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id);

ALTER TABLE cidade DROP COLUMN nome_estado;

ALTER TABLE cidade RENAME nome_cidade TO nome;


