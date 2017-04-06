- dashboard: bidders_dashboard
  title: Bidders Dashboard
  layout: grid
  rows:
  - elements: [total_bids, average_cpm, total_cpm]
    height: 100

  - elements: [total_bids_line, average_cpm_line, top_bidders]
    height: 300

  - elements: [bids_avg_total]
    height: 400

  - elements: [avg_cpm_highest_spending_bidders]
    height: 400


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
    - name: total_bids
      title: Total Bids
      type: single_value
      model: permutive
      explore: prebid_bid_events
      measures: [prebid_bid_events.total_bids]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
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

    - name: average_cpm
      title: Average CPM
      type: single_value
      model: permutive
      explore: prebid_bid_events
      measures: [prebid_bid_events.average_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
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

    - name: total_cpm
      title: Bid Volume
      type: single_value
      model: permutive
      explore: prebid_bid_events
      measures: [prebid_bid_events.total_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
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
        prebid_bid_events.bidder: Bidder

    - name: total_bids_line
      title: Total Bids
      type: looker_line
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.dynamic_date_group]
      measures: [prebid_bid_events.total_bids]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group]
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
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_types:
        __FILE: permutive/bidders_dashboard.dashboard.lookml
        __LINE_NUM: 238
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: prebid_bid_events.total_bids,
              name: Prebid Bid Events Total Bids}]}]

    - name: average_cpm_line
      title: Average CPM
      type: looker_line
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.dynamic_date_group]
      measures: [prebid_bid_events.average_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group]
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
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: prebid_bid_events.average_cpm,
              name: Average CPM}]}]



    - name: avg_cpm_highest_spending_bidders
      title: Average CPM over Time for Highest Spending Bidders
      type: looker_line
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.bidder, prebid_bid_events.dynamic_date_group]
      pivots: [prebid_bid_events.bidder]
      measures: [prebid_bid_events.average_cpm]
      filters:
        bidder_facts.bidder_rank: "<=10"
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
        date_group: prebid_bid_events.date_group
      sorts: [prebid_bid_events.dynamic_date_group, prebid_bid_events.bidder]
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
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.bidder]
      measures: [prebid_bid_events.total_bids, prebid_bid_events.average_cpm]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
      sorts: [prebid_bid_events.total_bids desc]
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
        prebid_bid_events.bidder: Bidder

    - name: bids_avg_total
      title: Total Bids, Average CPM, Total CPM for Top Bidders
      type: looker_column
      model: permutive
      explore: prebid_bid_events
      dimensions: [prebid_bid_events.bidder]
      measures: [prebid_bid_events.total_cpm, prebid_bid_events.average_cpm, prebid_bid_events.total_bids]
      listen:
        date_filter: prebid_bid_events.partition_date
        ad_unit_code: prebid_bid_events.ad_unit_code
      sorts: [prebid_bid_events.total_cpm desc]
      limit: '10'
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
        __LINE_NUM: 447
      hidden_fields:
      hide_legend: false
      y_axis_orientation: [left, right, right]
