- dashboard: bids_overview
  title: Bids Overview
  layout: grid
  rows:
  - elements: [total_bids, average_price, bid_volume]
    height: 100

  - elements: [bid_count_by_date_and_format, bid_volume_by_format]
    height: 300

  - elements: [avg_price_by_format, avg_price_highest_spending_advertisers]
    height: 300

  - elements: [top_bidders]
    height: 300

  - elements: [domain_metrics]
    height: 500


  filters:

  - name: date_filter
    type: date_filter
    default_value: '7 days'

  - name: date_group
    type: field_filter
    explore: rtabid_events
    field: rtabid_events.date_group
    default_value: 'Hour'

  - name: format
    type: field_filter
    explore: rtabid_events
    field: rtabid_events.properties__format

  elements:
    - name: total_bids
      title: Total Bids
      type: single_value
      model: permutive
      explore: rtabid_events
      measures: [rtabid_events.total_bids]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      show_null_points: false
      point_style: none
      interpolation: linear
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

    - name: average_price
      title: Average Price
      type: single_value
      model: permutive
      explore: rtabid_events
      measures: [rtabid_events.average_price]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      show_null_points: false
      point_style: none
      interpolation: linear
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

    - name: bid_count_by_date_and_format
      title: Total Bids by Format
      type: looker_area
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.dynamic_date_group, rtabid_events.properties__format]
      pivots: [rtabid_events.properties__format]
      measures: [rtabid_events.total_bids]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
        date_group: rtabid_events.date_group
      sorts: [rtabid_events.dynamic_date_group desc, rtabid_events.properties__format]
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

    - name: bid_volume_by_format
      title: Bid Volume by Format
      type: looker_area
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.dynamic_date_group, rtabid_events.properties__format]
      pivots: [rtabid_events.properties__format]
      measures: [rtabid_events.bid_volume]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
        date_group: rtabid_events.date_group
      sorts: [rtabid_events.dynamic_date_group desc, rtabid_events.properties__format]
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

    - name: avg_price_by_format
      title: Average Price by Format
      type: looker_line
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.dynamic_date_group, rtabid_events.properties__format]
      pivots: [rtabid_events.properties__format]
      measures: [rtabid_events.average_price]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
        date_group: rtabid_events.date_group
      sorts: [rtabid_events.dynamic_date_group desc, rtabid_events.properties__format]
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

    - name: bid_volume
      title: Bid Volume
      type: single_value
      model: permutive
      explore: rtabid_events
      measures: [rtabid_events.bid_volume]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
      limit: '10'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      show_null_points: false
      point_style: none
      interpolation: linear
      series_types: {}
      series_labels:
        rtabid_events.properties_advertiser: Advertiser

    - name: avg_price_highest_spending_advertisers
      title: Average Price over Time for Highest Spending Advertisers
      type: looker_line
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.properties_advertiser, rtabid_events.dynamic_date_group]
      pivots: [rtabid_events.properties_advertiser]
      measures: [rtabid_events.average_price]
      filters:
        advertiser_facts.advertiser_rank: "<=10"
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
        date_group: rtabid_events.date_group
      sorts: [rtabid_events.dynamic_date_group desc, rtabid_events.properties_advertiser]
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
      show_null_points: false
      point_style: none
      interpolation: linear
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

    - name: top_bidders
      title: Top Bidders
      type: table
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.properties_advertiser]
      measures: [rtabid_events.total_bids, rtabid_events.average_price]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
      sorts: [rtabid_events.total_bids desc]
      limit: '10'
      column_limit: '50'
      query_timezone: America/Los_Angeles
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
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      show_null_points: false
      point_style: none
      interpolation: linear
      series_types: {}
      series_labels:
        rtabid_events.properties_advertiser: Advertiser

    - name: domain_metrics
      title: Domain Metrics
      type: looker_column
      model: permutive
      explore: rtabid_events
      dimensions: [rtabid_events.properties__client__domain]
      measures: [rtabid_events.bid_volume, rtabid_events.average_price, rtabid_events.total_bids]
      listen:
        date_filter: rtabid_events.partition_date
        format: rtabid_events.properties__format
      sorts: [rtabid_events.bid_volume desc]
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
      series_types: {}
      hidden_fields:
      hide_legend: false
      y_axis_orientation: [left, right, right]
