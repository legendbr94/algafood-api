CREATE SEQUENCE item_pedido_id_seq start 1 increment 1;
CREATE SEQUENCE pedido_id_seq start 1 increment 1;

CREATE TABLE pedido (
	id bigint not null, 
	data_cancelamento timestamp, 
	data_confirmacao timestamp, 
	data_criacao timestamp not null, 
	data_entrega timestamp, 
	endereco_bairro varchar(60), 
	endereco_cep varchar(9), 
	endereco_complemento varchar(60), 
	endereco_logradouro varchar(100), 
	endereco_numero varchar(20), 
	status varchar(10) not null, 
	subtotal numeric(19, 3), 
	taxa_frete numeric(19, 3), 
	valor_total numeric(19, 3), 
	usuario_cliente_id bigint not null, 
	endereco_cidade_id bigint, 
	forma_pagamento_id bigint not null, 
	restaurante_id bigint not null, 
	primary key (id),
	constraint fk_pedido_restaurante foreign key (restaurante_id) references restaurante(id),
	constraint fk_pedido_usuario_cliente foreign key (usuario_cliente_id) references usuario(id),
	constraint fk_pedido_forma_pagamento foreign key (forma_pagamento_id) references forma_pagamento(id),
	constraint fk_cidade foreign key (endereco_cidade_id) references cidade(id)
	);


CREATE TABLE item_pedido (
	id bigint not null, 
	observacao varchar(255), 
	preco_total numeric(19, 3), 
	preco_unitario numeric(19, 3), 
	quantidade int4, 
	pedido_id bigint not null, 
	produto_id bigint not null, 
	primary key (id),
	constraint uk_item_pedido_produto unique (pedido_id, produto_id),
	constraint fk_item_pedido_pedido foreign key (pedido_id) references pedido(id),
	constraint fk_item_pedido_produto foreign key (produto_id) references produto(id)
	);
	

