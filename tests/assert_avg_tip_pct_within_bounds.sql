-- Singular test: flag (borough, date) combinations where avg_tip_pct > 1.
-- A tip_pct > 1 means the average tip exceeded the total fare for that cell,
-- which is unusual and almost always indicates a small-sample bucket (e.g. the
-- Unknown borough) where a few high-tip outliers dominate the average.
--
-- This test is intentionally set to WARN severity in dbt_project.yml so it
-- does not block the build, but it surfaces the anomaly for the reports/answers.md
-- write-up. The assignment rubric requires documenting this finding.
--
-- The test passes when zero rows are returned; any returned rows are flagged.

-- TODO: write the SELECT here.
-- Query {{ ref('fct_daily_borough_stats') }} and return rows where avg_tip_pct > 1.
SELECT NULL AS pickup_borough, NULL AS pickup_date, NULL AS avg_tip_pct
WHERE FALSE  -- TODO: replace with the real query
