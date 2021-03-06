view: segment_facts {
  derived_table: {
    sql: select
      properties.segment_number as properties_segment_number,
      properties.segment_name as name
      FROM
      segmententry_events
      where
      {% condition pageviewengagement_events.partition_date %} _PARTITIONTIME {% endcondition %}
      and properties.segment_number is not null
      group by 1,2
       ;;
  }

  dimension: properties_segment_number {
    type: number
    hidden: yes
    sql: ${TABLE}.properties_segment_number ;;
  }

  dimension: segment_name {
    type: string
    view_label: "Segments"
    sql: ${TABLE}.name ;;
  }

}
