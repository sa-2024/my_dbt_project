-- models/person.sql

{{ config(
    materialized='table'
) }}

WITH person_data AS (
    SELECT
        id,
        first_name,
        last_name,
        birthdate,
        email,
        created_at
    FROM {{ ref('stg_person') }}  -- Refers to a staging table
)

SELECT
    id,
    first_name,
    last_name,
    birthdate,
    email,
    created_at
FROM person_data
WHERE created_at IS NOT NULL
