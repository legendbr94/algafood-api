CREATE TABLE foto_produto (
  produto_id bigint not null,
  nome_arquivo character varying(150) not null,
  descricao character varying(150),
  content_type character varying(80) not null,
  tamanho  bigint not null,

  primary key (produto_id),
  constraint fk_foto_produto_produto foreign key (produto_id) references produto (id)
);