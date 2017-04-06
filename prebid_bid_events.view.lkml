view: prebid_bid_events {
  sql_table_name: burda_forward.rtabid_events ;;

  dimension: partition_date {
    type: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: bidder {
    type: string
    sql: ${TABLE}.properties.advertiser ;;
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

  dimension: ad_unit_code {
    type: string
    sql: ${TABLE}.properties.format ;;
  }

  dimension: properties_price {
    type: number
    sql: ${TABLE}.properties.price ;;
  }

  dimension: properties__visit_id {
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
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour
    ]
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
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: total_bids {
    type: count
    drill_fields: []
  }

  measure: average_cpm {
    type: average
    label: "Average CPM"
    sql: ${properties_price} ;;
    value_format_name: usd
  }

  measure: total_cpm {
    type: sum
    sql: ${properties_price}/1000 ;;
    value_format_name: usd
  }


}
