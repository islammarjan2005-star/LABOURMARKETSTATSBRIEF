# ==============================================================================
# LABOUR MARKET STATISTICS BRIEF - SHINY APPLICATION
# ==============================================================================
# GOV.UK Design System styled application for generating Labour Market briefings
# ==============================================================================

library(shiny)
library(shinyjs)

# ==============================================================================
# UI - GOV.UK DESIGN SYSTEM
# ==============================================================================

ui <- fluidPage(

  useShinyjs(),

  # Page title
  tags$head(
    tags$title("Labour Market Statistics Brief"),
    tags$meta(charset = "utf-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),

    # GOV.UK Design System CSS
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600;700&display=swap');

      *, *::before, *::after { box-sizing: border-box; }
      html, body { margin: 0; padding: 0; min-height: 100vh; }

      body {
        font-family: 'Source Sans Pro', Arial, sans-serif;
        font-size: 19px;
        line-height: 1.31579;
        color: #0b0c0c;
        background-color: #f3f2f1;
      }

      .govuk-header {
        border-bottom: 10px solid #1d70b8;
        color: #ffffff;
        background: #0b0c0c;
      }

      .govuk-header__container {
        position: relative;
        margin-bottom: -10px;
        padding-top: 10px;
        border-bottom: 10px solid #1d70b8;
        max-width: 960px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 15px;
        padding-right: 15px;
      }

      .govuk-header__logotype-text {
        font-weight: 700;
        font-size: 30px;
        line-height: 1;
        color: #ffffff;
      }

      .govuk-header__link {
        text-decoration: none;
        color: #ffffff;
      }

      .govuk-header__service-name {
        display: inline-block;
        margin-bottom: 10px;
        font-weight: 700;
        font-size: 24px;
        color: #ffffff;
      }

      .govuk-width-container {
        max-width: 960px;
        margin: 0 auto;
        padding: 0 15px;
      }

      .govuk-main-wrapper {
        padding: 40px 0;
      }

      .govuk-heading-xl {
        font-weight: 700;
        font-size: 48px;
        margin: 0 0 50px 0;
      }

      .govuk-heading-m {
        font-weight: 700;
        font-size: 24px;
        margin: 0 0 20px 0;
      }

      .govuk-body {
        font-size: 19px;
        margin: 0 0 20px 0;
      }

      .govuk-button {
        font-weight: 400;
        font-size: 19px;
        line-height: 1;
        display: inline-block;
        position: relative;
        padding: 8px 10px 7px;
        border: 2px solid transparent;
        border-radius: 0;
        color: #ffffff;
        background-color: #00703c;
        box-shadow: 0 2px 0 #002d18;
        text-align: center;
        cursor: pointer;
        margin-right: 15px;
        margin-bottom: 15px;
      }

      .govuk-button:hover { background-color: #005a30; }
      .govuk-button:focus {
        border-color: #ffdd00;
        outline: 3px solid transparent;
        box-shadow: inset 0 0 0 1px #ffdd00;
        background-color: #ffdd00;
        color: #0b0c0c;
      }

      .govuk-button--blue {
        background-color: #1d70b8;
        box-shadow: 0 2px 0 #003078;
      }
      .govuk-button--blue:hover { background-color: #003078; }

      .govuk-button--secondary {
        background-color: #f3f2f1;
        box-shadow: 0 2px 0 #929191;
        color: #0b0c0c;
      }
      .govuk-button--secondary:hover { background-color: #dbdad9; }

      .govuk-button.shiny-download-link { text-decoration: none; }

      .govuk-form-group { margin-bottom: 30px; }

      .govuk-label {
        font-weight: 400;
        font-size: 19px;
        display: block;
        margin-bottom: 5px;
      }

      .govuk-hint {
        font-size: 19px;
        margin-bottom: 15px;
        color: #505a5f;
      }

      .govuk-input {
        font-size: 19px;
        width: 100%;
        max-width: 200px;
        height: 40px;
        padding: 5px;
        border: 2px solid #0b0c0c;
        border-radius: 0;
      }

      .govuk-input:focus {
        outline: 3px solid #ffdd00;
        outline-offset: 0;
        box-shadow: inset 0 0 0 2px;
      }

      .govuk-phase-banner {
        padding: 10px 0;
        border-bottom: 1px solid #b1b4b6;
      }

      .govuk-tag {
        font-weight: 700;
        font-size: 16px;
        display: inline-block;
        padding: 5px 8px 4px;
        color: #ffffff;
        background-color: #1d70b8;
        letter-spacing: 1px;
        text-transform: uppercase;
        margin-right: 10px;
      }

      .dashboard-card {
        background-color: #ffffff;
        border: 1px solid #b1b4b6;
        margin-bottom: 20px;
      }

      .dashboard-card__header {
        background-color: #1d70b8;
        color: #ffffff;
        padding: 15px 20px;
        font-weight: 700;
        font-size: 19px;
      }

      .dashboard-card__content { padding: 20px; }

      .govuk-section-break {
        margin: 30px 0;
        border: 0;
        border-bottom: 1px solid #b1b4b6;
      }

      .govuk-grid-row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -15px;
      }

      .govuk-grid-column-one-half {
        width: 50%;
        padding: 0 15px;
      }

      @media (max-width: 768px) {
        .govuk-grid-column-one-half { width: 100%; }
      }

      .govuk-footer {
        padding: 25px 0;
        border-top: 1px solid #b1b4b6;
        background: #f3f2f1;
        text-align: center;
        color: #505a5f;
      }

      .container-fluid { padding: 0 !important; margin: 0 !important; max-width: none !important; }

      /* PROGRESS TRACKER */
      .progress-tracker {
        background: #ffffff;
        border: 2px solid #1d70b8;
        padding: 20px;
        margin-bottom: 20px;
        display: none;
      }

      .progress-tracker.visible { display: block; }

      .progress-tracker__title {
        font-weight: 700;
        font-size: 19px;
        margin: 0 0 15px 0;
        color: #0b0c0c;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .progress-tracker__spinner {
        display: inline-block;
        width: 24px;
        height: 24px;
        border: 3px solid #1d70b8;
        border-radius: 50%;
        border-top-color: transparent;
        animation: spin 1s linear infinite;
      }

      @keyframes spin { to { transform: rotate(360deg); } }

      .progress-step {
        display: flex;
        align-items: center;
        padding: 8px 0;
        border-bottom: 1px solid #f3f2f1;
        font-size: 16px;
      }

      .progress-step:last-child { border-bottom: none; }

      .progress-step__icon {
        width: 28px;
        height: 28px;
        margin-right: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        font-size: 14px;
        font-weight: 700;
        flex-shrink: 0;
      }

      .progress-step--pending .progress-step__icon {
        background-color: #f3f2f1;
        color: #505a5f;
        border: 2px solid #b1b4b6;
      }

      .progress-step--active .progress-step__icon {
        background-color: #1d70b8;
        color: #ffffff;
        border: 2px solid #1d70b8;
        animation: pulse 1s ease-in-out infinite;
      }

      @keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.5; } }

      .progress-step--complete .progress-step__icon {
        background-color: #00703c;
        color: #ffffff;
        border: 2px solid #00703c;
      }

      .progress-step--error .progress-step__icon {
        background-color: #d4351c;
        color: #ffffff;
        border: 2px solid #d4351c;
      }

      .progress-step--pending .progress-step__text { color: #505a5f; }
      .progress-step--active .progress-step__text { color: #0b0c0c; font-weight: 600; }
      .progress-step--complete .progress-step__text { color: #00703c; }
      .progress-step--error .progress-step__text { color: #d4351c; }

      .progress-bar-container {
        background-color: #f3f2f1;
        height: 8px;
        border-radius: 4px;
        margin-top: 15px;
        overflow: hidden;
      }

      .progress-bar {
        height: 100%;
        background-color: #00703c;
        border-radius: 4px;
        transition: width 0.3s ease;
        width: 0%;
      }

      .progress-percentage {
        text-align: right;
        font-size: 14px;
        color: #505a5f;
        margin-top: 5px;
      }

      /* Stats table */
      .stats-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
      }

      .stats-table th {
        background-color: #0b0c0c;
        color: #ffffff;
        font-weight: 700;
        padding: 10px 8px;
        text-align: left;
        border: 1px solid #0b0c0c;
        font-size: 12px;
      }

      .stats-table td {
        padding: 8px;
        border: 1px solid #b1b4b6;
        background-color: #ffffff;
      }

      .stats-table tr:nth-child(even) td { background-color: #f8f8f8; }
      .stats-table tr:hover td { background-color: #f3f2f1; }

      .stat-positive { color: #00703c; font-weight: 700; }
      .stat-negative { color: #d4351c; font-weight: 700; }
      .stat-neutral { color: #505a5f; }

      /* Top Ten List */
      .top-ten-list {
        list-style: none;
        padding: 0;
        margin: 0;
        counter-reset: item;
      }

      .top-ten-list li {
        padding: 12px 12px 12px 50px;
        margin-bottom: 8px;
        background-color: #ffffff;
        border-left: 4px solid #1d70b8;
        position: relative;
        font-size: 15px;
        line-height: 1.4;
      }

      .top-ten-list li::before {
        counter-increment: item;
        content: counter(item);
        position: absolute;
        left: 12px;
        top: 12px;
        font-weight: 700;
        font-size: 18px;
        color: #1d70b8;
      }

      .govuk-list { padding-left: 20px; }
      .govuk-list li { margin-bottom: 5px; }
    "))
  ),

  # Header
  tags$header(class = "govuk-header",
    div(class = "govuk-header__container",
      div(style = "margin-bottom: 10px;",
        a(href = "#", class = "govuk-header__link",
          span(class = "govuk-header__logotype-text", "GOV.UK")
        )
      ),
      span(class = "govuk-header__service-name", "Labour Market Statistics Brief")
    )
  ),

  # Main Content
  div(class = "govuk-width-container",

    div(class = "govuk-phase-banner",
      span(class = "govuk-tag", "BETA"),
      span("This is a new service.")
    ),

    tags$main(class = "govuk-main-wrapper",

      h1(class = "govuk-heading-xl", "Labour Market Statistics Brief Generator"),

      # Configuration
      div(class = "dashboard-card",
        div(class = "dashboard-card__header", "Configuration"),
        div(class = "dashboard-card__content",
          div(class = "govuk-form-group",
            tags$label(class = "govuk-label", `for` = "manual_month", "Reference month"),
            div(class = "govuk-hint", "Format: dec2025"),
            tags$input(class = "govuk-input", id = "manual_month", name = "manual_month", type = "text")
          )
        )
      ),

      # Actions
      div(class = "dashboard-card",
        div(class = "dashboard-card__header", "Actions"),
        div(class = "dashboard-card__content",
          h2(class = "govuk-heading-m", "Preview Data"),
          p(class = "govuk-body", "Load and preview statistics before generating documents."),
          actionButton("preview_dashboard", "Preview Dashboard", class = "govuk-button govuk-button--blue"),
          actionButton("preview_topten", "Preview Top Ten Stats", class = "govuk-button govuk-button--blue"),

          tags$hr(class = "govuk-section-break"),

          h2(class = "govuk-heading-m", "Download Documents"),
          p(class = "govuk-body", "Generate and download briefing documents."),
          downloadButton("download_word", "Download Word Document", class = "govuk-button"),
          downloadButton("download_excel", "Download Excel Workbook", class = "govuk-button govuk-button--secondary")
        )
      ),

      # Progress Tracker (hidden by default, shown via JS)
      div(id = "progress_tracker", class = "progress-tracker",
        div(class = "progress-tracker__title",
          span(id = "progress_spinner", class = "progress-tracker__spinner"),
          span(id = "progress_title", "Processing...")
        ),
        div(id = "progress_steps"),
        div(class = "progress-bar-container",
          div(id = "progress_bar", class = "progress-bar")
        ),
        div(id = "progress_percentage", class = "progress-percentage", "0% complete")
      ),

      # Preview sections
      div(class = "govuk-grid-row",
        div(class = "govuk-grid-column-one-half",
          div(class = "dashboard-card",
            div(class = "dashboard-card__header", "Dashboard Preview"),
            div(class = "dashboard-card__content", uiOutput("dashboard_preview"))
          )
        ),
        div(class = "govuk-grid-column-one-half",
          div(class = "dashboard-card",
            div(class = "dashboard-card__header", "Top Ten Statistics Preview"),
            div(class = "dashboard-card__content", uiOutput("topten_preview"))
          )
        )
      )
    )
  ),

  # Footer
  tags$footer(class = "govuk-footer",
    div(class = "govuk-width-container",
      "Labour Market Statistics Brief Generator | Department for Business and Trade"
    )
  )
)

# ==============================================================================
# SERVER
# ==============================================================================

server <- function(input, output, session) {

  # File paths
  config_path       <- "utils/config.R"
  calculations_path <- "utils/calculations.R"
  word_script_path  <- "utils/word_output.R"
  excel_script_path <- "sheets/excel_audit.R"
  summary_path      <- "sheets/summary.R"
  top_ten_path      <- "sheets/top_ten_stats.R"
  template_path     <- "utils/DB.docx"

  # Reactive values
  dashboard_data <- reactiveVal(NULL)
  topten_data <- reactiveVal(NULL)

  # Load default month from config
  observe({
    if (file.exists(config_path)) {
      tryCatch({
        env <- new.env()
        source(config_path, local = env)
        if (exists("manual_month", envir = env)) {
          updateTextInput(session, "manual_month", value = env$manual_month)
        }
      }, error = function(e) NULL)
    }
  })

  # ============================================================================
  # PROGRESS HELPER FUNCTIONS (JavaScript-based for real-time updates)
  # ============================================================================

  showProgress <- function(title, steps) {
    steps_html <- paste(sapply(seq_along(steps), function(i) {
      sprintf('<div class="progress-step progress-step--pending" id="step_%d">
                 <div class="progress-step__icon">%d</div>
                 <div class="progress-step__text">%s</div>
               </div>', i, i, steps[i])
    }), collapse = "")

    runjs(sprintf("
      $('#progress_title').text('%s');
      $('#progress_steps').html('%s');
      $('#progress_bar').css('width', '0%%');
      $('#progress_percentage').text('0%% complete');
      $('#progress_spinner').show();
      $('#progress_tracker').addClass('visible');
    ", title, gsub("'", "\\\\'", steps_html)))
  }

  updateStep <- function(step_num, status, percent) {
    icon_content <- if (status == "complete") "&#10003;" else if (status == "error") "&#10007;" else step_num

    runjs(sprintf("
      $('#step_%d').removeClass('progress-step--pending progress-step--active progress-step--complete progress-step--error')
                   .addClass('progress-step--%s');
      $('#step_%d .progress-step__icon').html('%s');
      $('#progress_bar').css('width', '%d%%');
      $('#progress_percentage').text('%d%% complete');
    ", step_num, status, step_num, icon_content, percent, percent))
  }

  hideProgress <- function(delay_ms = 2000) {
    runjs(sprintf("
      $('#progress_spinner').hide();
      setTimeout(function() { $('#progress_tracker').removeClass('visible'); }, %d);
    ", delay_ms))
  }

  setProgressTitle <- function(title) {
    runjs(sprintf("$('#progress_title').text('%s');", gsub("'", "\\\\'", title)))
  }

  # ============================================================================
  # PREVIEW: DASHBOARD
  # ============================================================================

  observeEvent(input$preview_dashboard, {

    steps <- c(
      "Checking configuration files",
      "Loading configuration",
      "Setting reference month",
      "Running calculations",
      "Building metrics table",
      "Finalizing dashboard"
    )

    showProgress("Loading Dashboard Data", steps)

    tryCatch({

      # Step 1
      updateStep(1, "active", 5)
      Sys.sleep(0.3)

      if (!file.exists(calculations_path)) {
        updateStep(1, "error", 5)
        setProgressTitle("Error: calculations.R not found")
        hideProgress(3000)
        return()
      }

      updateStep(1, "complete", 15)

      # Step 2
      updateStep(2, "active", 20)
      Sys.sleep(0.2)

      calc_env <- new.env(parent = globalenv())

      if (file.exists(config_path)) {
        source(config_path, local = calc_env)
      }

      updateStep(2, "complete", 30)

      # Step 3
      updateStep(3, "active", 35)
      Sys.sleep(0.2)

      if (nzchar(input$manual_month)) {
        calc_env$manual_month <- tolower(input$manual_month)
      }

      updateStep(3, "complete", 45)

      # Step 4
      updateStep(4, "active", 50)

      source(calculations_path, local = calc_env)

      updateStep(4, "complete", 70)

      # Step 5
      updateStep(5, "active", 75)
      Sys.sleep(0.2)

      gv <- function(name) {
        if (exists(name, envir = calc_env)) {
          val <- get(name, envir = calc_env)
          if (is.numeric(val)) return(val)
        }
        NA_real_
      }

      metrics <- list(
        list(name = "Employment 16+ (000s)", cur = gv("emp16_cur") / 1000, dq = gv("emp16_dq") / 1000, dy = gv("emp16_dy") / 1000, dc = gv("emp16_dc") / 1000, de = gv("emp16_de") / 1000, invert = FALSE, type = "count"),
        list(name = "Employment rate 16-64 (%)", cur = gv("emp_rt_cur"), dq = gv("emp_rt_dq"), dy = gv("emp_rt_dy"), dc = gv("emp_rt_dc"), de = gv("emp_rt_de"), invert = FALSE, type = "rate"),
        list(name = "Unemployment 16+ (000s)", cur = gv("unemp16_cur") / 1000, dq = gv("unemp16_dq") / 1000, dy = gv("unemp16_dy") / 1000, dc = gv("unemp16_dc") / 1000, de = gv("unemp16_de") / 1000, invert = TRUE, type = "count"),
        list(name = "Unemployment rate 16+ (%)", cur = gv("unemp_rt_cur"), dq = gv("unemp_rt_dq"), dy = gv("unemp_rt_dy"), dc = gv("unemp_rt_dc"), de = gv("unemp_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Inactivity 16-64 (000s)", cur = gv("inact_cur") / 1000, dq = gv("inact_dq") / 1000, dy = gv("inact_dy") / 1000, dc = gv("inact_dc") / 1000, de = gv("inact_de") / 1000, invert = TRUE, type = "count"),
        list(name = "Inactivity 50-64 (000s)", cur = gv("inact5064_cur") / 1000, dq = gv("inact5064_dq") / 1000, dy = gv("inact5064_dy") / 1000, dc = gv("inact5064_dc") / 1000, de = gv("inact5064_de") / 1000, invert = TRUE, type = "count"),
        list(name = "Inactivity rate 16-64 (%)", cur = gv("inact_rt_cur"), dq = gv("inact_rt_dq"), dy = gv("inact_rt_dy"), dc = gv("inact_rt_dc"), de = gv("inact_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Inactivity rate 50-64 (%)", cur = gv("inact5064_rt_cur"), dq = gv("inact5064_rt_dq"), dy = gv("inact5064_rt_dy"), dc = gv("inact5064_rt_dc"), de = gv("inact5064_rt_de"), invert = TRUE, type = "rate"),
        list(name = "Vacancies (000s)", cur = gv("vac_cur"), dq = gv("vac_dq"), dy = gv("vac_dy"), dc = gv("vac_dc"), de = gv("vac_de"), invert = NA, type = "exempt"),
        list(name = "Payroll employees (000s)", cur = gv("payroll_cur"), dq = gv("payroll_dq"), dy = gv("payroll_dy"), dc = gv("payroll_dc"), de = gv("payroll_de"), invert = FALSE, type = "exempt"),
        list(name = "Wages total pay (%)", cur = gv("latest_wages"), dq = gv("wages_change_q"), dy = gv("wages_change_y"), dc = gv("wages_change_covid"), de = gv("wages_change_election"), invert = FALSE, type = "wages"),
        list(name = "Wages CPI-adjusted (%)", cur = gv("latest_wages_cpi"), dq = gv("wages_cpi_change_q"), dy = gv("wages_cpi_change_y"), dc = gv("wages_cpi_change_covid"), de = gv("wages_cpi_change_election"), invert = FALSE, type = "wages")
      )

      updateStep(5, "complete", 90)

      # Step 6
      updateStep(6, "active", 95)
      Sys.sleep(0.2)

      dashboard_data(metrics)

      updateStep(6, "complete", 100)
      setProgressTitle("Dashboard Loaded Successfully")
      hideProgress()

    }, error = function(e) {
      setProgressTitle(paste("Error:", e$message))
      hideProgress(5000)
    })
  })

  # ============================================================================
  # PREVIEW: TOP TEN
  # ============================================================================

  observeEvent(input$preview_topten, {

    steps <- c(
      "Checking required files",
      "Loading configuration",
      "Setting reference month",
      "Running calculations",
      "Loading top ten generator",
      "Generating statistics"
    )

    showProgress("Loading Top Ten Statistics", steps)

    tryCatch({

      # Step 1
      updateStep(1, "active", 5)
      Sys.sleep(0.3)

      if (!file.exists(calculations_path)) {
        updateStep(1, "error", 5)
        setProgressTitle("Error: calculations.R not found")
        hideProgress(3000)
        return()
      }

      if (!file.exists(top_ten_path)) {
        updateStep(1, "error", 5)
        setProgressTitle("Error: top_ten_stats.R not found")
        hideProgress(3000)
        return()
      }

      updateStep(1, "complete", 15)

      # Step 2
      updateStep(2, "active", 20)
      Sys.sleep(0.2)

      if (file.exists(config_path)) {
        source(config_path, local = FALSE)
      }

      updateStep(2, "complete", 35)

      # Step 3
      updateStep(3, "active", 40)
      Sys.sleep(0.2)

      if (nzchar(input$manual_month)) {
        manual_month <<- tolower(input$manual_month)
      }

      updateStep(3, "complete", 50)

      # Step 4
      updateStep(4, "active", 55)

      source(calculations_path, local = FALSE)

      updateStep(4, "complete", 70)

      # Step 5
      updateStep(5, "active", 75)

      source(top_ten_path, local = FALSE)

      updateStep(5, "complete", 85)

      # Step 6
      updateStep(6, "active", 90)

      if (exists("generate_top_ten")) {
        top10 <- generate_top_ten()
        topten_data(top10)
        updateStep(6, "complete", 100)
        setProgressTitle("Top Ten Statistics Loaded Successfully")
      } else {
        updateStep(6, "error", 90)
        setProgressTitle("Error: generate_top_ten function not found")
      }

      hideProgress()

    }, error = function(e) {
      setProgressTitle(paste("Error:", e$message))
      hideProgress(5000)
    })
  })

  # ============================================================================
  # DOWNLOAD: WORD
  # ============================================================================

  output$download_word <- downloadHandler(
    filename = function() {
      paste0("Labour_Market_Brief_", format(Sys.Date(), "%Y-%m-%d"), ".docx")
    },
    content = function(file) {

      steps <- c(
        "Checking officer package",
        "Locating template file",
        "Loading word output script",
        "Running calculations",
        "Generating document content",
        "Writing Word file"
      )

      showProgress("Generating Word Document", steps)

      tryCatch({

        # Step 1
        updateStep(1, "active", 5)
        Sys.sleep(0.2)

        if (!requireNamespace("officer", quietly = TRUE)) {
          updateStep(1, "error", 5)
          setProgressTitle("Error: officer package not installed")
          writeLines("Error: officer package required", file)
          hideProgress(3000)
          return()
        }

        updateStep(1, "complete", 15)

        # Step 2
        updateStep(2, "active", 20)
        Sys.sleep(0.2)

        if (!file.exists(template_path)) {
          updateStep(2, "error", 20)
          setProgressTitle("Warning: Template not found - creating basic document")

          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Labour Market Statistics Brief", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Generated:", format(Sys.Date(), "%d %B %Y")))
          doc <- officer::body_add_par(doc, "Note: Template file (utils/DB.docx) not found.")
          print(doc, target = file)

          updateStep(6, "complete", 100)
          hideProgress()
          return()
        }

        updateStep(2, "complete", 30)

        # Step 3
        updateStep(3, "active", 35)

        source(word_script_path, local = FALSE)

        updateStep(3, "complete", 50)

        # Step 4
        updateStep(4, "active", 55)
        updateStep(4, "complete", 65)

        # Step 5
        updateStep(5, "active", 70)
        updateStep(5, "complete", 85)

        # Step 6
        updateStep(6, "active", 90)

        generate_word_output(
          template_path = template_path,
          output_path = file,
          calculations_path = calculations_path,
          config_path = config_path,
          summary_path = summary_path,
          top_ten_path = top_ten_path,
          manual_month_override = if (nzchar(input$manual_month)) input$manual_month else NULL,
          verbose = FALSE
        )

        updateStep(6, "complete", 100)
        setProgressTitle("Word Document Generated Successfully")
        hideProgress()

      }, error = function(e) {
        setProgressTitle(paste("Error:", e$message))

        tryCatch({
          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Error Generating Document", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Error:", e$message))
          print(doc, target = file)
        }, error = function(e2) {
          writeLines(paste("Error:", e$message), file)
        })

        hideProgress(5000)
      })
    }
  )

  # ============================================================================
  # DOWNLOAD: EXCEL
  # ============================================================================

  output$download_excel <- downloadHandler(
    filename = function() {
      paste0("LM_Stats_Audit_", format(Sys.Date(), "%Y-%m-%d"), ".xlsx")
    },
    content = function(file) {

      steps <- c(
        "Checking openxlsx package",
        "Locating excel script",
        "Loading configuration",
        "Running calculations",
        "Building worksheets",
        "Writing Excel file"
      )

      showProgress("Generating Excel Workbook", steps)

      tryCatch({

        # Step 1
        updateStep(1, "active", 5)
        Sys.sleep(0.2)

        if (!requireNamespace("openxlsx", quietly = TRUE)) {
          updateStep(1, "error", 5)
          setProgressTitle("Error: openxlsx package not installed")
          hideProgress(3000)
          return()
        }

        updateStep(1, "complete", 15)

        # Step 2
        updateStep(2, "active", 20)
        Sys.sleep(0.2)

        if (!file.exists(excel_script_path)) {
          updateStep(2, "error", 20)
          setProgressTitle("Error: excel_audit.R not found")

          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(Error = "excel_audit.R not found"))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)

          hideProgress(3000)
          return()
        }

        updateStep(2, "complete", 30)

        # Step 3
        updateStep(3, "active", 35)
        Sys.sleep(0.2)

        if (nzchar(input$manual_month)) {
          manual_month <<- tolower(input$manual_month)
        }

        updateStep(3, "complete", 45)

        # Step 4
        updateStep(4, "active", 50)

        source(excel_script_path, local = FALSE)

        updateStep(4, "complete", 65)

        # Step 5
        updateStep(5, "active", 70)
        updateStep(5, "complete", 85)

        # Step 6
        updateStep(6, "active", 90)

        create_audit_workbook(
          output_path = file,
          calculations_path = calculations_path,
          config_path = config_path,
          verbose = FALSE
        )

        updateStep(6, "complete", 100)
        setProgressTitle("Excel Workbook Generated Successfully")
        hideProgress()

      }, error = function(e) {
        setProgressTitle(paste("Error:", e$message))

        # Create error workbook
        tryCatch({
          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(
            Error = c("Error generating workbook:", e$message),
            Solution = c("Check database connection", "Ensure all required packages are installed")
          ))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
        }, error = function(e2) NULL)

        hideProgress(5000)
      })
    }
  )

  # ============================================================================
  # RENDER: DASHBOARD PREVIEW
  # ============================================================================

  output$dashboard_preview <- renderUI({
    metrics <- dashboard_data()

    if (is.null(metrics)) {
      return(div(
        p(class = "govuk-body", "Click 'Preview Dashboard' to load statistics."),
        tags$ul(class = "govuk-list",
          tags$li("Employment and unemployment figures"),
          tags$li("Inactivity rates"),
          tags$li("Vacancies and payroll data"),
          tags$li("Wage statistics")
        )
      ))
    }

    format_change <- function(val, invert, type) {
      if (is.na(val)) return(tags$span(class = "stat-neutral", "-"))

      css_class <- if (is.na(invert)) "stat-neutral"
                   else if (val > 0) { if (invert) "stat-negative" else "stat-positive" }
                   else if (val < 0) { if (invert) "stat-positive" else "stat-negative" }
                   else "stat-neutral"

      sign_str <- if (val > 0) "+" else ""
      formatted <- if (type == "rate") paste0(sign_str, round(val, 1), "pp")
                   else if (type == "wages") paste0(sign_str, round(val, 1), "%")
                   else paste0(sign_str, format(round(val), big.mark = ","))

      tags$span(class = css_class, formatted)
    }

    format_current <- function(val, type) {
      if (is.na(val)) return("-")
      if (type == "rate" || type == "wages") paste0(round(val, 1), "%")
      else format(round(val), big.mark = ",")
    }

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

    tags$table(class = "stats-table",
      tags$thead(tags$tr(
        tags$th("Metric"), tags$th("Current"), tags$th("vs Qtr"),
        tags$th("vs Year"), tags$th("vs Covid"), tags$th("vs Election")
      )),
      tags$tbody(rows)
    )
  })

  # ============================================================================
  # RENDER: TOP TEN PREVIEW
  # ============================================================================

  output$topten_preview <- renderUI({
    top10 <- topten_data()

    if (is.null(top10)) {
      return(div(
        p(class = "govuk-body", "Click 'Preview Top Ten Stats' to load statistics."),
        tags$ul(class = "govuk-list",
          tags$li("Wage growth (nominal and CPI-adjusted)"),
          tags$li("Employment and unemployment rates"),
          tags$li("Payroll employment"),
          tags$li("Inactivity trends"),
          tags$li("Vacancies and redundancies")
        )
      ))
    }

    items <- lapply(1:10, function(i) {
      line_key <- paste0("line", i)
      line_text <- top10[[line_key]]
      if (is.null(line_text) || line_text == "") line_text <- "(Data not available)"
      tags$li(line_text)
    })

    tags$ol(class = "top-ten-list", items)
  })
}

# ==============================================================================
# RUN APPLICATION
# ==============================================================================

shinyApp(ui = ui, server = server)
