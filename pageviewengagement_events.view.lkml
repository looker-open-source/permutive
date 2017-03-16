view: pageviewengagement_events {
  sql_table_name: zeitgeist.pageviewengagement_events ;;

  dimension: event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: properties__client__domain {
    type: string
    sql: ${TABLE}.properties.client.domain ;;
  }

  dimension: properties__client__referrer {
    type: string
    sql: ${TABLE}.properties.client.referrer ;;
  }

  dimension: properties__client__title {
    type: string
    sql: ${TABLE}.properties.client.title ;;
  }

  dimension: properties__client__type {
    type: string
    sql: ${TABLE}.properties.client.type ;;
  }

  dimension: properties__client__url {
    type: string
    sql: ${TABLE}.properties.client.url ;;
  }

  dimension: properties__client__user_agent {
    type: string
    sql: ${TABLE}.properties.client.user_agent ;;
  }

  dimension: properties__completion {
    type: number
    sql: ${TABLE}.properties.completion ;;
  }

  dimension: properties__engaged_time {
    type: number
    sql: ${TABLE}.properties.engaged_time ;;
  }

  dimension: properties_visit_id {
    type: string
    sql: ${TABLE}.properties.visit_id ;;
  }

  dimension: segments {
    type: number
    sql: ${TABLE}.segments ;;
    fanout_on: "segments"
  }

  dimension: session_id {
    type: string
#     hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: pageviews {
    type: count_distinct
    sql: ${properties_visit_id} ;;
  }

  measure: engaged_time_event_count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }

  measure: engaged_time_seconds {
    type: number
    sql: ${engaged_time_event_count}*5 ;;
  }

  measure: engaged_time_hours {
    type: number
    sql: ${engaged_time_event_count}*5/3600 ;;
  }

  measure: uniques {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: sessions {
    type: count_distinct
    sql: ${session_id} ;;
  }
}
