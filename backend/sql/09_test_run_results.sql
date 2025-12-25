CREATE TABLE test_run_results (
  ids UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  test_run_id UUID NOT NULL,
  test_case_id UUID NOT NULL,

  status VARCHAR(20) NOT NULL CHECK (
    status IN ('pass', 'fail', 'blocked', 'skipped')
  ),

  remarks TEXT,

  CONSTRAINT fk_result_run
    FOREIGN KEY (test_run_id)
    REFERENCES test_runs(id)
    ON DELETE CASCADE,

  CONSTRAINT fk_result_case
    FOREIGN KEY (test_case_id)
    REFERENCES test_cases(id),

  CONSTRAINT unique_run_case
    UNIQUE (test_run_id, test_case_id)
);
