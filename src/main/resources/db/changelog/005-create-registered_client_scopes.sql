--liquibase formatted sql
--changeset marcus:005
CREATE TABLE registered_client_scopes (
    client_id UUID NOT NULL REFERENCES registered_client(client_id) ON DELETE CASCADE,
    scope TEXT NOT NULL,
    PRIMARY KEY (client_id, scope)
);

CREATE INDEX idx_scopes_client_id ON registered_client_scopes(client_id);

--rollback
DROP TABLE registered_client_scopes;
DROP INDEX idx_scopes_client_id;
