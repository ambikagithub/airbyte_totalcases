{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('public', '_airbyte_raw_totalcases') }}
select
    {{ json_extract_scalar('_airbyte_data', ['_id'], ['_id']) }} as _id,
    {{ json_extract_scalar('_airbyte_data', ['Status'], ['Status']) }} as status,
    {{ json_extract_scalar('_airbyte_data', ['Defect ID'], ['Defect ID']) }} as {{ adapter.quote('Defect ID') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Owner'], ['Case Owner']) }} as {{ adapter.quote('Case Owner') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Number'], ['Case Number']) }} as {{ adapter.quote('Case Number') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Origin'], ['Case Origin']) }} as {{ adapter.quote('Case Origin') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Category'], ['Case Category']) }} as {{ adapter.quote('Case Category') }},
    {{ json_extract_scalar('_airbyte_data', ['Previous Owner'], ['Previous Owner']) }} as {{ adapter.quote('Previous Owner') }},
    {{ json_extract_scalar('_airbyte_data', ['Detailed Status'], ['Detailed Status']) }} as {{ adapter.quote('Detailed Status') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Owner eMail'], ['Case Owner eMail']) }} as {{ adapter.quote('Case Owner eMail') }},
    {{ json_extract_scalar('_airbyte_data', ['Date/Time Closed'], ['Date/Time Closed']) }} as {{ adapter.quote('Date/Time Closed') }},
    {{ json_extract_scalar('_airbyte_data', ['Date/Time Opened'], ['Date/Time Opened']) }} as {{ adapter.quote('Date/Time Opened') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Sub-Category'], ['Case Sub-Category']) }} as {{ adapter.quote('Case Sub-Category') }},
    {{ json_extract_scalar('_airbyte_data', ['Account Page Level'], ['Account Page Level']) }} as {{ adapter.quote('Account Page Level') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Contact Email'], ['Case Contact Email']) }} as {{ adapter.quote('Case Contact Email') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Owner Manager'], ['Case Owner Manager']) }} as {{ adapter.quote('Case Owner Manager') }},
    {{ json_extract_scalar('_airbyte_data', ['Latin Account Name'], ['Latin Account Name']) }} as {{ adapter.quote('Latin Account Name') }},
    {{ json_extract_scalar('_airbyte_data', ['Entitlement Summary'], ['Entitlement Summary']) }} as {{ adapter.quote('Entitlement Summary') }},
    {{ json_extract_scalar('_airbyte_data', ['Resolution Date Time'], ['Resolution Date Time']) }} as {{ adapter.quote('Resolution Date Time') }},
    {{ json_extract_scalar('_airbyte_data', ['Customer Reference ID'], ['Customer Reference ID']) }} as {{ adapter.quote('Customer Reference ID') }},
    {{ json_extract_scalar('_airbyte_data', ['Case Date/Time Last Modified'], ['Case Date/Time Last Modified']) }} as {{ adapter.quote('Case Date/Time Last Modified') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('public', '_airbyte_raw_totalcases') }} as table_alias
-- totalcases
where 1 = 1

