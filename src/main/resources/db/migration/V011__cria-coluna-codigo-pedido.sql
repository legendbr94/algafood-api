ALTER TABLE pedido add codigo character varying(36) not null;
UPDATE pedido set codigo = uuid_in(md5(random()::text || clock_timestamp()::text)::cstring);
ALTER TABLE pedido add constraint uk_pedido_codigo unique (codigo);
