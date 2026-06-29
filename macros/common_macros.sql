{% macro add_load_timestamp() %}

CURRENT_TIMESTAMP() AS load_timestamp

{% endmacro %}

{% macro clean_text(column_name) %}

INITCAP(TRIM({{ column_name }}))

{% endmacro %}