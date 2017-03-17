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

explore: pageviewengagement_events
{
  label: "Pageview Engagement Events"
  view_label: "Pageview Engagement Events"
  join: segmententry_events {
    view_label: "Segment Entry Events"
    sql_on: ${pageviewengagement_events.segments} = ${segmententry_events.properties__segment_number} ;;
    relationship: many_to_many
  }
  join: pageviewengagement_session_facts {
    view_label: "Pageview Engagement Session Facts"
    sql_on: ${pageviewengagement_events.session_id} = ${pageviewengagement_session_facts.session_id} and
    ${pageviewengagement_events.segments} = ${pageviewengagement_session_facts.segments};;
    relationship: many_to_one
  }
}

explore: segment_entry_and_exit_events {}

explore:  segment_overlap {}

explore: reaction_events {}

explore: segmententry_events {}

explore: segmentexit_events {}

explore: slotclicked_events {}

explore: slotrendered_events {}

explore: viewthrough_events {}
