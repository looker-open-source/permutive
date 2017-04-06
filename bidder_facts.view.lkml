view: bidder_facts {
  derived_table: {
    sql: SELECT bidder
        , total_price_overall
        ,  rank() over ( order by total_price_overall desc) as bidder_rank
        FROM
        (SELECT
                  properties.advertiser AS bidder,
                  SUM(properties.price) AS total_price_overall

          FROM burda_forward.rtabid_events
          WHERE
          {% condition prebid_bid_events.partition_date %} _PARTITIONTIME {% endcondition %}
          GROUP BY bidder)
       ;;
  }

  dimension: bidder {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.bidder ;;
  }

  dimension: total_price_overall {
    type: number
    sql: ${TABLE}.total_price_overall ;;
  }

  dimension: bidder_rank {
    type:  number
    sql: ${TABLE}.bidder_rank ;;
  }

}
