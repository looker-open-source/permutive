view: segment_entry_and_exit_events {
  derived_table: {
    sql: select * from
      (select *, "entry" as event_type from segmententry_events where ({% condition event_date %} time {% endcondition %})),
      (select *, "exit" as event_type from segmentexit_events where ({% condition event_date %} time {% endcondition %}) )
       ;;
  }

  dimension_group: event {
    type: time
    sql: ${TABLE}.time ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: properties_segment_id {
    type: string
    sql: ${TABLE}.properties_segment_id ;;
  }

  dimension: properties_segment_name {
    type: string
    sql: ${TABLE}.properties.segment_name ;;
  }

  dimension: properties_client_domain {
    type: string
    sql: ${TABLE}.properties_client_domain ;;
  }

  dimension: properties_client_title {
    type: string
    sql: ${TABLE}.properties_client_title ;;
  }

  dimension: properties_client_url {
    type: string
    sql: ${TABLE}.properties_client_url ;;
  }

  dimension: properties_client_referrer {
    type: string
    sql: ${TABLE}.properties_client_referrer ;;
  }

  dimension: properties_client_user_agent {
    type: string
    sql: ${TABLE}.properties_client_user_agent ;;
  }

  dimension: properties_client_type {
    type: string
    sql: ${TABLE}.properties_client_type ;;
  }

  dimension: properties_segment_code {
    type: string
    sql: ${TABLE}.properties_segment_code ;;
  }

  dimension: properties_custom_id {
    type: string
    sql: ${TABLE}.properties_custom_id ;;
  }

  dimension: properties_segment_number {
    type: number
    sql: ${TABLE}.properties_segment_number ;;
  }

  dimension: segments {
    type: number
    sql: ${TABLE}.segments ;;
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

  set: detail {
    fields: [
      event_time,
      event_id,
      user_id,
      source_id,
      session_id,
      properties_segment_id,
      properties_segment_name,
      properties_client_domain,
      properties_client_title,
      properties_client_url,
      properties_client_referrer,
      properties_client_user_agent,
      properties_client_type,
      properties_segment_code,
      properties_custom_id,
      properties_segment_number,
      segments,
      event_type
    ]
  }
}
