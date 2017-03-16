connection: "permutive"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.6
# NOTE: for BigQuery specific considerations

explore: article_pageview_events {
  join: pageviewengagement_events {
    sql_on: ${article_pageview_events.properties_visit_id} = ${pageviewengagement_events.properties_visit_id};;
    relationship: one_to_many
#     type: inner
  }
  join: segmententry_events {
    sql_on: ${article_pageview_events.segments} = ${segmententry_events.properties__segment_number} ;;
    relationship: many_to_many
  }
}

explore: brandliftresponse_events {}

explore: hellobrit_events {}

explore: pageviewengagement_events {
  join: segmententry_events {
    sql_on: ${pageviewengagement_events.segments} = ${segmententry_events.properties__segment_number} ;;
    relationship: many_to_many
  }
}

explore: reaction_events {}

explore: segmententry_events {}

explore: segmentexit_events {}

explore: slotclicked_events {}

explore: slotrendered_events {}

explore: viewthrough_events {}
