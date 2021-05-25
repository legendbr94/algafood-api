CREATE SEQUENCE oauth_client_details_id_seq start 1 increment 1;

CREATE TABLE oauth_client_details (
	  client_id varchar(255),
	  resource_ids varchar(256),
	  client_secret varchar(256),
	  scope varchar(256),
	  authorized_grant_types varchar(256),
	  web_server_redirect_uri varchar(256),
	  authorities varchar(256),
	  access_token_validity bigint,
	  refresh_token_validity bigint,
	  additional_information varchar(4096),
	  autoapprove varchar(256),
	  
	  primary key (client_id)
);