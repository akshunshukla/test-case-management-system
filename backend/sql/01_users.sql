CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,

  role VARCHAR(20) NOT NULL CHECK (
    role IN ('admin', 'test-lead', 'tester', 'read-only')
  ),

  status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK (
    status IN ('active', 'inactive', 'blocked')
  ),

  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);
