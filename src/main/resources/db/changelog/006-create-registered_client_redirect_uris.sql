--liquibase formatted sql
--changeset marcus:006
CREATE TABLE registered_client_redirect_uris (
    client_id UUID NOT NULL REFERENCES registered_client(client_id) ON DELETE CASCADE,
    redirect_uri TEXT NOT NULL,
    PRIMARY KEY (client_id, redirect_uri)
);

CREATE INDEX idx_redirect_uris_client_id ON registered_client_redirect_uris(client_id);

--rollback
DROP TABLE registered_client_redirect_uris;
DROP INDEX idx_redirect_uris_client_id;
