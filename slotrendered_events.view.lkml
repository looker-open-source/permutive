view: slotrendered_events {
  sql_table_name: zeitgeist.slotrendered_events ;;

  dimension: event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: properties__advertiser_id {
    type: number
    sql: ${TABLE}.properties.advertiser_id ;;
  }

  dimension: properties__campaign_id {
    type: number
    sql: ${TABLE}.properties.campaign_id ;;
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

  dimension: properties__creative_id {
    type: number
    sql: ${TABLE}.properties.creative_id ;;
  }

  dimension: properties__height {
    type: number
    sql: ${TABLE}.properties.height ;;
  }

  dimension: properties__is_empty {
    type: yesno
    sql: ${TABLE}.properties.is_empty ;;
  }

  dimension: properties__line_item_id {
    type: number
    sql: ${TABLE}.properties.line_item_id ;;
  }

  dimension: properties__service_name {
    type: string
    sql: ${TABLE}.properties.service_name ;;
  }

  dimension: properties__slot__ad_unit_path {
    type: string
    sql: ${TABLE}.properties.slot.ad_unit_path ;;
  }

  dimension: properties__slot__slot_element_id {
    type: string
    sql: ${TABLE}.properties.slot.slot_element_id ;;
  }

  dimension: properties__slot__targeting_keys__key {
    type: string
    sql: ${TABLE}.properties.slot.targeting_keys.key ;;
    fanout_on: "properties.slot.targeting_keys"
  }

  dimension: properties__slot__targeting_keys__value {
    type: string
    sql: ${TABLE}.properties.slot.targeting_keys.value ;;
    fanout_on: "properties.slot.targeting_keys.value"
  }

  dimension: properties__width {
    type: number
    sql: ${TABLE}.properties.width ;;
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

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [properties__service_name]
  }
}
