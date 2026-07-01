# Week 10 Assignment: Daily Borough Stats Mart

HackYourFuture Data Track — Week 10. The full brief (scenario, tasks, and grading criteria) lives in the curriculum: **Week 10 → Assignment** in the HackYourFuture learning platform. This repo is a starter scaffold for the dbt project you will build.

## What you build

A dbt Core project called `nyc_taxi_borough_daily` that produces a mart at the grain **one row per (pickup_borough, pickup_date)** for the NYC Green Taxi January 2024 dataset already loaded in the shared Azure PostgreSQL instance.

## Repo layout

```
nyc_taxi_borough_daily/          <- this repo IS the dbt project
├── dbt_project.yml              <- project name, model paths, materialization defaults
├── packages.yml                 <- dbt_utils dependency (run `dbt deps` after setup)
├── profiles.yml.example         <- sanitized connection template -- copy to profiles.yml
├── macros/
│   └── safe_divide.sql          <- TODO: implement the safe_divide macro
├── models/
│   ├── staging/
│   │   ├── _sources.yml         <- TODO: confirm schema declaration
│   │   ├── _stg_trips.yml       <- TODO: fill in column descriptions
│   │   ├── _stg_zones.yml       <- TODO: fill in column descriptions
│   │   ├── stg_trips.sql        <- TODO: implement staging model
│   │   └── stg_zones.sql        <- TODO: implement staging model
│   └── marts/
│       ├── _fct_daily_borough_stats.yml  <- TODO: grain + column descriptions
│       └── fct_daily_borough_stats.sql   <- TODO: implement mart
├── tests/
│   └── assert_avg_tip_pct_within_bounds.sql  <- TODO: singular test
├── docs/
│   └── lineage.png              <- TODO: screenshot from dbt docs serve
├── reports/
│   └── answers.md               <- TODO: four business questions with SQL + results
└── AI_ASSIST.md                 <- TODO: document one LLM session
```

## Setup

1. Copy `profiles.yml.example` to `profiles.yml` and replace `<your_name>`:

```bash
cp profiles.yml.example profiles.yml
# edit profiles.yml: set schema to dev_<your_name>_borough
```

2. Export the connection env vars (ask your mentor for the shared instance values):

```bash
export PG_HOST=...
export PG_USER=...
export PG_PASSWORD=...
export PG_DBNAME=...
```

3. Install packages and verify the connection:

```bash
dbt deps
dbt debug
```

## Local scoring

```bash
bash .hyf/test.sh
cat .hyf/score.json
```

| Score | What the grader checks |
|---|---|
| 10/100 | Required files exist |
| 25/100 | .gitignore excludes profiles.yml; profiles.yml.example uses env_var |
| 45/100 | Staging: source() references, correct filters, tip_pct column present |
| 65/100 | Mart: JOIN to zones, GROUP BY borough + date, 6 required output columns |
| 80/100 | Tests: compound uniqueness + not_null in YAML; singular test implemented |
| 90/100 | Docs: column descriptions explain meaning, model grain stated |
| 100/100 | reports/answers.md + AI_ASSIST.md filled in |

Passing score: **60 / 100**.

## Submission

1. Create branch `week10/your-name` in this repo.
2. Commit your work.
3. Open a Pull Request. In the PR description, paste the `dbt build` summary line and your answer to Q1 (highest total_fare borough).
