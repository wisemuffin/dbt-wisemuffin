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