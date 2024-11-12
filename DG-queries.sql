-- pgcli -h localhost -U dbt_user -d dbt_database -p 15432
-- pwd= dbt_password

-- list databases
\l
-- list tables  
\dt dbt_schema.*
-- list table columns
\d dbt_schema.person

\set destructive_warning = False

select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT first_name, count(distinct last_name)
      FROM "dbt_database"."dbt_schema"."person"
      WHERE first_name IS NOT NULL
      GROUP BY first_name
      HAVING count(distinct last_name) > 1
    ) dbt_internal_test;

update dbt_database.dbt_schema.person set last_name = 'Doe2' where id = 3;

SELECT first_name, count(distinct last_name)
FROM "dbt_database"."dbt_schema"."person"
WHERE first_name IS NOT NULL
GROUP BY first_name
HAVING count(distinct last_name) > 1
;

select * FROM dbt_database.dbt_schema.person;




