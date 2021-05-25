DELETE FROM grupo_permissao;
DELETE FROM usuario_grupo;
DELETE FROM grupo;
DELETE FROM permissao;
DELETE FROM restaurante_usuario_responsavel;
DELETE FROM item_pedido;
DELETE FROM pedido;
DELETE FROM usuario;
TRUNCATE produto CASCADE;
DELETE FROM restaurante_forma_pagamento;
DELETE FROM forma_pagamento;
DELETE FROM restaurante;
DELETE FROM cozinha;
DELETE FROM cidade;
DELETE FROM estado;
TRUNCATE foto_produto CASCADE;
DELETE FROM oauth_client_details;

ALTER SEQUENCE cozinha_id_seq RESTART WITH 1;
ALTER SEQUENCE cidade_id_seq RESTART WITH 1;
ALTER SEQUENCE estado_id_seq RESTART WITH 1;
ALTER SEQUENCE forma_pagamento_id_seq RESTART WITH 1;
ALTER SEQUENCE grupo_id_seq RESTART WITH 1;
ALTER SEQUENCE item_pedido_id_seq RESTART WITH  1;
ALTER SEQUENCE pedido_id_seq RESTART WITH  1;
ALTER SEQUENCE permissao_id_seq RESTART WITH 1;
ALTER SEQUENCE produto_id_seq RESTART WITH 1;
ALTER SEQUENCE restaurante_id_seq RESTART WITH 1;
ALTER SEQUENCE usuario_id_seq RESTART WITH 1;




INSERT INTO cozinha (id, nome) values (nextval('cozinha_id_seq'), 'Tailandesa');
INSERT INTO cozinha (id, nome) values (nextval('cozinha_id_seq'), 'Indiana');
INSERT INTO cozinha (id, nome) values (nextval('cozinha_id_seq'), 'Argentina');
INSERT INTO cozinha (id, nome) values (nextval('cozinha_id_seq'), 'Brasileira');

INSERT INTO estado (id, nome) values (nextval('estado_id_seq'), 'Minas Gerais');
INSERT INTO estado (id, nome) values (nextval('estado_id_seq'), 'São Paulo');
INSERT INTO estado (id, nome) values (nextval('estado_id_seq'), 'Ceará');
INSERT INTO estado (id, nome) values (nextval('estado_id_seq'), 'Bahia');

INSERT INTO cidade (id, nome, estado_id) values (nextval('cidade_id_seq'), 'Uberlândia', 1);
INSERT INTO cidade (id, nome, estado_id) values (nextval('cidade_id_seq'), 'Belo Horizonte', 1);
INSERT INTO cidade (id, nome, estado_id) values (nextval('cidade_id_seq'), 'São Paulo', 2);
INSERT INTO cidade (id, nome, estado_id) values (nextval('cidade_id_seq'), 'Campinas', 2);
INSERT INTO cidade (id, nome, estado_id) values (nextval('cidade_id_seq'), 'Fortaleza', 3);

INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro) values (nextval('restaurante_id_seq'), 'Thai Gourmet', 10, 1, timezone('UTC', now()), timezone('UTC', now()), true, true, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro');
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('restaurante_id_seq'), 'Thai Delivery', 9.50, 1, timezone('UTC', now()), timezone('UTC', now()), true, true);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('restaurante_id_seq'), 'Tuk Tuk Comida Indiana', 15, 2, timezone('UTC', now()), timezone('UTC', now()), true, true);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('restaurante_id_seq'), 'Java Steakhouse', 12, 3, timezone('UTC', now()), timezone('UTC', now()), true, true);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('restaurante_id_seq'), 'Lanchonete do Tio Sam', 11, 4, timezone('UTC', now()), timezone('UTC', now()), true, true);
INSERT INTO restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao, ativo, aberto) values (nextval('restaurante_id_seq'), 'Bar da Maria', 6, 4, timezone('UTC', now()), timezone('UTC', now()), true, true);

INSERT INTO forma_pagamento (id, descricao, data_atualizacao) values (nextval('forma_pagamento_id_seq'), 'Cartão de crédito', timezone('UTC', now()));
INSERT INTO forma_pagamento (id, descricao, data_atualizacao) values (nextval('forma_pagamento_id_seq'), 'Cartão de débito', timezone('UTC', now()));
INSERT INTO forma_pagamento (id, descricao, data_atualizacao) values (nextval('forma_pagamento_id_seq'), 'Dinheiro', timezone('UTC', now()));

INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_COZINHAS', 'Permite editar cozinhas');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_FORMAS_PAGAMENTO', 'Permite criar ou editar formas de pagamento');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_CIDADES', 'Permite criar ou editar cidades');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_ESTADOS', 'Permite criar ou editar estados');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'CONSULTAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite consultar usuários');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_USUARIOS_GRUPOS_PERMISSOES', 'Permite criar ou editar usuários');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'EDITAR_RESTAURANTES', 'Permite criar, editar ou gerenciar restaurantes');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'CONSULTAR_PEDIDOS', 'Permite consultar pedidos');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'GERENCIAR_PEDIDOS', 'Permite gerenciar pedidos');
INSERT INTO permissao (id, nome, descricao) values (nextval('permissao_id_seq'), 'GERAR_RELATORIOS', 'Permite gerar relatórios');

INSERT INTO restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (3, 2), (3, 3);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, false, 1);
INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Camarão tailandês', '16 camarões grandes ao molho picante', 110, true, 1);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, true, 2);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, true, 3);
INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, true, 3);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, true, 4);
INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, true, 4);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, true, 5);

INSERT INTO produto (id, nome, descricao, preco, ativo, restaurante_id) values (nextval('produto_id_seq'), 'Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, true, 6);

INSERT INTO grupo (id, nome) values (nextval('grupo_id_seq'), 'Gerente');
INSERT INTO grupo (id, nome) values (nextval('grupo_id_seq'), 'Vendedor');
INSERT INTO grupo (id, nome) values (nextval('grupo_id_seq'), 'Secretária');
INSERT INTO grupo (id, nome) values (nextval('grupo_id_seq'), 'Cadastrador');

-- Adiciona todas as permissoes no grupo do gerente
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 1, id FROM permissao;

-- Adiciona permissoes no grupo do vendedor
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 2, id FROM permissao where nome like 'CONSULTAR_%';

INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 2, id FROM permissao where nome = 'EDITAR_RESTAURANTES';

-- Adiciona permissoes no grupo do auxiliar
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 3, id FROM permissao where nome like 'CONSULTAR_%';

-- Adiciona permissoes no grupo cadastrador
INSERT INTO grupo_permissao (grupo_id, permissao_id)
SELECT 4, id FROM permissao where nome like '%_RESTAURANTES';





INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'João da Silva', 'joao.ger@algafood.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'Maria Joaquina', 'maria.vnd@algafood.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'José Souza', 'jose.aux@algafood.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'Sebastião Martins', 'sebastiao.cad@algafood.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'Manoel Lima', 'abrantestacio@gmail.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'Débora Mendonça', 'sandroabrantes@gmail.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));
INSERT INTO usuario (id, nome, email, senha, data_cadastro) values (nextval('usuario_id_seq'), 'Carlos Lima', 'abrantesthales@gmail.com', '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa', timezone('UTC', now()));


INSERT INTO usuario_grupo (usuario_id, grupo_id) values (1, 1), (1, 2), (2, 2), (3, 3), (4, 4);

INSERT INTO restaurante_usuario_responsavel (restaurante_id, usuario_id) values (1, 5), (3, 5);


INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, 
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, subtotal, taxa_frete, valor_total)
values (nextval('pedido_id_seq'), 'f9981ca4-5a5e-4da3-af04-933861df3e55', 1, 6, 1, 1, '38400-000', 'Rua Floriano Peixoto', '500', 'Apto 801', 'Brasil',
        'CRIADO', timezone('UTC', now()), 298.90, 10, 308.90);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 1, 1, 1, 78.9, 78.9, null);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 1, 2, 2, 110, 220, 'Menos picante, por favor');


INSERT INTO pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, 
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, subtotal, taxa_frete, valor_total)
values (nextval('pedido_id_seq'), 'd178b637-a785-4768-a3cb-aa1ce5a8cdab', 4, 6, 2, 1, '38400-111', 'Rua Acre', '300', 'Casa 2', 'Centro',
        'CRIADO', timezone('UTC', now()), 79, 0, 79);

INSERT INTO item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 2, 6, 1, 79, 79, 'Ao ponto');





insert into pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, 
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values (nextval('pedido_id_seq'), 'b5741512-8fbc-47fa-9ac1-b530354fc0ff', 1, 7, 1, 1, '38400-222', 'Rua Natal', '200', null, 'Brasil',
        'ENTREGUE', '2019-10-30 21:10:00', '2019-10-30 21:10:45', '2019-10-30 21:55:44', 110, 10, 120);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 3, 2, 1, 110, 110, null);


insert into pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, 
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values (nextval('pedido_id_seq'), '5c621c9a-ba61-4454-8631-8aabefe58dc2', 1, 7, 1, 1, '38400-800', 'Rua Fortaleza', '900', 'Apto 504', 'Centro',
        'ENTREGUE', '2019-11-02 20:34:04', '2019-11-02 20:35:10', '2019-11-02 21:10:32', 174.4, 5, 179.4);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 4, 3, 2, 87.2, 174.4, null);


insert into pedido (id, codigo, restaurante_id, usuario_cliente_id, forma_pagamento_id, endereco_cidade_id, endereco_cep, 
                    endereco_logradouro, endereco_numero, endereco_complemento, endereco_bairro,
	                status, data_criacao, data_confirmacao, data_entrega, subtotal, taxa_frete, valor_total)
values (nextval('pedido_id_seq'), '8d774bcf-b238-42f3-aef1-5fb388754d63', 1, 3, 2, 1, '38400-200', 'Rua 10', '930', 'Casa 20', 'Martins',
        'ENTREGUE', '2019-11-02 21:00:30', '2019-11-02 21:01:21', '2019-11-02 21:20:10', 87.2, 10, 97.2);

insert into item_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, preco_total, observacao)
values (nextval('item_pedido_id_seq'), 5, 3, 1, 87.2, 87.2, null);


insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
--PASSWORDS: 123
values (
  'angular-client', null, '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa',
  'READ,WRITE', 'password', null, null,
  60 * 60 * 6, 60 * 24 * 60 * 60, null
);

insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'foodanalytics', null, '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa',
  'READ,WRITE', 'authorization_code', 'http://www.foodanalytics.local:8082', null,
  null, null, null
);

insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'faturamento', null, '$2y$12$1MFOEq.fekFH/mX6cP2Zqeq1BxMPgoz0sa2DN.5hCZoKl3Sw12FHa',
  'READ,WRITE', 'client_credentials', null, 'CONSULTAR_PEDIDOS,GERAR_RELATORIOS',
  null, null, null
);

