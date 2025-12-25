CREATE TABLE test_suite_cases (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  test_suite_id UUID NOT NULL,
  test_case_id UUID NOT NULL,

  CONSTRAINT fk_suite_case_suite
    FOREIGN KEY (test_suite_id)
    REFERENCES test_suites(id)
    ON DELETE CASCADE,

  CONSTRAINT fk_suite_case_case
    FOREIGN KEY (test_case_id)
    REFERENCES test_cases(id)
    ON DELETE CASCADE,

  CONSTRAINT unique_suite_case
    UNIQUE (test_suite_id, test_case_id)
);
