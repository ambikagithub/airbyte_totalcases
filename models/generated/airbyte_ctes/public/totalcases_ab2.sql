{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('totalcases_ab1') }}
select
    cast(_id as {{ dbt_utils.type_string() }}) as _id,
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast({{ adapter.quote('Defect ID') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Defect ID') }},
    cast({{ adapter.quote('Case Owner') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Owner') }},
    cast({{ adapter.quote('Case Number') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Number') }},
    cast({{ adapter.quote('Case Origin') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Origin') }},
    cast({{ adapter.quote('Case Category') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Category') }},
    cast({{ adapter.quote('Previous Owner') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Previous Owner') }},
    cast({{ adapter.quote('Detailed Status') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Detailed Status') }},
    cast({{ adapter.quote('Case Owner eMail') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Owner eMail') }},
    cast({{ adapter.quote('Date/Time Closed') }} as {{ dbt_utils.type_timestamp() }}) as {{ adapter.quote('Date/Time Closed') }},
    cast({{ adapter.quote('Date/Time Opened') }} as {{ dbt_utils.type_timestamp() }}) as {{ adapter.quote('Date/Time Opened') }},
    cast({{ adapter.quote('Case Sub-Category') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Sub-Category') }},
    cast({{ adapter.quote('Account Page Level') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Account Page Level') }},
    cast({{ adapter.quote('Case Contact Email') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Contact Email') }},
    cast({{ adapter.quote('Case Owner Manager') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Owner Manager') }},
    cast({{ adapter.quote('Latin Account Name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Latin Account Name') }},
    cast({{ adapter.quote('Entitlement Summary') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Entitlement Summary') }},
    cast({{ adapter.quote('Resolution Date Time') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Resolution Date Time') }},
    cast({{ adapter.quote('Customer Reference ID') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Customer Reference ID') }},
    cast({{ adapter.quote('Case Date/Time Last Modified') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('Case Date/Time Last Modified') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('totalcases_ab1') }}
-- totalcases
where 1 = 1

