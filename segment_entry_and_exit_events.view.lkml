view: segment_entry_and_exit_events {
  derived_table: {
    sql:SELECT * FROM
      (SELECT
        time, session_id, user_id, properties.segment_name as segment_name, segments  AS segments_segments, "entry" as event_type
      FROM burda_forward.segmententry_events  AS segmententry_events
      LEFT JOIN UNNEST(segmententry_events.segments) as segments

      WHERE
        {% condition partition_date %} _PARTITIONTIME {% endcondition %}
        )

      UNION ALL

      (SELECT
        time, session_id, user_id, properties.segment_name as segment_name, segments  AS segments_segments, "exit" as event_type
      FROM burda_forward.segmentexit_events  AS segmentexit_events
      LEFT JOIN UNNEST(segmentexit_events.segments) as segments

      WHERE
        {% condition partition_date %} _PARTITIONTIME {% endcondition %}
        )
       ;;
  }

  dimension_group: event {
    type: time
    sql: ${TABLE}.time ;;
  }

  filter: date_group {
    suggestions: ["Date", "Week", "Month", "Hour"]
  }

  dimension: dynamic_date_group {
    sql:  CASE
        WHEN {% parameter date_group %} = 'Date' THEN cast(${event_date} as string)
        WHEN {% parameter date_group %} = 'Week' THEN ${event_week}
        WHEN {% parameter date_group %} = 'Month' THEN ${event_month}
        WHEN {% parameter date_group %} = 'Hour' THEN ${event_hour}
        END ;;
  }


  filter: partition_date {
    type: date
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: properties_segment_name {
    type: string
    sql: ${TABLE}.segment_name ;;
  }

  dimension: segments {
    type: number
    label: "Segment Number"
    sql: ${TABLE}.segments_segments ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  measure: segment_entry_uniques {
    type: count_distinct
    sql: ${user_id} ;;
    filters: {
      field: event_type
      value: "entry"
    }
  }

  measure: segment_exit_uniques {
    type: count_distinct
    sql: ${user_id} ;;
    filters: {
      field: event_type
      value: "exit"
    }
  }

  measure: segment_growth_uniques  {
    type: number
    sql: ${segment_entry_uniques} - ${segment_exit_uniques} ;;
  }

  measure: segment_growth_uniques_cumulative {
    type: running_total
    direction: "column"
    sql: ${segment_growth_uniques} ;;
  }

}
