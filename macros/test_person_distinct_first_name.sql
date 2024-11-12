-- macros/test_person_distinct_first_name.sql
{% test person_distinct_first_name(model) %}
      SELECT first_name, count(distinct last_name)
      FROM {{ model }}
      WHERE first_name IS NOT NULL
      GROUP BY first_name
      HAVING count(distinct last_name) > 1  
{% endtest %}