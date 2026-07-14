## What I built
- Staging models: `stg_trips.sql`, `stg_zones.sql` (+ their `_*.yml` tests/descriptions)
- Mart: `fct_daily_borough_stats.sql` at grain one row per (pickup_borough, pickup_date)
- Macro: `safe_divide.sql`
- Singular test: `assert_avg_tip_pct_within_bounds.sql`
- `dbt_utils` declared in `packages.yml`
- Lineage screenshot: `docs/lineage.png`
- Business answers: `reports/answers.md`
- AI usage: `AI_ASSIST.md`

## How to review
- Models: read `models/marts/fct_daily_borough_stats.sql` (grain + measures) and the staging models.
- Lineage: `docs/lineage.png`.
- Answers: `reports/answers.md`.
- AI usage: `AI_ASSIST.md`.

## How to run
From a clean clone, with your own Postgres access:

```bash
cp profiles.yml.example profiles.yml   # set schema to dev_<your_name>
cp .env.example .env                   # fill PG_HOST, PG_USER, PG_PASSWORD
source .env
dbt deps
dbt build                              # runs models + tests
```

`dbt debug` must end with `All checks passed!` first.

> Data dependency: this builds into **your own** `dev_<name>` schema on the shared Postgres. A reviewer without that access relies on `docs/lineage.png` and `reports/answers.md` as the canonical evidence.

## What reviewers should see (expected results)
Fill in what your build actually produces:
- `dbt build` result: <e.g. PASS=NN WARN=1 ERROR=0>
- `fct_daily_borough_stats` row count: <e.g. ~180>
- Grain: one row per (pickup_borough, pickup_date)
- One business answer sample: <e.g. Manhattan has the most trips>

## Known limitations / out of scope
- <e.g. the singular test WARNs rather than errors by design; incremental not implemented>
- Write "none" if everything in the assignment is done and working.

## Self-check
- [ ] `bash .hyf/test.sh` passes
- [ ] `dbt build` completes with no ERROR
- [ ] `fct_daily_borough_stats` exists as a **table** at the stated grain
- [ ] No credentials committed (`profiles.yml` / `.env` are gitignored)
- [ ] `docs/lineage.png` is committed
