- dashboard: segment_overview_dash
  title: Segment Overview Dash
  layout: grid
  rows:
  - elements: [total_segmented_uniques, pageviews_from_segmented_users, total_engaged_hours]
    height: 100

  - elements: [time_series]
    height: 100

  - elements: [uniques_trending, sessions_trending, pageviews_trending]
    height: 300

  - elements: [session_length]
    height: 100

  - elements: [avg_engaged_time, length_percentage, session_length_grouped]
    height: 300

  - elements: [pageviews]
    height: 100

  - elements: [avg_pageviews_per_sessions_segment, percent_sessions_pgviews, sessions_pageviews_segment]
    height: 300

  - elements: [growth]
    height: 100

  - elements: [cumulative_segment_growth]
    height: 300

  - elements: [new_uniques_in_segment_graph, Cumulative_Uniques, Totals_Overview]
    height: 300

  filters:
    - name: date_filter
      type: date_filter
      default_value: '30 days'


    - name: segment_name_filter
      title: 'Segment Name'
      type: field_filter
      explore: segmententry_events
      field: segmententry_events.properties__segment_name
      default_value: 'Everyone'


  elements:
    - name: total_segmented_uniques
      title: Segmented Uniques
      type: single_value
      model: permutive
      explore: segmententry_events
      dimensions: [segmententry_events.properties__segment_name]
      measures: [segmententry_events.uniques]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [segmententry_events.uniques desc, segmententry_events.properties__segment_name]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      custom_color: "#224c8b"
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
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
      single_value_title: Segmented Uniques



    - name: pageviews_from_segmented_users
      title: Pageviews
      type: single_value
      model: permutive
      explore: pageviewengagement_events
      measures: [pageviewengagement_events.pageviews]
      listen:
        date_filter: pageviewengagement_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      custom_color: "#224c8b"
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      single_value_title: Pageviews




    - name: total_engaged_hours
      title: "Engaged Time in Hours"
      type: single_value
      model: permutive
      explore: pageviewengagement_events
      measures: [pageviewengagement_events.engaged_time_hours]
      listen:
        date_filter: pageviewengagement_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      custom_color: "#224d8b"
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      single_value_title: "Engaged Time (Hours)"

    - name: Totals_Overview
      title: Segment Totals Overview Bar
      type: looker_bar
      model: permutive
      explore: pageviewengagement_events
      dimensions: [segmententry_events.properties__segment_name]
      measures: [pageviewengagement_events.uniques, pageviewengagement_events.sessions,
        pageviewengagement_events.pageviews]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [pageviewengagement_events.uniques desc]
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
      series_types: {}
      column_spacing_ratio: 0.5
      column_group_spacing_ratio: 0
      y_axis_labels: []
      y_axis_unpin: false
      x_axis_label: Segment(s)
      series_labels:
        pageviewengagement_events.uniques: Uniques
        pageviewengagement_events.sessions: Sessions
        pageviewengagement_events.pageviews: Pageviews

    - name: new_uniques_in_segment_graph
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
      y_axis_gridlines: false
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: false
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
      series_types:
      __FILE: permutive/segment_overview_dash.dashboard.lookml
      __LINE_NUM: 286
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

    - name: Cumulative_Uniques
      title: Segment Uniques Growth
      type: looker_line
      model: permutive
      explore: segmententry_events
      dimensions: [segmententry_events.properties__segment_name, segmententry_events.time_date]
      pivots: [segmententry_events.properties__segment_name]
      fill_fields: [segmententry_events.time_date]
      measures: [segmententry_events.cumulative_uniques]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [segmententry_events.time_date, segmententry_events.properties__segment_name 0]
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
      show_null_points: true
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

    - name: session_length
      type: text
      title_text: Session Length

    - name: avg_engaged_time
      title: Average Engaged Time per Session by Segment
      type: looker_bar
      model: permutive
      explore: pageviewengagement_events
      dimensions: [segmententry_events.properties__segment_name]
      measures: [pageviewengagement_events.average_engaged_time_per_session]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      filters:
        pageviewengagement_events.segments: NOT NULL
      sorts: [pageviewengagement_events.average_engaged_time_per_session desc]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_null_points: true
      point_style: none
      interpolation: linear
      series_types: {}
      show_value_labels: true
      label_color: [black]

    - name: length_percentage
      title: Percent of Sessions by Length and Segment
      type: looker_bar
      model: permutive
      explore: pageviewengagement_events
      dimensions: [pageviewengagement_session_facts.engaged_time_tier, segmententry_events.properties__segment_name]
      pivots: [pageviewengagement_session_facts.engaged_time_tier]
      measures: [pageviewengagement_events.sessions]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      filters:
        pageviewengagement_events.segments: NOT NULL
        pageviewengagement_session_facts.engaged_time_tier: "-Undefined"
      sorts: [pageviewengagement_session_facts.engaged_time_tier, pageviewengagement_events.sessions desc 0]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: percent
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
      ordering: none
      show_null_labels: false
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

    - name: session_length_grouped
      title: Sessions by Length and Segment
      type: looker_column
      model: permutive
      explore: pageviewengagement_events
      dimensions: [pageviewengagement_session_facts.engaged_time_tier, segmententry_events.properties__segment_name]
      pivots: [segmententry_events.properties__segment_name]
      measures: [pageviewengagement_events.sessions]
      filters:
        pageviewengagement_events.segments: NOT NULL
        pageviewengagement_session_facts.engaged_time_tier: "-Undefined"
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [pageviewengagement_session_facts.engaged_time_tier, pageviewengagement_events.sessions desc 0,
        segmententry_events.properties__segment_name]
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
      ordering: none
      show_null_labels: false
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

    - name: pageviews
      type: text
      title_text: Pageviews

    - name: avg_pageviews_per_sessions_segment
      title: Average Pageviews per Session by Segment
      type: looker_bar
      model: permutive
      explore: pageviewengagement_events
      dimensions: [segmententry_events.properties__segment_name]
      measures: [pageviewengagement_events.average_pageviews_per_session]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [pageviewengagement_events.average_pageviews_per_session desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      label_color: [black]

    - name: percent_sessions_pgviews
      title: Percent of Sessions by Pageviews and Segment
      type: looker_bar
      model: permutive
      explore: pageviewengagement_events
      dimensions: [segmententry_events.properties__segment_name, pageviewengagement_session_facts.pageviews_tier]
      pivots: [pageviewengagement_session_facts.pageviews_tier]
      measures: [pageviewengagement_events.sessions]
      filters:
        pageviewengagement_session_facts.pageviews_tier: "-Undefined"
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      sorts: [pageviewengagement_events.sessions desc 0, pageviewengagement_session_facts.pageviews_tier]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: percent
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}

    - name: sessions_pageviews_segment
      title: Sessions by Pageviews and Segment
      type: looker_column
      model: permutive
      explore: pageviewengagement_events
      dimensions: [segmententry_events.properties__segment_name, pageviewengagement_session_facts.pageviews_tier]
      pivots: [segmententry_events.properties__segment_name]
      measures: [pageviewengagement_events.sessions]
      listen:
        date_filter: segmententry_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      filters:
        pageviewengagement_session_facts.pageviews_tier: "-Undefined"
      sorts: [pageviewengagement_session_facts.pageviews_tier]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}

    - name: growth
      type: text
      title_text: Growth

    - name: cumulative_segment_growth
      title: Cumulative Segment Growth
      type: looker_line
      model: permutive
      explore: segment_entry_and_exit_events
      dimensions: [segment_entry_and_exit_events.event_date, segment_entry_and_exit_events.properties_segment_name]
      pivots: [segment_entry_and_exit_events.properties_segment_name]
      fill_fields: [segment_entry_and_exit_events.event_date]
      measures: [segment_entry_and_exit_events.segment_growth_uniques]
      listen:
        date_filter: segment_entry_and_exit_events.event_date
        segment_name_filter: segment_entry_and_exit_events.properties_segment_name
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

    - name: uniques_trending
      title: Uniques
      type: looker_line
      model: permutive
      explore: pageviewengagement_events
      dimensions: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name]
      pivots: [segmententry_events.properties__segment_name]
      fill_fields: [pageviewengagement_events.time_date]
      listen:
        date_filter: pageviewengagement_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      measures: [pageviewengagement_events.uniques]
      sorts: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name 0]
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

    - name: pageviews_trending
      title: Pageviews
      type: looker_line
      model: permutive
      explore: pageviewengagement_events
      dimensions: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name]
      pivots: [segmententry_events.properties__segment_name]
      fill_fields: [pageviewengagement_events.time_date]
      listen:
        date_filter: pageviewengagement_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      measures: [pageviewengagement_events.pageviews]
      sorts: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name 0]
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

    - name: sessions_trending
      title: Sessions
      type: looker_line
      model: permutive
      explore: pageviewengagement_events
      dimensions: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name]
      pivots: [segmententry_events.properties__segment_name]
      fill_fields: [pageviewengagement_events.time_date]
      listen:
        date_filter: pageviewengagement_events.time_date
        segment_name_filter: segmententry_events.properties__segment_name
      measures: [pageviewengagement_events.sessions]
      sorts: [pageviewengagement_events.time_date, segmententry_events.properties__segment_name 0]
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

    - name: time_series
      type: text
      title_text: Time Series
