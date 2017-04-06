- dashboard: ad_unit_dashboard
  title: Ad Unit Dashboard
  layout: grid
  rows:
  - elements: [overview, total_bids_total_cpm_avg_cpm]
    height: 300
  - elements: [avg_cpm_by_ad_unit_code]
    height: 300
  - elements: [bid_count_by_date_and_ad_unit_code]
    height: 300
  - elements: [total_cpm_by_ad_unit_code]
    height: 300

  filters:

  - name: date_filter
    type: date_filter
    default_value: '7 days'

  - name: date_group
    type: field_filter
    explore: prebid_bid_events
    field: prebid_bid_events.date_group
    default_value: 'Hour'

  - name: ad_unit_code
    type: field_filter
    explore: prebid_bid_events
    field: prebid_bid_events.ad_unit_code

  elements:
    - name: overview
      title: Overview
      type: table
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.ad_unit_code]
      measures: [prebid_bid_events.average_cpm, prebid_bid_events.total_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
      sorts: [prebid_bid_events.average_cpm desc]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
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
      series_types: {}

    - name: total_bids_total_cpm_avg_cpm
      title: Total Bids, Total CPM, Average CPM
      type: looker_column
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.ad_unit_code]
      measures: [prebid_bid_events.total_cpm, prebid_bid_events.average_cpm, prebid_bid_events.total_bids]
      filters:
        prebid_bid_events.partition_date: 7 days
        prebid_bid_events.ad_unit_code: ''
      sorts: [prebid_bid_events.total_cpm desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: false
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
      point_style: circle
      series_types:
        __FILE: permutive/bidders_dashboard.dashboard.lookml
        __LINE_NUM: 482
      hidden_fields:
      hide_legend: true
      y_axis_orientation: [left, right, right]

    - name: avg_cpm_by_ad_unit_code
      title: Average CPM
      type: looker_line
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.dynamic_date_group, prebid_bid_events.ad_unit_code]
      pivots: [prebid_bid_events.ad_unit_code]
      measures: [prebid_bid_events.average_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group desc, prebid_bid_events.ad_unit_code]
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
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
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

    - name: bid_count_by_date_and_ad_unit_code
      title: Total Bids
      type: looker_area
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.dynamic_date_group, prebid_bid_events.ad_unit_code]
      pivots: [prebid_bid_events.ad_unit_code]
      measures: [prebid_bid_events.total_bids]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group desc, prebid_bid_events.ad_unit_code]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: normal
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
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
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

    - name: total_cpm_by_ad_unit_code
      title: Bid Volume
      type: looker_area
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.dynamic_date_group, prebid_bid_events.ad_unit_code]
      pivots: [prebid_bid_events.ad_unit_code]
      measures: [prebid_bid_events.total_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group desc, prebid_bid_events.ad_unit_code]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: normal
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
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
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
