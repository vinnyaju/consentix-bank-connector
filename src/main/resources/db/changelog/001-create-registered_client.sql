--liquibase formatted sql
--changeset marcus:001
CREATE TABLE registered_client (
    client_id UUID PRIMARY KEY,
    software_id UUID NOT NULL UNIQUE, -- mesmo valor de client_id, por clareza semântica
    client_name TEXT NOT NULL,
    org_id UUID NOT NULL,
    org_number VARCHAR(14) NOT NULL,
    org_name TEXT NOT NULL,
    software_mode VARCHAR(10) NOT NULL, -- Live ou Test
    software_environment VARCHAR(10) NOT NULL, -- Sandbox ou Production
    software_client_uri TEXT,
    software_logo_uri TEXT,
    software_jwks_uri TEXT NOT NULL,
    software_jwks_transport_uri TEXT,
    software_jwks_inactive_uri TEXT, -- <- incluído
    raw_software_statement JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

--rollback
DROP TABLE registered_client;
