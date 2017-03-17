view: segment_overlap {
  derived_table: {
    sql:
      select
            a.properties.segment_name as segment_name_1
            , b.properties.segment_name as segment_name_2
            , a.user_id as user_id
          from
            (
              select
                user_id
                , properties.segment_name
              from
                segmententry_events

              group by
                user_id
                , properties.segment_name
            )
            a
            inner join (
              select
                user_id
                , properties.segment_name
              from
               segmententry_events

              group by
                user_id
                , properties.segment_name
            )
            b on
              a.user_id = b.user_id
       ;;
  }

  measure: uniques {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
  }

  dimension: segment_name_1 {
    type: string
    sql: ${TABLE}.segment_name_1 ;;
  }

  dimension: segment_name_2 {
    type: string
    sql: ${TABLE}.segment_name_2 ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [user_id]
  }
}
