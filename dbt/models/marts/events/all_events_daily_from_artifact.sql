{# 
  All events daily from an artifact
#}

SELECT
  e.from_name,
  e.from_namespace,
  e.from_type,
  e.from_source_id,
  TIMESTAMP_TRUNC(e.time, DAY) as bucket_day,
  e.type,
  SUM(e.amount) AS amount
FROM {{ ref('all_events_from_project') }} AS e
GROUP BY 1,2,3,4,5,6