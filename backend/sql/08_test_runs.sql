CREATE TABLE test_runs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  project_id UUID NOT NULL,
  executed_by UUID NOT NULL,

  status VARCHAR(20) NOT NULL DEFAULT 'running' CHECK (
    status IN ('running', 'completed', 'aborted')
  ),

  started_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  finished_at TIMESTAMP WITH TIME ZONE,

  CONSTRAINT fk_run_project
    FOREIGN KEY (project_id)
    REFERENCES projects(id),

  CONSTRAINT fk_run_user
    FOREIGN KEY (executed_by)
    REFERENCES users(id)
);
