
library(shiny)

# =========================
# UI - GOV UK Design System
# =========================

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      /* GOV UK Design System Colors and Typography */
      @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600;700&display=swap');

      * {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
      }

      body {
        background-color: #f3f2f1;
        margin: 0;
        padding: 0;
      }

      /* GOV UK Header */
      .govuk-header {
        background-color: #0b0c0c;
        padding: 10px 0;
        border-bottom: 10px solid #1d70b8;
      }

      .govuk-header__container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
      }

      .govuk-header__logo {
        display: inline-block;
      }

      .govuk-header__logo-text {
        color: #ffffff;
        font-size: 30px;
        font-weight: 700;
        text-decoration: none;
      }

      .govuk-header__logo-text:hover {
        text-decoration: underline;
        color: #ffffff;
      }

      /* Main content */
      .govuk-main-wrapper {
        max-width: 1200px;
        margin: 0 auto;
        padding: 30px 15px;
      }

      .govuk-heading-xl {
        font-size: 48px;
        font-weight: 700;
        color: #0b0c0c;
        margin-bottom: 30px;
        margin-top: 0;
      }

      .govuk-heading-l {
        font-size: 36px;
        font-weight: 700;
        color: #0b0c0c;
        margin-bottom: 20px;
      }

      .govuk-heading-m {
        font-size: 24px;
        font-weight: 700;
        color: #0b0c0c;
        margin-bottom: 15px;
      }

      .govuk-body {
        font-size: 19px;
        color: #0b0c0c;
        line-height: 1.5;
      }

      /* GOV UK Buttons */
      .govuk-button {
        font-family: 'Source Sans Pro', Arial, sans-serif;
        font-size: 19px;
        font-weight: 600;
        padding: 12px 20px;
        border: none;
        border-radius: 0;
        cursor: pointer;
        display: inline-block;
        text-decoration: none;
        margin-right: 15px;
        margin-bottom: 15px;
        box-shadow: 0 2px 0 #00401e;
        position: relative;
        top: 0;
      }

      .govuk-button:active {
        top: 2px;
        box-shadow: none;
      }

      .govuk-button--primary {
        background-color: #00703c;
        color: #ffffff;
        box-shadow: 0 2px 0 #002d18;
      }

      .govuk-button--primary:hover {
        background-color: #005a30;
        color: #ffffff;
      }

      .govuk-button--secondary {
        background-color: #f3f2f1;
        color: #0b0c0c;
        box-shadow: 0 2px 0 #929191;
      }

      .govuk-button--secondary:hover {
        background-color: #dbdad9;
        color: #0b0c0c;
      }

      .govuk-button--blue {
        background-color: #1d70b8;
        color: #ffffff;
        box-shadow: 0 2px 0 #003078;
      }

      .govuk-button--blue:hover {
        background-color: #003078;
        color: #ffffff;
      }

      /* Panel/Card */
      .govuk-panel {
        background-color: #ffffff;
        padding: 25px;
        margin-bottom: 30px;
        border-left: 5px solid #1d70b8;
      }

      .govuk-panel--confirmation {
        border-left-color: #00703c;
      }

      /* Input */
      .govuk-input {
        font-size: 19px;
        padding: 8px;
        border: 2px solid #0b0c0c;
        width: 100%;
        max-width: 300px;
      }

      .govuk-label {
        font-size: 19px;
        font-weight: 600;
        display: block;
        margin-bottom: 5px;
      }

      .govuk-hint {
        font-size: 16px;
        color: #505a5f;
        margin-bottom: 10px;
      }

      /* Status box */
      .govuk-inset-text {
        border-left: 10px solid #b1b4b6;
        padding: 15px;
        margin: 20px 0;
        background-color: #ffffff;
      }

      /* Dashboard table styling */
      .dashboard-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
      }

      .dashboard-table th {
        background-color: #0b0c0c;
        color: #ffffff;
        padding: 12px 15px;
        text-align: left;
        font-weight: 600;
      }

      .dashboard-table td {
        padding: 12px 15px;
        border-bottom: 1px solid #b1b4b6;
      }

      .dashboard-table tr:nth-child(even) {
        background-color: #f3f2f1;
      }

      .dashboard-table tr:hover {
        background-color: #e8f4ea;
      }

      .positive {
        color: #00703c;
        font-weight: 600;
      }

      .negative {
        color: #d4351c;
        font-weight: 600;
      }

      .neutral {
        color: #505a5f;
      }

      /* Top 10 list */
      .top-ten-list {
        list-style: none;
        padding: 0;
        margin: 0;
        counter-reset: item;
      }

      .top-ten-list li {
        padding: 15px;
        margin-bottom: 10px;
        background-color: #ffffff;
        border-left: 4px solid #1d70b8;
        position: relative;
        padding-left: 50px;
        font-size: 18px;
      }

      .top-ten-list li::before {
        counter-increment: item;
        content: counter(item);
        position: absolute;
        left: 15px;
        font-weight: 700;
        font-size: 20px;
        color: #1d70b8;
      }

      /* Button row */
      .button-row {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 30px;
      }

      /* Two column layout */
      .two-col {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
      }

      @media (max-width: 768px) {
        .two-col {
          grid-template-columns: 1fr;
        }
      }

      /* Footer */
      .govuk-footer {
        background-color: #f3f2f1;
        border-top: 1px solid #b1b4b6;
        padding: 25px 0;
        margin-top: 50px;
      }

      .govuk-footer__meta {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
        color: #505a5f;
        font-size: 16px;
      }

      /* Progress bar styling */
      .shiny-notification {
        background-color: #ffffff;
        border-left: 5px solid #1d70b8;
        padding: 15px;
      }

      .progress-bar {
        background-color: #00703c !important;
      }
    "))
  ),

  # Header
  div(class = "govuk-header",
    div(class = "govuk-header__container",
      div(class = "govuk-header__logo",
        span(class = "govuk-header__logo-text", "Labour Market Statistics Brief")
      )
    )
  ),

  # Main content
  div(class = "govuk-main-wrapper",

    # Settings panel
    div(class = "govuk-panel",
      h2(class = "govuk-heading-m", "Settings"),
      div(
        tags$label(class = "govuk-label", `for` = "manual_month", "Reference month"),
        tags$span(class = "govuk-hint", "Enter in format: nov2025 or 2025-11"),
        tags$input(type = "text", id = "manual_month", class = "govuk-input shiny-bound-input", value = "")
      )
    ),

    # Action buttons
    div(class = "govuk-panel",
      h2(class = "govuk-heading-m", "Actions"),
      div(class = "button-row",
        actionButton("preview_dashboard", "Preview Dashboard", class = "govuk-button govuk-button--blue"),
        actionButton("preview_topten", "Preview Top Ten Stats", class = "govuk-button govuk-button--blue"),
        downloadButton("download_word", "Download Word Doc", class = "govuk-button govuk-button--primary"),
        downloadButton("download_excel", "Download Excel", class = "govuk-button govuk-button--primary")
      )
    ),

    # Status
    div(class = "govuk-inset-text",
      strong("Status: "),
      textOutput("status", inline = TRUE)
    ),

    # Preview sections
    div(class = "two-col",

      # Dashboard preview
      div(class = "govuk-panel",
        h2(class = "govuk-heading-m", "Dashboard Preview"),
        uiOutput("dashboard_preview")
      ),

      # Top Ten preview
      div(class = "govuk-panel",
        h2(class = "govuk-heading-m", "Top Ten Stats Preview"),
        uiOutput("topten_preview")
      )
    )
  ),

  # Footer
  div(class = "govuk-footer",
    div(class = "govuk-footer__meta",
      "Labour Market Statistics Brief Generator | Department for Business and Trade"
    )
  )
)

# =========================
# SERVER
# =========================

server <- function(input, output, session) {

  # Paths
  config_path       <- "utils/config.R"
  calculations_path <- "utils/calculations.R"
  word_script_path  <- "utils/word_output.R"
  excel_script_path <- "sheets/excel_audit.R"
  summary_path      <- "sheets/summary.R"
  top_ten_path      <- "sheets/top_ten_stats.R"
  template_path     <- "utils/DB.docx"

  # Check for required files at startup
  missing_files <- c()
  if (!file.exists(config_path)) missing_files <- c(missing_files, "config.R")
  if (!file.exists(calculations_path)) missing_files <- c(missing_files, "calculations.R")
  if (!file.exists(word_script_path)) missing_files <- c(missing_files, "word_output.R")
  if (!file.exists(excel_script_path)) missing_files <- c(missing_files, "excel_audit.R")
  if (!file.exists(template_path)) missing_files <- c(missing_files, "DB.docx (Word template)")

  initial_status <- if (length(missing_files) > 0) {
    paste("Warning: Missing files:", paste(missing_files, collapse = ", "))
  } else {
    "Ready. Select an action above."
  }

  status_text <- reactiveVal(initial_status)
  output$status <- renderText(status_text())

  # Load default manual_month from config
  observe({
    if (file.exists(config_path)) {
      tryCatch({
        source(config_path, local = FALSE)
        if (exists("manual_month")) {
          updateTextInput(session, "manual_month", value = manual_month)
        }
      }, error = function(e) NULL)
    }
  })

  # Reactive values for previews
  dashboard_data <- reactiveVal(NULL)
  topten_data <- reactiveVal(NULL)

  # =========================
  # PREVIEW: DASHBOARD
  # =========================
  observeEvent(input$preview_dashboard, {
    status_text("Loading dashboard data...")

    result <- tryCatch({
      # Check required files
      if (!file.exists(calculations_path)) {
        return(list(success = FALSE, error = "calculations.R not found"))
      }

      # Source config and calculations in global env
      if (file.exists(config_path)) {
        tryCatch(source(config_path, local = FALSE), error = function(e) NULL)
      }

      if (nzchar(input$manual_month)) {
        manual_month <<- tolower(input$manual_month)
      }

      source(calculations_path, local = FALSE)

      gv <- function(name) {
        if (exists(name, inherits = TRUE)) get(name, inherits = TRUE) else NA_real_
      }

      # Build dashboard data with formatting info
      metrics <- list(
        list(name = "Employment 16+ (000s)", cur = gv("emp16_cur")/1000, dq = gv("emp16_dq")/1000, dy = gv("emp16_dy")/1000, dc = gv("emp16_dc")/1000, de = gv("emp16_de")/1000, invert = FALSE, type = "count"),
        list(name = "Employment rate 16-64 (%)", cur = gv("emp_rt_cur"), dq = gv("emp_rt_dq"), dy = gv("emp_rt_dy"), dc = gv("emp_rt_dc"), de = gv("emp_rt_de"), invert = FALSE, type = "rate"),
        list(name = "Unemployment 16+ (000s)", cur = gv("unemp16_cur")/1000, dq = gv("unemp16_dq")/1000, dy = gv("unemp16_dy")/1000, dc = gv("unemp16_dc")/1000, de = gv("unemp16_de")/1000, invert = TRUE, type = "count"),
        list(name = "Unemployment rate 16+ (%)", cur = gv("unemp_rt_cur"), dq = gv("unemp_rt_dq"), dy = gv("unemp_rt_dy"), dc = gv("unemp_rt_dc"), de = gv("unemp_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Inactivity 16-64 (000s)", cur = gv("inact_cur")/1000, dq = gv("inact_dq")/1000, dy = gv("inact_dy")/1000, dc = gv("inact_dc")/1000, de = gv("inact_de")/1000, invert = TRUE, type = "count"),
        list(name = "Inactivity 50-64 (000s)", cur = gv("inact5064_cur")/1000, dq = gv("inact5064_dq")/1000, dy = gv("inact5064_dy")/1000, dc = gv("inact5064_dc")/1000, de = gv("inact5064_de")/1000, invert = TRUE, type = "count"),
        list(name = "Inactivity rate 16-64 (%)", cur = gv("inact_rt_cur"), dq = gv("inact_rt_dq"), dy = gv("inact_rt_dy"), dc = gv("inact_rt_dc"), de = gv("inact_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Inactivity rate 50-64 (%)", cur = gv("inact5064_rt_cur"), dq = gv("inact5064_rt_dq"), dy = gv("inact5064_rt_dy"), dc = gv("inact5064_rt_dc"), de = gv("inact5064_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Vacancies (000s)", cur = gv("vac_cur"), dq = gv("vac_dq"), dy = gv("vac_dy"), dc = gv("vac_dc"), de = gv("vac_de"), invert = NA, type = "exempt"),
        list(name = "Payroll employees (000s)", cur = gv("payroll_cur"), dq = gv("payroll_dq"), dy = gv("payroll_dy"), dc = gv("payroll_dc"), de = gv("payroll_de"), invert = FALSE, type = "exempt"),
        list(name = "Wages (total pay, cash)", cur = gv("latest_wages"), dq = gv("wages_change_q"), dy = gv("wages_change_y"), dc = gv("wages_change_covid"), de = gv("wages_change_election"), invert = FALSE, type = "wages"),
        list(name = "Wages (total pay, CPI adj)", cur = gv("latest_wages_cpi"), dq = gv("wages_cpi_change_q"), dy = gv("wages_cpi_change_y"), dc = gv("wages_cpi_change_covid"), de = gv("wages_cpi_change_election"), invert = FALSE, type = "wages")
      )

      list(success = TRUE, data = metrics)

    }, error = function(e) {
      list(success = FALSE, error = e$message)
    })

    if (isTRUE(result$success)) {
      dashboard_data(result$data)
      status_text("Dashboard preview loaded successfully.")
    } else {
      status_text(paste("Error loading dashboard:", result$error))
    }
  })

  # =========================
  # PREVIEW: TOP TEN
  # =========================
  observeEvent(input$preview_topten, {
    status_text("Loading top ten stats...")

    result <- tryCatch({
      # Check required files
      if (!file.exists(calculations_path)) {
        return(list(success = FALSE, error = "calculations.R not found"))
      }
      if (!file.exists(top_ten_path)) {
        return(list(success = FALSE, error = "top_ten_stats.R not found"))
      }

      if (file.exists(config_path)) {
        tryCatch(source(config_path, local = FALSE), error = function(e) NULL)
      }

      if (nzchar(input$manual_month)) {
        manual_month <<- tolower(input$manual_month)
      }

      source(calculations_path, local = FALSE)
      source(top_ten_path, local = FALSE)

      if (exists("generate_top_ten", inherits = TRUE)) {
        top10 <- generate_top_ten()
        list(success = TRUE, data = top10)
      } else {
        list(success = FALSE, error = "generate_top_ten function not found")
      }

    }, error = function(e) {
      list(success = FALSE, error = e$message)
    })

    if (isTRUE(result$success)) {
      topten_data(result$data)
      status_text("Top ten stats loaded successfully.")
    } else {
      status_text(paste("Error loading top ten:", result$error))
    }
  })

  # =========================
  # DOWNLOAD: WORD
  # =========================
  output$download_word <- downloadHandler(
    filename = function() {
      paste0("Labour_Market_Briefing_", Sys.Date(), ".docx")
    },
    content = function(file) {
      status_text("Generating Word document...")

      # Check template exists
      if (!file.exists(template_path)) {
        status_text("Error: Word template not found at utils/DB.docx")
        # Create a minimal error document
        if (requireNamespace("officer", quietly = TRUE)) {
          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Error: Word template not found", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Expected template at:", template_path))
          doc <- officer::body_add_par(doc, "Please ensure the template file exists before generating the briefing.")
          print(doc, target = file)
        } else {
          writeLines("Error: Word template not found and officer package not available", file)
        }
        return()
      }

      tryCatch({
        source(word_script_path, local = FALSE)

        generate_word_output(
          template_path = template_path,
          output_path = file,
          calculations_path = calculations_path,
          config_path = config_path,
          summary_path = summary_path,
          top_ten_path = top_ten_path,
          manual_month_override = if (nzchar(input$manual_month)) input$manual_month else NULL,
          verbose = TRUE
        )

        status_text("Word document generated successfully.")

      }, error = function(e) {
        status_text(paste("Error generating Word:", e$message))
        # Create error document instead of failing
        if (requireNamespace("officer", quietly = TRUE)) {
          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Error generating document", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Error:", e$message))
          print(doc, target = file)
        } else {
          writeLines(paste("Error:", e$message), file)
        }
      })
    }
  )

  # =========================
  # DOWNLOAD: EXCEL
  # =========================
  output$download_excel <- downloadHandler(
    filename = function() {
      paste0("LM_Stats_Audit_", Sys.Date(), ".xlsx")
    },
    content = function(file) {
      status_text("Generating Excel workbook...")

      # Check required files exist
      if (!file.exists(excel_script_path)) {
        status_text("Error: Excel script not found")
        if (requireNamespace("openxlsx", quietly = TRUE)) {
          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(Error = "Excel script not found"))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
        }
        return()
      }

      tryCatch({
        source(excel_script_path, local = FALSE)

        create_audit_workbook(
          output_path = file,
          calculations_path = calculations_path,
          config_path = config_path,
          verbose = TRUE
        )

        status_text("Excel workbook generated successfully.")

      }, error = function(e) {
        status_text(paste("Error generating Excel:", e$message))
        # Create error workbook instead of failing
        if (requireNamespace("openxlsx", quietly = TRUE)) {
          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(
            Error = c("Error generating workbook:", e$message),
            stringsAsFactors = FALSE
          ))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
        }
      })
    }
  )

  # =========================
  # RENDER: DASHBOARD PREVIEW
  # =========================
  output$dashboard_preview <- renderUI({
    metrics <- dashboard_data()

    if (is.null(metrics)) {
      return(tags$p(class = "govuk-body", "Click 'Preview Dashboard' to load the dashboard data."))
    }

    # Format value with color class
    format_change <- function(val, invert, type) {
      if (is.na(val)) return(tags$span(class = "neutral", "-"))

      # Determine color class
      if (is.na(invert)) {
        css_class <- "neutral"
      } else if (val > 0) {
        css_class <- if (invert) "negative" else "positive"
      } else if (val < 0) {
        css_class <- if (invert) "positive" else "negative"
      } else {
        css_class <- "neutral"
      }

      # Format the number
      formatted <- if (type == "rate") {
        sign <- if (val > 0) "+" else ""
        paste0(sign, round(val, 1), "pp")
      } else if (type == "wages") {
        sign <- if (val > 0) "+" else ""
        paste0(sign, "\u00A3", round(val))
      } else {
        sign <- if (val > 0) "+" else ""
        paste0(sign, format(round(val), big.mark = ","))
      }

      tags$span(class = css_class, formatted)
    }

    format_current <- function(val, type) {
      if (is.na(val)) return("-")
      if (type == "rate") {
        paste0(round(val, 1), "%")
      } else if (type == "wages") {
        paste0(round(val, 1), "%")
      } else {
        format(round(val), big.mark = ",")
      }
    }

    # Build table rows
    rows <- lapply(metrics, function(m) {
      tags$tr(
        tags$td(m$name),
        tags$td(format_current(m$cur, m$type)),
        tags$td(format_change(m$dq, m$invert, m$type)),
        tags$td(format_change(m$dy, m$invert, m$type)),
        tags$td(format_change(m$dc, m$invert, m$type)),
        tags$td(format_change(m$de, m$invert, m$type))
      )
    })

    tags$table(class = "dashboard-table",
      tags$thead(
        tags$tr(
          tags$th("Metric"),
          tags$th("Current"),
          tags$th("vs Quarter"),
          tags$th("vs Year"),
          tags$th("vs Covid"),
          tags$th("vs Election")
        )
      ),
      tags$tbody(rows)
    )
  })

  # =========================
  # RENDER: TOP TEN PREVIEW
  # =========================
  output$topten_preview <- renderUI({
    top10 <- topten_data()

    if (is.null(top10)) {
      return(tags$p(class = "govuk-body", "Click 'Preview Top Ten Stats' to load the statistics."))
    }

    items <- lapply(1:10, function(i) {
      line <- top10[[paste0("line", i)]]
      if (is.null(line) || line == "") line <- "(No data)"
      tags$li(line)
    })

    tags$ol(class = "top-ten-list", items)
  })
}

shinyApp(ui, server)
