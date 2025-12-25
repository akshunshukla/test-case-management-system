CREATE TABLE project_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  user_id UUID NOT NULL,
  project_id UUID NOT NULL,

  role VARCHAR(20) NOT NULL CHECK (
    role IN ('owner', 'maintainer', 'tester', 'viewer')
  ),

  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

  CONSTRAINT fk_project_member_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,

  CONSTRAINT fk_project_member_project
    FOREIGN KEY (project_id)
    REFERENCES projects(id)
    ON DELETE CASCADE,

  CONSTRAINT unique_user_project
    UNIQUE (user_id, project_id)
);
