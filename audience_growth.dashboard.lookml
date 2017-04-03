- dashboard: audience_growth
  title: Audience Growth
  layout: grid

  rows:

  - elements: [cumulative_segment_growth]
    height: 400

  filters:

  - name: date_filter
    type: date_filter
    default_value: '7 days'


  - name: segment_name_filter
    title: 'Segment Name'
    type: field_filter
    explore: segmententry_events
    field: segmententry_events.properties__segment_name
  #       default_value: 'Everyone'

  - name: date_group
    type: field_filter
    explore: pageviewengagement_events
    field: pageviewengagement_events.date_group
    default_value: 'Date'

  elements:
    - name: cumulative_segment_growth
      title: Cumulative Segment Growth
      type: looker_line
      model: permutive
      explore: segment_entry_and_exit_events
      dimensions: [segment_entry_and_exit_events.dynamic_date_group, segment_entry_and_exit_events.properties_segment_name]
      pivots: [segment_entry_and_exit_events.properties_segment_name]
#       fill_fields: [segment_entry_and_exit_events.event_date]
      measures: [segment_entry_and_exit_events.segment_growth_uniques]
      filters:
        segment_entry_and_exit_events.segment_growth_uniques: ">=0"
      listen:
        date_filter: segment_entry_and_exit_events.partition_date
        segment_name_filter: segment_entry_and_exit_events.properties_segment_name
        date_group: segment_entry_and_exit_events.date_group
      dynamic_fields:
      - table_calculation: cumulative_segment_growth
        label: Cumulative Segment Growth
        expression: running_total(${segment_entry_and_exit_events.segment_growth_uniques})
        value_format:
        value_format_name:
      sorts: [segment_entry_and_exit_events.event_date, segment_entry_and_exit_events.properties_segment_name 0]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      hidden_fields: [segment_entry_and_exit_events.segment_growth_uniques]
