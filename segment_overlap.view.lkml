view: segment_overlap {
  derived_table: {
    sql:
      select
            a.properties_segment_name as segment_name_1
            , a.properties_segment_number as segment_number_1
            , b.properties_segment_name as segment_name_2
            , b.properties_segment_number as segment_number_2
            , a.user_id as user_id
          from
            (
              select
                user_id
                , properties.segment_name as properties_segment_name
                , properties.segment_number as properties_segment_number
              from
                segmententry_events
                where
                {% condition date_filter %} _PARTITIONTIME {% endcondition %}

              group by
                user_id
                , properties.segment_name
                , properties.segment_number
            )
            a
            inner join (
              select
                user_id
                , properties.segment_name as properties_segment_name
                , properties.segment_number as properties_segment_number
              from
               segmententry_events
              where
              {% condition date_filter %} _PARTITIONTIME {% endcondition %}

              group by
                user_id
                , properties.segment_name
                , properties.segment_number
            )
            b on
              a.user_id = b.user_id
            where a.properties_segment_name <> b.properties_segment_name
       ;;
  }

  measure: uniques {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
  }

  filter: date_filter {
    type: date
  }

  dimension: segment_name_1 {
    type: string
    sql: ${TABLE}.segment_name_1 ;;
  }

  dimension: segment_number_1 {
    type: string
    sql: ${TABLE}.segment_number_1 ;;
  }

  dimension: segment_name_2 {
    type: string
    sql: ${TABLE}.segment_name_2 ;;
  }

  dimension: segment_number_2 {
    type: string
    sql: ${TABLE}.segment_number_2 ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [user_id]
  }
}
