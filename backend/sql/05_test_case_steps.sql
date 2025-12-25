CREATE TABLE test_case_steps (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  test_case_id UUID NOT NULL,
  step_number INT NOT NULL,

  action TEXT NOT NULL,
  expected_result TEXT NOT NULL,

  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

  CONSTRAINT fk_step_test_case
    FOREIGN KEY (test_case_id)
    REFERENCES test_cases(id)
    ON DELETE CASCADE,

  CONSTRAINT unique_step_order
    UNIQUE (test_case_id, step_number)
);
