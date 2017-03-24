view: article_pageview_events {
  sql_table_name: burda_forward.pageview_events ;;

  dimension: event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.event_id;;
  }

  dimension: properties___document__collection {
    type: string
    sql: ${TABLE}.properties._document.collection ;;
  }

  dimension: properties___document__id {
    type: string
    sql: ${TABLE}.properties._document.id ;;
  }

  dimension: properties___document__properties__categories {
    type: string
    sql: ${TABLE}.properties._document.properties.categories ;;
    fanout_on: "properties._document.properties.categories"
  }

  dimension: properties___document__properties__description {
    type: string
    sql: ${TABLE}.properties._document.properties.description ;;
  }

  dimension: properties___document__properties__section {
    type: string
    sql: ${TABLE}.properties._document.properties.section ;;
  }

  dimension: properties___document__properties__tags {
    type: string
    sql: ${TABLE}.properties._document.properties.tags ;;
    fanout_on: "properties._document.properties.tags"
  }

  dimension: properties___document__properties__title {
    type: string
    sql: ${TABLE}.properties._document.properties.title ;;
  }

  dimension: properties___document__properties__url {
    type: string
    sql: ${TABLE}.properties._document.properties.url ;;
  }

  dimension_group: properties___document_ {
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
    sql: ${TABLE}.properties._document.time ;;
  }

  dimension: properties__alchemy__taxonomy__confident {
    type: string
    sql: ${TABLE}.properties.alchemy.taxonomy.confident ;;
    fanout_on: "properties.alchemy.taxonomy"
  }

  dimension: properties__alchemy__taxonomy__label {
    type: string
    sql: ${TABLE}.properties.alchemy.taxonomy.label ;;
    fanout_on: "properties.alchemy.taxonomy"
  }

  dimension: properties__alchemy__taxonomy__score {
    type: number
    sql: ${TABLE}.properties.alchemy.taxonomy.score ;;
    fanout_on: "properties.alchemy.taxonomy"
  }

  dimension: properties__alchemy__taxonomy_labels {
    type: string
    sql: ${TABLE}.properties.alchemy.taxonomy_labels ;;
    fanout_on: "properties.alchemy.taxonomy_labels"
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

  dimension: properties__geo_info__city {
    type: string
    sql: ${TABLE}.properties.geo_info.city ;;
  }

  dimension: properties__geo_info__continent {
    type: string
    sql: ${TABLE}.properties.geo_info.continent ;;
  }

  dimension: properties__geo_info__country {
    type: string
    sql: ${TABLE}.properties.geo_info.country ;;
  }

  dimension: properties__geo_info__postal_code {
    type: string
    sql: ${TABLE}.properties.geo_info.postal_code ;;
  }

  dimension: properties__geo_info__province {
    type: string
    sql: ${TABLE}.properties.geo_info.province ;;
  }

  dimension: properties__ip_address {
    type: string
    sql: ${TABLE}.properties.ip_address ;;
  }

  dimension: properties__isp_info__autonomous_system_number {
    type: number
    sql: ${TABLE}.properties.isp_info.autonomous_system_number ;;
  }

  dimension: properties__isp_info__autonomous_system_organization {
    type: string
    sql: ${TABLE}.properties.isp_info.autonomous_system_organization ;;
  }

  dimension: properties__isp_info__ip_address {
    type: string
    sql: ${TABLE}.properties.isp_info.ip_address ;;
  }

  dimension: properties__isp_info__isp {
    type: string
    sql: ${TABLE}.properties.isp_info.isp ;;
  }

  dimension: properties__isp_info__organization {
    type: string
    sql: ${TABLE}.properties.isp_info.organization ;;
  }

  dimension: properties__url {
    type: string
    sql: ${TABLE}.properties.url ;;
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
    sql: ${TABLE}.session_id ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
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
      hour,
      hour_of_day
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: type_fia {
    type: yesno
    sql: ${properties__client__type}="fia";;
  }

  measure: pageviews {
    type: count
    drill_fields: []
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: uniques {
    type: count_distinct
    sql: ${user_id} ;;
  }
}
