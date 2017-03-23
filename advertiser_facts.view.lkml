view: advertiser_facts {
  derived_table: {
    sql: SELECT advertiser
        , total_price_overall
        ,  rank() over ( order by total_price_overall desc) as advertiser_rank
        FROM
        (SELECT
                  properties.advertiser AS advertiser,
                  SUM(properties.price) AS total_price_overall

          FROM burda_forward.rtabid_events
          WHERE
          {% condition rtabid_events.partition_date %} _PARTITIONTIME {% endcondition %}
          GROUP BY Advertiser)
       ;;
  }

  dimension: advertiser {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: total_price_overall {
    type: number
    sql: ${TABLE}.total_price_overall ;;
  }

  dimension: advertiser_rank {
    type:  number
    sql: ${TABLE}.advertiser_rank ;;
  }

}
