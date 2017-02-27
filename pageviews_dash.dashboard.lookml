- dashboard: pageviews_dash
  title: Pageviews Dash
  layout: tile
  tile_size: 100

  filters:
    - name: date_filter
      type: date_filter

  elements:
    - name: add_a_unique_name_1488213331
      title: Pageviews by Day
      type: looker_column
      model: permutive
      explore: article_pageview_events
      dimensions: [article_pageview_events.event_date]
      fill_fields: [article_pageview_events.event_date]
      listen:
        date_filter: article_pageview_events.event_date
      measures: [article_pageview_events.pageviews]
      sorts: [article_pageview_events.event_date]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_null_points: true
      point_style: none
      interpolation: linear
      series_types: {}
      column_spacing_ratio: ''
      column_group_spacing_ratio: ''
