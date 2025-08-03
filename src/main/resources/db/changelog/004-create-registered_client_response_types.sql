--liquibase formatted sql
--changeset marcus:004
CREATE TABLE registered_client_response_types (
    client_id UUID NOT NULL REFERENCES registered_client(client_id) ON DELETE CASCADE,
    response_type VARCHAR(30) NOT NULL, -- e.g., code, id_token
    PRIMARY KEY (client_id, response_type)
);

CREATE INDEX idx_response_types_client_id ON registered_client_response_types(client_id);

--rollback
DROP TABLE registered_client_response_types;
DROP INDEX idx_response_types_client_id;
