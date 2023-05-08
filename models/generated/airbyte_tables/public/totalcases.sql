{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='totalcases_scd'
                        )
                    %}
                    {%
                        if scd_table_relation is not none
                    %}
                    {%
                            do adapter.drop_relation(scd_table_relation)
                    %}
                    {% endif %}
                        "],
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('totalcases_ab3') }}
select
    _id,
    status,
    {{ adapter.quote('Defect ID') }},
    {{ adapter.quote('Case Owner') }},
    {{ adapter.quote('Case Number') }},
    {{ adapter.quote('Case Origin') }},
    {{ adapter.quote('Case Category') }},
    {{ adapter.quote('Previous Owner') }},
    {{ adapter.quote('Detailed Status') }},
    {{ adapter.quote('Case Owner eMail') }},
    {{ adapter.quote('Date/Time Closed') }},
    {{ adapter.quote('Date/Time Opened') }},
    {{ adapter.quote('Case Sub-Category') }},
    {{ adapter.quote('Account Page Level') }},
    {{ adapter.quote('Case Contact Email') }},
     RIGHT(case_contact_email, ( Charindex('@', case_contact_email) + 1 ))
      as customer_domain,
    {{ adapter.quote('Case Owner Manager') }},
    {{ adapter.quote('Latin Account Name') }},
    {{ adapter.quote('Entitlement Summary') }},
    {{ adapter.quote('Resolution Date Time') }},
    {{ adapter.quote('Customer Reference ID') }},
    {{ adapter.quote('Case Date/Time Last Modified') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_totalcases_hashid
from {{ ref('totalcases_ab3') }}
-- totalcases from {{ source('public', '_airbyte_raw_totalcases') }}
where 1 = 1

