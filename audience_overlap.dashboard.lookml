- dashboard: audience_overlap
  title: Audience Overlap
  layout: grid
  rows:
  - elements: [segment_overlap]
    height: 700

  filters:
  - name: date_filter
    type: date_filter
    default_value: '7 days'

  elements:
  - name: segment_overlap
    title: Segments Overlap
    type: table
    model: permutive
    explore: segment_overlap
    dimensions: [segment_overlap.segment_number_1, segment_overlap.segment_number_2]
    pivots: [segment_overlap.segment_number_2]
    measures: [segment_overlap.uniques]
    listen:
      date_filter: segment_overlap.date_filter
    filters:
      segment_overlap.uniques: ">9"
    sorts: [segment_overlap.segment_number_1, segment_overlap.segment_number_2 0]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to White to Green, colors: ["#F36254",
            "#FFFFFF", "#4FBC89"], __FILE: permutive/audience_overlap.dashboard.lookml,
          __LINE_NUM: 40}, bold: false, italic: false, strikethrough: false, __FILE: permutive/audience_overlap.dashboard.lookml,
        __LINE_NUM: 39}]
