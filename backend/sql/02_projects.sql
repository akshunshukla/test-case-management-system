CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  name VARCHAR(150) NOT NULL,
  description TEXT,

  version VARCHAR(50),
  status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK (
    status IN ('active', 'archived', 'completed')
  ),

  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_projects_name ON projects(name);
