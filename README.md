# dbt wisemuffin

# design

## source
the following source systems are ingested via fivetran:
- hubspot

## staging
- Name columns consistently across all packages:
- Boolean fields are prefixed with is_ or has_
- Timestamps are appended with _timestamp
- ID primary keys are prefixed with the name of the table. For example, the user table's ID column is renamed user_id.

## mocking data
to generate data into my sources i use mockaroo and a script to load into each of my sources.

## Marquez & openlineage

[setting up Marquez](https://openlineage.io/getting-started/)

```bash
./docker/up.sh
```

### Sending DBT data to marquez

```bash
pip install openlineage-dbt
export OPENLINEAGE_URL=http://localhost:5000
export OPENLINEAGE_NAMESPACE=dev
```

then instead of running dbt on the cli do:
***run dbt docs genreate first to enrich meta data (adds types and descriptions to schemas)
```bash
dbt docs generate
dbt-ol run
```