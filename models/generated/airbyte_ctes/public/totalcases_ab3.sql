{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('totalcases_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        '_id',
        'status',
        adapter.quote('Defect ID'),
        adapter.quote('Case Owner'),
        adapter.quote('Case Number'),
        adapter.quote('Case Origin'),
        adapter.quote('Case Category'),
        adapter.quote('Previous Owner'),
        adapter.quote('Detailed Status'),
        adapter.quote('Case Owner eMail'),
        adapter.quote('Date/Time Closed'),
        adapter.quote('Date/Time Opened'),
        adapter.quote('Case Sub-Category'),
        adapter.quote('Account Page Level'),
        adapter.quote('Case Contact Email'),
        adapter.quote('Case Owner Manager'),
        adapter.quote('Latin Account Name'),
        adapter.quote('Entitlement Summary'),
        adapter.quote('Resolution Date Time'),
        adapter.quote('Customer Reference ID'),
        adapter.quote('Case Date/Time Last Modified'),
    ]) }} as _airbyte_totalcases_hashid,
    tmp.*
from {{ ref('totalcases_ab2') }} tmp
-- totalcases
where 1 = 1

