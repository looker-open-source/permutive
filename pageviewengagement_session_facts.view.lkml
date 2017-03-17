view: pageviewengagement_session_facts {
  derived_table: {
    sql: SELECT
          session_id,
          segments,
          count(distinct properties.visit_id) as pageviews,
          SUM(properties.engaged_time) AS engaged_time
        FROM
          pageviewengagement_events
        WHERE segments is not null
        GROUP BY
          session_id,
          segments
       ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: segments {
    type: number
    sql: ${TABLE}.segments ;;
  }

  dimension: engaged_time {
    type: number
    sql: ${TABLE}.engaged_time ;;
  }

  dimension: engaged_time_tier {
    type:  tier
    sql:  ${engaged_time} ;;
    style: integer
    tiers: [30,60,90,120,150,180,210]
  }

  dimension: pageviews {
    type: number
    sql:  ${TABLE}.pageviews ;;
  }

  dimension: pageviews_tier {
    type: tier
    sql: ${pageviews} ;;
    style: integer
    tiers: [1,2,3,4,5]
  }

  set: detail {
    fields: [session_id, segments, engaged_time]
  }
}
