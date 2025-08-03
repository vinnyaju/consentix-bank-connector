--liquibase formatted sql
--changeset marcus:002
CREATE TABLE registered_client_roles (
    client_id UUID NOT NULL REFERENCES registered_client(client_id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL, -- e.g., DADOS, PAGTO, CONTA
    PRIMARY KEY (client_id, role)
);

CREATE INDEX idx_roles_client_id ON registered_client_roles(client_id);

--rollback
DROP TABLE registered_client_roles;
DROP INDEX idx_roles_client_id;
