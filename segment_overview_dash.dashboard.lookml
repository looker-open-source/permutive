- dashboard: segment_overview_dash
  title: Segment Overview Dash
  layout: tile
  tile_size: 100

  filters:
    - name: date_filter
      type: date_filter
      default_value: '7 days'


    - name: segment_name_filter
      title: 'Segment Name'
      type: field_filter
      explore: segmententry_events
      field: segmententry_events.properties__segment_name
      default_value: 'Everyone'



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

    - name: new_uniques_in_segment
      title: New Uniques in Segment
      type: looker_line
      model: permutive
      explore: segmententry_events
      dimensions: [segmententry_events.time_date, segmententry_events.properties__segment_name]
      pivots: [segmententry_events.properties__segment_name]
      fill_fields: [segmententry_events.time_date]
      measures: [segmententry_events.uniques]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [segmententry_events.time_date, segmententry_events.uniques desc 0, segmententry_events.properties__segment_name]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
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
      show_x_axis_ticks: false
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_types: {}
      swap_axes: false
      hide_legend: false
      x_axis_reversed: false
      y_axis_min: ['0']
      y_axis_value_format: "#,###"
      x_axis_label: Date
      y_axis_labels: [New Uniques in Segment]
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
