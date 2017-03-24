connection: "permutiveburda"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.6
# NOTE: for BigQuery specific considerations

explore: pageviewengagement_events
{
  label: "Pageview Engagement Events"
  view_label: "Pageview Engagement Events"
  always_filter: {
    filters: {
      field: pageviewengagement_events.partition_date
      value: "7 Days"
    }
  }

  join: segments {
    sql: LEFT JOIN UNNEST(${pageviewengagement_events.segments}) as segments ;;
    relationship: one_to_many
  }

  join: segment_facts {
    view_label: "Pageview Engagement Events"
    sql_on: ${segments.segments} = ${segment_facts.properties_segment_number} ;;
    relationship: one_to_many
  }
  join: pageviewengagement_session_facts {
    view_label: "Sessions"
    sql_on: ${pageviewengagement_events.session_id} = ${pageviewengagement_session_facts.session_id} and
      ${segments.segments} = ${pageviewengagement_session_facts.segments};;
    relationship: many_to_one
  }
}
explore: article_pageview_events {

  join: pageviewengagement_events {
    view_label: "Pageview Engagement Events"
    sql_on: ${article_pageview_events.properties_visit_id} = ${pageviewengagement_events.properties_visit_id};;
    relationship: one_to_many
#     type: inner
  }
  join: segmententry_events {
    view_label: "Segment Entry Events"
    sql_on: ${article_pageview_events.segments} = ${segmententry_events.properties__segment_number} ;;
    relationship: many_to_many
  }
}

explore: segment_entry_and_exit_events {}

explore: segmententry_events {
  label: "Segment Entry Events"
  view_label: "Segment Entry Events"
}

explore:  segment_overlap {
  always_filter: {
    filters: {
      field: date_filter
      value: "7 days"
    }
  }

  }

explore: segmentexit_events {}

explore: rtabid_events {
  label: "RTA Bid Events"
  view_label: "RTA Bid Events"
  always_filter: {
    filters: {
      field: partition_date
      value: "7 days"
    }
  }
  join: advertiser_facts {
    sql_on: ${rtabid_events.properties_advertiser} = ${advertiser_facts.advertiser} ;;
    relationship: many_to_one
  }
}
