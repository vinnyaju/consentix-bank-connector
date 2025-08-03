--liquibase formatted sql
--changeset marcus:003
CREATE TABLE registered_client_grant_types (
    client_id UUID NOT NULL REFERENCES registered_client(client_id) ON DELETE CASCADE,
    grant_type VARCHAR(50) NOT NULL, -- e.g., authorization_code
    PRIMARY KEY (client_id, grant_type)
);

CREATE INDEX idx_grants_client_id ON registered_client_grant_types(client_id);

--rollback
DROP TABLE registered_client_grant_types;
DROP INDEX idx_grants_client_id;
