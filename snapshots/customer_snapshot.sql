{% snapshot customer_snapshot %}

{{
    config(
        target_database='ANALYTICS_DEV',
        target_schema='DBT_BRAVINDRAREDDY_SNAPSHOTS',
        unique_key='customer_id',

        strategy='check',

        check_cols=[
            'first_name',
            'last_name',
            'email',
            'phone',
            'address',
            'city',
            'state',
            'country',
            'status'
        ]
    )
}}

SELECT *
FROM {{ ref('stg_customer') }}

{% endsnapshot %}
