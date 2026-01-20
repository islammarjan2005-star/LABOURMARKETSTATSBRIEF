# ==============================================================================
# LABOUR MARKET STATISTICS BRIEF - SHINY APPLICATION
# ==============================================================================
# GOV.UK Design System styled application for generating Labour Market briefings
# ==============================================================================

library(shiny)

# ==============================================================================
# UI - GOV.UK DESIGN SYSTEM
# ==============================================================================

ui <- fluidPage(

  # Page title
  tags$head(
    tags$title("Labour Market Statistics Brief"),
    tags$meta(charset = "utf-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),

    # GOV.UK Design System CSS
    tags$style(HTML("
      /* ============================================
         GOV.UK Design System - Core Styles
         ============================================ */

      /* Import GDS Transport font approximation */
      @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600;700&display=swap');

      /* Reset and base */
      *, *::before, *::after {
        box-sizing: border-box;
      }

      html, body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
      }

      body {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-size: 19px;
        line-height: 1.31579;
        color: #0b0c0c;
        background-color: #f3f2f1;
      }

      /* ============================================
         GOV.UK Header
         ============================================ */

      .govuk-header {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
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

      @media (min-width: 40.0625em) {
        .govuk-header__container {
          padding-left: 30px;
          padding-right: 30px;
        }
      }

      .govuk-header__logo {
        margin-bottom: 10px;
        padding-right: 50px;
      }

      @media (min-width: 48.0625em) {
        .govuk-header__logo {
          width: 33.33%;
          padding-right: 15px;
          float: left;
          vertical-align: top;
        }
      }

      .govuk-header__logotype {
        display: inline-block;
      }

      .govuk-header__logotype-crown {
        position: relative;
        top: -1px;
        margin-right: 1px;
        fill: currentColor;
        vertical-align: top;
      }

      .govuk-header__logotype-text {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 30px;
        line-height: 1;
        color: #ffffff;
      }

      .govuk-header__link {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-decoration: none;
        color: #ffffff;
      }

      .govuk-header__link:link, .govuk-header__link:visited {
        color: #ffffff;
      }

      .govuk-header__link:hover {
        text-decoration: underline;
        text-decoration-thickness: 3px;
        text-underline-offset: .1em;
      }

      .govuk-header__link:focus {
        outline: 3px solid transparent;
        color: #0b0c0c;
        background-color: #ffdd00;
        box-shadow: 0 -2px #ffdd00, 0 4px #0b0c0c;
        text-decoration: none;
      }

      .govuk-header__service-name {
        display: inline-block;
        margin-bottom: 10px;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 18px;
        color: #ffffff;
      }

      @media (min-width: 48.0625em) {
        .govuk-header__service-name {
          font-size: 24px;
        }
      }

      /* ============================================
         GOV.UK Main Wrapper
         ============================================ */

      .govuk-width-container {
        max-width: 960px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 15px;
        padding-right: 15px;
      }

      @media (min-width: 40.0625em) {
        .govuk-width-container {
          padding-left: 30px;
          padding-right: 30px;
        }
      }

      .govuk-main-wrapper {
        display: block;
        padding-top: 40px;
        padding-bottom: 40px;
      }

      @media (min-width: 40.0625em) {
        .govuk-main-wrapper {
          padding-top: 50px;
          padding-bottom: 50px;
        }
      }

      /* ============================================
         GOV.UK Typography
         ============================================ */

      .govuk-heading-xl {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 700;
        font-size: 32px;
        line-height: 1.09375;
        margin-top: 0;
        margin-bottom: 30px;
      }

      @media (min-width: 40.0625em) {
        .govuk-heading-xl {
          font-size: 48px;
          line-height: 1.04167;
          margin-bottom: 50px;
        }
      }

      .govuk-heading-l {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 24px;
        line-height: 1.04167;
        margin-top: 0;
        margin-bottom: 20px;
      }

      @media (min-width: 40.0625em) {
        .govuk-heading-l {
          font-size: 36px;
          line-height: 1.11111;
          margin-bottom: 30px;
        }
      }

      .govuk-heading-m {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 18px;
        line-height: 1.11111;
        margin-top: 0;
        margin-bottom: 15px;
      }

      @media (min-width: 40.0625em) {
        .govuk-heading-m {
          font-size: 24px;
          line-height: 1.25;
          margin-bottom: 20px;
        }
      }

      .govuk-heading-s {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 16px;
        line-height: 1.25;
        margin-top: 0;
        margin-bottom: 15px;
      }

      @media (min-width: 40.0625em) {
        .govuk-heading-s {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-body, .govuk-body-m {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-size: 16px;
        line-height: 1.25;
        margin-top: 0;
        margin-bottom: 15px;
      }

      @media (min-width: 40.0625em) {
        .govuk-body, .govuk-body-m {
          font-size: 19px;
          line-height: 1.31579;
          margin-bottom: 20px;
        }
      }

      .govuk-body-s {
        color: #0b0c0c;
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-size: 14px;
        line-height: 1.14286;
        margin-top: 0;
        margin-bottom: 15px;
      }

      @media (min-width: 40.0625em) {
        .govuk-body-s {
          font-size: 16px;
          line-height: 1.25;
        }
      }

      /* ============================================
         GOV.UK Buttons
         ============================================ */

      .govuk-button {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1;
        box-sizing: border-box;
        display: inline-block;
        position: relative;
        width: 100%;
        margin-top: 0;
        margin-right: 0;
        margin-left: 0;
        margin-bottom: 22px;
        padding: 8px 10px 7px;
        border: 2px solid transparent;
        border-radius: 0;
        color: #ffffff;
        background-color: #00703c;
        box-shadow: 0 2px 0 #002d18;
        text-align: center;
        vertical-align: top;
        cursor: pointer;
        -webkit-appearance: none;
      }

      @media (min-width: 40.0625em) {
        .govuk-button {
          font-size: 19px;
          line-height: 1;
          width: auto;
          margin-bottom: 32px;
          padding: 8px 10px 7px;
        }
      }

      .govuk-button:link, .govuk-button:visited, .govuk-button:active, .govuk-button:hover {
        color: #ffffff;
        text-decoration: none;
      }

      .govuk-button:hover {
        background-color: #005a30;
      }

      .govuk-button:active {
        top: 2px;
        box-shadow: none;
      }

      .govuk-button:focus {
        border-color: #ffdd00;
        outline: 3px solid transparent;
        box-shadow: inset 0 0 0 1px #ffdd00;
      }

      .govuk-button:focus:not(:active):not(:hover) {
        border-color: #ffdd00;
        color: #0b0c0c;
        background-color: #ffdd00;
        box-shadow: 0 2px 0 #0b0c0c;
      }

      .govuk-button--secondary {
        background-color: #f3f2f1;
        box-shadow: 0 2px 0 #929191;
        color: #0b0c0c;
      }

      .govuk-button--secondary:link, .govuk-button--secondary:visited, .govuk-button--secondary:active, .govuk-button--secondary:hover {
        color: #0b0c0c;
      }

      .govuk-button--secondary:hover {
        background-color: #dbdad9;
      }

      .govuk-button--secondary:focus:not(:active):not(:hover) {
        color: #0b0c0c;
      }

      .govuk-button--warning {
        background-color: #d4351c;
        box-shadow: 0 2px 0 #55150b;
      }

      .govuk-button--warning:hover {
        background-color: #aa2a16;
      }

      .govuk-button--start {
        font-weight: 700;
        font-size: 18px;
        line-height: 1;
        display: inline-flex;
        min-height: auto;
        justify-content: center;
      }

      @media (min-width: 40.0625em) {
        .govuk-button--start {
          font-size: 24px;
        }
      }

      /* Blue button variant */
      .govuk-button--blue {
        background-color: #1d70b8;
        box-shadow: 0 2px 0 #003078;
      }

      .govuk-button--blue:hover {
        background-color: #003078;
      }

      /* ============================================
         GOV.UK Form Elements
         ============================================ */

      .govuk-form-group {
        margin-bottom: 20px;
      }

      @media (min-width: 40.0625em) {
        .govuk-form-group {
          margin-bottom: 30px;
        }
      }

      .govuk-label {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        color: #0b0c0c;
        display: block;
        margin-bottom: 5px;
      }

      @media (min-width: 40.0625em) {
        .govuk-label {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-label--l {
        font-weight: 700;
        font-size: 24px;
        line-height: 1.04167;
      }

      @media (min-width: 40.0625em) {
        .govuk-label--l {
          font-size: 36px;
          line-height: 1.11111;
        }
      }

      .govuk-hint {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        margin-bottom: 15px;
        color: #505a5f;
      }

      @media (min-width: 40.0625em) {
        .govuk-hint {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-input {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        margin-top: 0;
        padding: 5px;
        border: 2px solid #0b0c0c;
        border-radius: 0;
        -webkit-appearance: none;
        appearance: none;
      }

      @media (min-width: 40.0625em) {
        .govuk-input {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-input:focus {
        outline: 3px solid #ffdd00;
        outline-offset: 0;
        box-shadow: inset 0 0 0 2px;
      }

      .govuk-input--width-10 {
        max-width: 23.75ex;
      }

      /* ============================================
         GOV.UK Panel
         ============================================ */

      .govuk-panel {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        box-sizing: border-box;
        margin-bottom: 15px;
        padding: 35px;
        border: 5px solid transparent;
        text-align: center;
        background: #00703c;
        color: #ffffff;
      }

      @media (min-width: 40.0625em) {
        .govuk-panel {
          font-size: 19px;
          line-height: 1.31579;
          margin-bottom: 30px;
          padding: 45px;
        }
      }

      .govuk-panel__title {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 32px;
        line-height: 1.09375;
        margin-top: 0;
        margin-bottom: 30px;
      }

      @media (min-width: 40.0625em) {
        .govuk-panel__title {
          font-size: 48px;
          line-height: 1.04167;
        }
      }

      .govuk-panel__body {
        font-size: 24px;
        line-height: 1.25;
      }

      @media (min-width: 40.0625em) {
        .govuk-panel__body {
          font-size: 36px;
          line-height: 1.11111;
        }
      }

      /* ============================================
         GOV.UK Inset Text
         ============================================ */

      .govuk-inset-text {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        color: #0b0c0c;
        padding: 15px;
        margin-top: 20px;
        margin-bottom: 20px;
        clear: both;
        border-left: 10px solid #b1b4b6;
      }

      @media (min-width: 40.0625em) {
        .govuk-inset-text {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      /* ============================================
         GOV.UK Summary Card
         ============================================ */

      .govuk-summary-card {
        margin-bottom: 20px;
        border: 1px solid #b1b4b6;
      }

      @media (min-width: 40.0625em) {
        .govuk-summary-card {
          margin-bottom: 30px;
        }
      }

      .govuk-summary-card__title-wrapper {
        padding: 15px;
        background-color: #f3f2f1;
        border-bottom: 1px solid #b1b4b6;
      }

      .govuk-summary-card__title {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 16px;
        line-height: 1.25;
        margin: 0;
        color: #0b0c0c;
      }

      @media (min-width: 40.0625em) {
        .govuk-summary-card__title {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-summary-card__content {
        padding: 15px;
        background-color: #ffffff;
      }

      /* ============================================
         GOV.UK Footer
         ============================================ */

      .govuk-footer {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 14px;
        line-height: 1.14286;
        padding-top: 25px;
        padding-bottom: 15px;
        border-top: 1px solid #b1b4b6;
        color: #0b0c0c;
        background: #f3f2f1;
      }

      @media (min-width: 40.0625em) {
        .govuk-footer {
          font-size: 16px;
          line-height: 1.25;
          padding-top: 40px;
          padding-bottom: 25px;
        }
      }

      .govuk-footer__meta {
        display: flex;
        flex-wrap: wrap;
        align-items: flex-end;
        justify-content: center;
      }

      .govuk-footer__meta-item {
        margin-bottom: 25px;
      }

      .govuk-footer__licence-description {
        color: #505a5f;
      }

      /* ============================================
         GOV.UK Table
         ============================================ */

      .govuk-table {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        color: #0b0c0c;
        width: 100%;
        margin-bottom: 20px;
        border-spacing: 0;
        border-collapse: collapse;
      }

      @media (min-width: 40.0625em) {
        .govuk-table {
          font-size: 19px;
          line-height: 1.31579;
          margin-bottom: 30px;
        }
      }

      .govuk-table__head {
        background-color: #f3f2f1;
      }

      .govuk-table__header {
        font-weight: 700;
        padding: 10px 20px 10px 0;
        border-bottom: 1px solid #b1b4b6;
        text-align: left;
        vertical-align: top;
      }

      .govuk-table__header--numeric {
        text-align: right;
      }

      .govuk-table__cell {
        padding: 10px 20px 10px 0;
        border-bottom: 1px solid #b1b4b6;
        text-align: left;
        vertical-align: top;
      }

      .govuk-table__cell--numeric {
        text-align: right;
      }

      /* ============================================
         GOV.UK Tag
         ============================================ */

      .govuk-tag {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 700;
        font-size: 14px;
        line-height: 1;
        display: inline-block;
        max-width: 160px;
        margin-top: -2px;
        margin-bottom: -3px;
        padding: 5px 8px 4px;
        color: #ffffff;
        background-color: #1d70b8;
        letter-spacing: 1px;
        text-decoration: none;
        text-transform: uppercase;
        overflow-wrap: break-word;
      }

      @media (min-width: 40.0625em) {
        .govuk-tag {
          font-size: 16px;
        }
      }

      .govuk-tag--green {
        color: #005a30;
        background: #cce2d8;
      }

      .govuk-tag--red {
        color: #942514;
        background: #f6d7d2;
      }

      .govuk-tag--yellow {
        color: #594d00;
        background: #fff7bf;
      }

      .govuk-tag--grey {
        color: #383f43;
        background: #eeefef;
      }

      /* ============================================
         Custom Dashboard Styles
         ============================================ */

      .dashboard-card {
        background-color: #ffffff;
        border: 1px solid #b1b4b6;
        margin-bottom: 20px;
        border-radius: 0;
      }

      .dashboard-card__header {
        background-color: #1d70b8;
        color: #ffffff;
        padding: 15px 20px;
        font-weight: 700;
        font-size: 19px;
      }

      .dashboard-card__content {
        padding: 20px;
      }

      .stats-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
      }

      @media (min-width: 40.0625em) {
        .stats-table {
          font-size: 16px;
        }
      }

      .stats-table th {
        background-color: #0b0c0c;
        color: #ffffff;
        font-weight: 700;
        padding: 12px 10px;
        text-align: left;
        border: 1px solid #0b0c0c;
        font-size: 12px;
      }

      @media (min-width: 40.0625em) {
        .stats-table th {
          font-size: 14px;
        }
      }

      .stats-table td {
        padding: 10px;
        border: 1px solid #b1b4b6;
        background-color: #ffffff;
      }

      .stats-table tr:nth-child(even) td {
        background-color: #f8f8f8;
      }

      .stats-table tr:hover td {
        background-color: #f3f2f1;
      }

      .stat-positive {
        color: #00703c;
        font-weight: 700;
      }

      .stat-negative {
        color: #d4351c;
        font-weight: 700;
      }

      .stat-neutral {
        color: #505a5f;
      }

      /* Top Ten List */
      .top-ten-list {
        list-style: none;
        padding: 0;
        margin: 0;
        counter-reset: item;
      }

      .top-ten-list li {
        padding: 15px 15px 15px 55px;
        margin-bottom: 10px;
        background-color: #ffffff;
        border-left: 5px solid #1d70b8;
        position: relative;
        font-size: 16px;
        line-height: 1.5;
      }

      @media (min-width: 40.0625em) {
        .top-ten-list li {
          font-size: 18px;
        }
      }

      .top-ten-list li::before {
        counter-increment: item;
        content: counter(item);
        position: absolute;
        left: 15px;
        top: 15px;
        font-weight: 700;
        font-size: 20px;
        color: #1d70b8;
        width: 30px;
        text-align: center;
      }

      /* Button Group */
      .govuk-button-group {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
        margin-bottom: 20px;
      }

      @media (min-width: 40.0625em) {
        .govuk-button-group {
          flex-direction: row;
          flex-wrap: wrap;
          margin-bottom: 30px;
        }

        .govuk-button-group .govuk-button {
          margin-bottom: 17px;
          margin-right: 15px;
        }
      }

      /* Two column grid */
      .govuk-grid-row {
        display: flex;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px;
      }

      .govuk-grid-column-one-half {
        box-sizing: border-box;
        width: 100%;
        padding: 0 15px;
      }

      @media (min-width: 48.0625em) {
        .govuk-grid-column-one-half {
          width: 50%;
        }
      }

      .govuk-grid-column-full {
        box-sizing: border-box;
        width: 100%;
        padding: 0 15px;
      }

      /* Phase Banner */
      .govuk-phase-banner {
        padding-top: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid #b1b4b6;
      }

      .govuk-phase-banner__content {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 14px;
        line-height: 1.14286;
        color: #0b0c0c;
        display: table;
        margin: 0;
      }

      @media (min-width: 40.0625em) {
        .govuk-phase-banner__content {
          font-size: 16px;
          line-height: 1.25;
        }
      }

      .govuk-phase-banner__content__tag {
        margin-right: 10px;
      }

      .govuk-phase-banner__text {
        display: table-cell;
        vertical-align: middle;
      }

      /* Notification Banner */
      .govuk-notification-banner {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.25;
        margin-bottom: 30px;
        border: 5px solid #1d70b8;
        background-color: #1d70b8;
      }

      @media (min-width: 40.0625em) {
        .govuk-notification-banner {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-notification-banner__header {
        padding: 2px 15px 5px;
        border-bottom: 1px solid transparent;
      }

      @media (min-width: 40.0625em) {
        .govuk-notification-banner__header {
          padding: 2px 20px 5px;
        }
      }

      .govuk-notification-banner__title {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-weight: 700;
        font-size: 16px;
        line-height: 1.25;
        color: #ffffff;
        margin: 0;
        padding: 0;
      }

      @media (min-width: 40.0625em) {
        .govuk-notification-banner__title {
          font-size: 19px;
          line-height: 1.31579;
        }
      }

      .govuk-notification-banner__content {
        color: #0b0c0c;
        padding: 15px;
        background-color: #ffffff;
      }

      @media (min-width: 40.0625em) {
        .govuk-notification-banner__content {
          padding: 20px;
        }
      }

      .govuk-notification-banner--success {
        border-color: #00703c;
        background-color: #00703c;
      }

      .govuk-notification-banner--success .govuk-notification-banner__header {
        background-color: #00703c;
      }

      /* ============================================
         PROGRESS TRACKER STYLES
         ============================================ */

      .progress-tracker {
        background: #ffffff;
        border: 1px solid #b1b4b6;
        padding: 20px;
        margin-bottom: 20px;
      }

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

      @keyframes spin {
        to { transform: rotate(360deg); }
      }

      .progress-steps {
        list-style: none;
        padding: 0;
        margin: 0;
      }

      .progress-step {
        display: flex;
        align-items: flex-start;
        padding: 10px 0;
        border-bottom: 1px solid #f3f2f1;
        font-size: 16px;
        line-height: 1.5;
      }

      .progress-step:last-child {
        border-bottom: none;
      }

      .progress-step__icon {
        width: 28px;
        height: 28px;
        margin-right: 12px;
        flex-shrink: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        font-size: 14px;
        font-weight: 700;
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
        animation: pulse 1.5s ease-in-out infinite;
      }

      @keyframes pulse {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.6; }
      }

      .progress-step--complete .progress-step__icon {
        background-color: #00703c;
        color: #ffffff;
        border: 2px solid #00703c;
      }

      .progress-step--complete .progress-step__icon::before {
        content: '\\2713';
      }

      .progress-step--error .progress-step__icon {
        background-color: #d4351c;
        color: #ffffff;
        border: 2px solid #d4351c;
      }

      .progress-step--error .progress-step__icon::before {
        content: '\\2717';
      }

      .progress-step__text {
        flex: 1;
        padding-top: 3px;
      }

      .progress-step--pending .progress-step__text {
        color: #505a5f;
      }

      .progress-step--active .progress-step__text {
        color: #0b0c0c;
        font-weight: 600;
      }

      .progress-step--complete .progress-step__text {
        color: #00703c;
      }

      .progress-step--error .progress-step__text {
        color: #d4351c;
      }

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
      }

      .progress-percentage {
        text-align: right;
        font-size: 14px;
        color: #505a5f;
        margin-top: 5px;
      }

      /* Fix Shiny download button styling */
      .govuk-button.shiny-download-link {
        text-decoration: none;
      }

      /* Section spacing */
      .govuk-section-break {
        margin: 0;
        border: 0;
      }

      .govuk-section-break--xl {
        margin-top: 30px;
        margin-bottom: 30px;
      }

      @media (min-width: 40.0625em) {
        .govuk-section-break--xl {
          margin-top: 50px;
          margin-bottom: 50px;
        }
      }

      .govuk-section-break--visible {
        border-bottom: 1px solid #b1b4b6;
      }

      /* Visually hidden */
      .govuk-visually-hidden {
        position: absolute !important;
        width: 1px !important;
        height: 1px !important;
        margin: 0 !important;
        padding: 0 !important;
        overflow: hidden !important;
        clip: rect(0 0 0 0) !important;
        -webkit-clip-path: inset(50%) !important;
        clip-path: inset(50%) !important;
        border: 0 !important;
        white-space: nowrap !important;
      }

      /* Remove default Shiny container padding */
      .container-fluid {
        padding: 0 !important;
        margin: 0 !important;
        max-width: none !important;
      }

      /* GOV.UK List styles */
      .govuk-list {
        font-family: 'Source Sans Pro', 'GDS Transport', Arial, sans-serif;
        font-size: 16px;
        line-height: 1.25;
        color: #0b0c0c;
        margin-top: 0;
        margin-bottom: 15px;
        padding-left: 0;
        list-style-type: none;
      }

      @media (min-width: 40.0625em) {
        .govuk-list {
          font-size: 19px;
          line-height: 1.31579;
          margin-bottom: 20px;
        }
      }

      .govuk-list--bullet {
        padding-left: 20px;
        list-style-type: disc;
      }

      .govuk-list--bullet > li {
        margin-bottom: 5px;
      }
    "))
  ),

  # GOV.UK Header
  tags$header(class = "govuk-header", role = "banner", `data-module` = "govuk-header",
    div(class = "govuk-header__container govuk-width-container",
      div(class = "govuk-header__logo",
        a(href = "#", class = "govuk-header__link govuk-header__link--homepage",
          span(class = "govuk-header__logotype",
            span(class = "govuk-header__logotype-text", "GOV.UK")
          )
        )
      ),
      div(class = "govuk-header__content",
        span(class = "govuk-header__service-name", "Labour Market Statistics Brief")
      )
    )
  ),

  # Main Content
  div(class = "govuk-width-container",

    # Phase banner
    div(class = "govuk-phase-banner",
      p(class = "govuk-phase-banner__content",
        tags$strong(class = "govuk-tag govuk-phase-banner__content__tag", "BETA"),
        span(class = "govuk-phase-banner__text",
          "This is a new service. Please report any issues to the team."
        )
      )
    ),

    tags$main(class = "govuk-main-wrapper", id = "main-content", role = "main",

      # Page heading
      h1(class = "govuk-heading-xl", "Labour Market Statistics Brief Generator"),

      # Configuration card
      div(class = "dashboard-card",
        div(class = "dashboard-card__header", "Configuration"),
        div(class = "dashboard-card__content",
          div(class = "govuk-form-group",
            tags$label(class = "govuk-label", `for` = "manual_month",
              "Reference month"
            ),
            tags$div(id = "manual_month-hint", class = "govuk-hint",
              "Enter the reference month in format: dec2025 or 2025-12"
            ),
            tags$input(
              class = "govuk-input govuk-input--width-10",
              id = "manual_month",
              name = "manual_month",
              type = "text",
              `aria-describedby` = "manual_month-hint"
            )
          )
        )
      ),

      # Actions card
      div(class = "dashboard-card",
        div(class = "dashboard-card__header", "Actions"),
        div(class = "dashboard-card__content",
          h2(class = "govuk-heading-m", "Preview Data"),
          p(class = "govuk-body", "Load and preview the labour market statistics before generating documents."),
          div(class = "govuk-button-group",
            actionButton("preview_dashboard", "Preview Dashboard",
                        class = "govuk-button govuk-button--blue"),
            actionButton("preview_topten", "Preview Top Ten Stats",
                        class = "govuk-button govuk-button--blue")
          ),

          hr(class = "govuk-section-break govuk-section-break--xl govuk-section-break--visible"),

          h2(class = "govuk-heading-m", "Download Documents"),
          p(class = "govuk-body", "Generate and download the briefing documents."),
          div(class = "govuk-button-group",
            downloadButton("download_word", "Download Word Document",
                          class = "govuk-button"),
            downloadButton("download_excel", "Download Excel Workbook",
                          class = "govuk-button govuk-button--secondary")
          )
        )
      ),

      # Progress Tracker Panel
      uiOutput("progress_panel"),

      # Preview sections in two columns
      div(class = "govuk-grid-row",

        # Dashboard preview
        div(class = "govuk-grid-column-one-half",
          div(class = "dashboard-card",
            div(class = "dashboard-card__header", "Dashboard Preview"),
            div(class = "dashboard-card__content",
              uiOutput("dashboard_preview")
            )
          )
        ),

        # Top Ten preview
        div(class = "govuk-grid-column-one-half",
          div(class = "dashboard-card",
            div(class = "dashboard-card__header", "Top Ten Statistics Preview"),
            div(class = "dashboard-card__content",
              uiOutput("topten_preview")
            )
          )
        )
      )
    )
  ),

  # GOV.UK Footer
  tags$footer(class = "govuk-footer", role = "contentinfo",
    div(class = "govuk-width-container",
      div(class = "govuk-footer__meta",
        div(class = "govuk-footer__meta-item",
          span(class = "govuk-footer__licence-description",
            "Labour Market Statistics Brief Generator",
            tags$br(),
            "Department for Business and Trade"
          )
        )
      )
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

  # Progress tracking reactive values
  progress_visible <- reactiveVal(FALSE)
  progress_title <- reactiveVal("")
  progress_steps <- reactiveVal(list())
  progress_percent <- reactiveVal(0)

  # Helper function to create a step
  make_step <- function(text, status = "pending") {
    list(text = text, status = status)
  }

  # Helper function to update step status
  update_step <- function(steps, index, status) {
    steps[[index]]$status <- status
    steps
  }

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
  # PROGRESS PANEL RENDERER
  # ============================================================================

  output$progress_panel <- renderUI({
    if (!progress_visible()) {
      return(NULL)
    }

    steps <- progress_steps()
    pct <- progress_percent()
    title <- progress_title()

    step_items <- lapply(seq_along(steps), function(i) {
      step <- steps[[i]]
      status_class <- paste0("progress-step progress-step--", step$status)

      icon_content <- switch(step$status,
        "pending" = i,
        "active" = i,
        "complete" = "",
        "error" = "",
        i
      )

      div(class = status_class,
        div(class = "progress-step__icon", icon_content),
        div(class = "progress-step__text", step$text)
      )
    })

    div(class = "progress-tracker",
      div(class = "progress-tracker__title",
        if (pct < 100) span(class = "progress-tracker__spinner"),
        title
      ),
      div(class = "progress-steps", step_items),
      div(class = "progress-bar-container",
        div(class = "progress-bar", style = paste0("width: ", pct, "%;"))
      ),
      div(class = "progress-percentage", paste0(pct, "% complete"))
    )
  })

  # ============================================================================
  # PREVIEW: DASHBOARD (with progress)
  # ============================================================================

  observeEvent(input$preview_dashboard, {

    # Initialize progress
    progress_title("Loading Dashboard Data")
    progress_steps(list(
      make_step("Checking configuration files"),
      make_step("Loading configuration"),
      make_step("Setting reference month"),
      make_step("Running calculations"),
      make_step("Building metrics table"),
      make_step("Finalizing dashboard")
    ))
    progress_percent(0)
    progress_visible(TRUE)

    result <- tryCatch({

      # Step 1: Check files
      steps <- progress_steps()
      steps <- update_step(steps, 1, "active")
      progress_steps(steps)
      progress_percent(10)

      Sys.sleep(0.3)

      if (!file.exists(calculations_path)) {
        steps <- update_step(steps, 1, "error")
        progress_steps(steps)
        return(list(success = FALSE, error = "calculations.R not found"))
      }

      steps <- update_step(steps, 1, "complete")
      progress_steps(steps)

      # Step 2: Load config
      steps <- update_step(steps, 2, "active")
      progress_steps(steps)
      progress_percent(25)

      Sys.sleep(0.2)

      calc_env <- new.env(parent = globalenv())

      if (file.exists(config_path)) {
        source(config_path, local = calc_env)
      }

      steps <- update_step(steps, 2, "complete")
      progress_steps(steps)

      # Step 3: Set reference month
      steps <- update_step(steps, 3, "active")
      progress_steps(steps)
      progress_percent(40)

      Sys.sleep(0.2)

      if (nzchar(input$manual_month)) {
        calc_env$manual_month <- tolower(input$manual_month)
      }

      steps <- update_step(steps, 3, "complete")
      progress_steps(steps)

      # Step 4: Run calculations
      steps <- update_step(steps, 4, "active")
      progress_steps(steps)
      progress_percent(55)

      source(calculations_path, local = calc_env)

      steps <- update_step(steps, 4, "complete")
      progress_steps(steps)

      # Step 5: Build metrics
      steps <- update_step(steps, 5, "active")
      progress_steps(steps)
      progress_percent(75)

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

      steps <- update_step(steps, 5, "complete")
      progress_steps(steps)

      # Step 6: Finalize
      steps <- update_step(steps, 6, "active")
      progress_steps(steps)
      progress_percent(90)

      Sys.sleep(0.2)

      steps <- update_step(steps, 6, "complete")
      progress_steps(steps)
      progress_percent(100)

      list(success = TRUE, data = metrics)

    }, error = function(e) {
      steps <- progress_steps()
      for (i in seq_along(steps)) {
        if (steps[[i]]$status == "active") {
          steps <- update_step(steps, i, "error")
          break
        }
      }
      progress_steps(steps)
      list(success = FALSE, error = e$message)
    })

    if (isTRUE(result$success)) {
      dashboard_data(result$data)
      progress_title("Dashboard Loaded Successfully")
    } else {
      progress_title(paste("Error:", result$error))
    }

    # Hide progress after delay
    later::later(function() {
      progress_visible(FALSE)
    }, 3)
  })

  # ============================================================================
  # PREVIEW: TOP TEN (with progress)
  # ============================================================================

  observeEvent(input$preview_topten, {

    # Initialize progress
    progress_title("Loading Top Ten Statistics")
    progress_steps(list(
      make_step("Checking required files"),
      make_step("Loading configuration"),
      make_step("Setting reference month"),
      make_step("Running calculations"),
      make_step("Loading top ten generator"),
      make_step("Generating statistics")
    ))
    progress_percent(0)
    progress_visible(TRUE)

    result <- tryCatch({

      # Step 1: Check files
      steps <- progress_steps()
      steps <- update_step(steps, 1, "active")
      progress_steps(steps)
      progress_percent(10)

      Sys.sleep(0.3)

      if (!file.exists(calculations_path)) {
        steps <- update_step(steps, 1, "error")
        progress_steps(steps)
        return(list(success = FALSE, error = "calculations.R not found"))
      }
      if (!file.exists(top_ten_path)) {
        steps <- update_step(steps, 1, "error")
        progress_steps(steps)
        return(list(success = FALSE, error = "top_ten_stats.R not found"))
      }

      steps <- update_step(steps, 1, "complete")
      progress_steps(steps)

      # Step 2: Load config
      steps <- update_step(steps, 2, "active")
      progress_steps(steps)
      progress_percent(25)

      Sys.sleep(0.2)

      if (file.exists(config_path)) {
        source(config_path, local = FALSE)
      }

      steps <- update_step(steps, 2, "complete")
      progress_steps(steps)

      # Step 3: Set reference month
      steps <- update_step(steps, 3, "active")
      progress_steps(steps)
      progress_percent(40)

      Sys.sleep(0.2)

      if (nzchar(input$manual_month)) {
        manual_month <<- tolower(input$manual_month)
      }

      steps <- update_step(steps, 3, "complete")
      progress_steps(steps)

      # Step 4: Run calculations
      steps <- update_step(steps, 4, "active")
      progress_steps(steps)
      progress_percent(55)

      source(calculations_path, local = FALSE)

      steps <- update_step(steps, 4, "complete")
      progress_steps(steps)

      # Step 5: Load top ten generator
      steps <- update_step(steps, 5, "active")
      progress_steps(steps)
      progress_percent(75)

      source(top_ten_path, local = FALSE)

      steps <- update_step(steps, 5, "complete")
      progress_steps(steps)

      # Step 6: Generate statistics
      steps <- update_step(steps, 6, "active")
      progress_steps(steps)
      progress_percent(90)

      if (exists("generate_top_ten")) {
        top10 <- generate_top_ten()
        steps <- update_step(steps, 6, "complete")
        progress_steps(steps)
        progress_percent(100)
        list(success = TRUE, data = top10)
      } else {
        steps <- update_step(steps, 6, "error")
        progress_steps(steps)
        list(success = FALSE, error = "generate_top_ten function not found")
      }

    }, error = function(e) {
      steps <- progress_steps()
      for (i in seq_along(steps)) {
        if (steps[[i]]$status == "active") {
          steps <- update_step(steps, i, "error")
          break
        }
      }
      progress_steps(steps)
      list(success = FALSE, error = e$message)
    })

    if (isTRUE(result$success)) {
      topten_data(result$data)
      progress_title("Top Ten Statistics Loaded Successfully")
    } else {
      progress_title(paste("Error:", result$error))
    }

    # Hide progress after delay
    later::later(function() {
      progress_visible(FALSE)
    }, 3)
  })

  # ============================================================================
  # DOWNLOAD: WORD (with progress)
  # ============================================================================

  output$download_word <- downloadHandler(
    filename = function() {
      paste0("Labour_Market_Brief_", format(Sys.Date(), "%Y-%m-%d"), ".docx")
    },
    content = function(file) {

      # Initialize progress
      progress_title("Generating Word Document")
      progress_steps(list(
        make_step("Checking officer package"),
        make_step("Locating template file"),
        make_step("Loading word output script"),
        make_step("Running calculations"),
        make_step("Generating document content"),
        make_step("Writing Word file")
      ))
      progress_percent(0)
      progress_visible(TRUE)

      tryCatch({

        # Step 1: Check officer package
        steps <- progress_steps()
        steps <- update_step(steps, 1, "active")
        progress_steps(steps)
        progress_percent(10)

        Sys.sleep(0.2)

        if (!requireNamespace("officer", quietly = TRUE)) {
          steps <- update_step(steps, 1, "error")
          progress_steps(steps)
          progress_title("Error: officer package not installed")
          writeLines("Error: officer package required for Word generation", file)
          return()
        }

        steps <- update_step(steps, 1, "complete")
        progress_steps(steps)

        # Step 2: Check template
        steps <- update_step(steps, 2, "active")
        progress_steps(steps)
        progress_percent(25)

        Sys.sleep(0.2)

        if (!file.exists(template_path)) {
          steps <- update_step(steps, 2, "error")
          progress_steps(steps)
          progress_title("Warning: Template not found - creating basic document")

          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Labour Market Statistics Brief", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Generated:", format(Sys.Date(), "%d %B %Y")))
          doc <- officer::body_add_par(doc, "")
          doc <- officer::body_add_par(doc, "Note: Template file (utils/DB.docx) not found.")
          print(doc, target = file)

          progress_percent(100)
          later::later(function() { progress_visible(FALSE) }, 3)
          return()
        }

        steps <- update_step(steps, 2, "complete")
        progress_steps(steps)

        # Step 3: Load word script
        steps <- update_step(steps, 3, "active")
        progress_steps(steps)
        progress_percent(40)

        source(word_script_path, local = FALSE)

        steps <- update_step(steps, 3, "complete")
        progress_steps(steps)

        # Step 4: Run calculations
        steps <- update_step(steps, 4, "active")
        progress_steps(steps)
        progress_percent(55)

        # Calculations happen inside generate_word_output

        steps <- update_step(steps, 4, "complete")
        progress_steps(steps)

        # Step 5: Generate content
        steps <- update_step(steps, 5, "active")
        progress_steps(steps)
        progress_percent(75)

        steps <- update_step(steps, 5, "complete")
        progress_steps(steps)

        # Step 6: Write file
        steps <- update_step(steps, 6, "active")
        progress_steps(steps)
        progress_percent(90)

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

        steps <- update_step(steps, 6, "complete")
        progress_steps(steps)
        progress_percent(100)

        progress_title("Word Document Generated Successfully")

      }, error = function(e) {
        steps <- progress_steps()
        for (i in seq_along(steps)) {
          if (steps[[i]]$status == "active") {
            steps <- update_step(steps, i, "error")
            break
          }
        }
        progress_steps(steps)
        progress_title(paste("Error:", e$message))

        tryCatch({
          doc <- officer::read_docx()
          doc <- officer::body_add_par(doc, "Error Generating Document", style = "heading 1")
          doc <- officer::body_add_par(doc, paste("Error:", e$message))
          print(doc, target = file)
        }, error = function(e2) {
          writeLines(paste("Error:", e$message), file)
        })
      })

      # Hide progress after delay
      later::later(function() {
        progress_visible(FALSE)
      }, 3)
    }
  )

  # ============================================================================
  # DOWNLOAD: EXCEL (with progress)
  # ============================================================================

  output$download_excel <- downloadHandler(
    filename = function() {
      paste0("LM_Stats_Audit_", format(Sys.Date(), "%Y-%m-%d"), ".xlsx")
    },
    content = function(file) {

      # Initialize progress
      progress_title("Generating Excel Workbook")
      progress_steps(list(
        make_step("Checking openxlsx package"),
        make_step("Locating excel script"),
        make_step("Loading configuration"),
        make_step("Running calculations"),
        make_step("Building worksheets"),
        make_step("Writing Excel file")
      ))
      progress_percent(0)
      progress_visible(TRUE)

      tryCatch({

        # Step 1: Check openxlsx package
        steps <- progress_steps()
        steps <- update_step(steps, 1, "active")
        progress_steps(steps)
        progress_percent(10)

        Sys.sleep(0.2)

        if (!requireNamespace("openxlsx", quietly = TRUE)) {
          steps <- update_step(steps, 1, "error")
          progress_steps(steps)
          progress_title("Error: openxlsx package not installed")
          return()
        }

        steps <- update_step(steps, 1, "complete")
        progress_steps(steps)

        # Step 2: Check excel script
        steps <- update_step(steps, 2, "active")
        progress_steps(steps)
        progress_percent(25)

        Sys.sleep(0.2)

        if (!file.exists(excel_script_path)) {
          steps <- update_step(steps, 2, "error")
          progress_steps(steps)
          progress_title("Error: excel_audit.R not found")

          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(Error = "excel_audit.R script not found"))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)

          progress_percent(100)
          later::later(function() { progress_visible(FALSE) }, 3)
          return()
        }

        steps <- update_step(steps, 2, "complete")
        progress_steps(steps)

        # Step 3: Load config
        steps <- update_step(steps, 3, "active")
        progress_steps(steps)
        progress_percent(40)

        if (nzchar(input$manual_month)) {
          manual_month <<- tolower(input$manual_month)
        }

        steps <- update_step(steps, 3, "complete")
        progress_steps(steps)

        # Step 4: Source excel script (includes calculations)
        steps <- update_step(steps, 4, "active")
        progress_steps(steps)
        progress_percent(55)

        source(excel_script_path, local = FALSE)

        steps <- update_step(steps, 4, "complete")
        progress_steps(steps)

        # Step 5: Build worksheets
        steps <- update_step(steps, 5, "active")
        progress_steps(steps)
        progress_percent(75)

        steps <- update_step(steps, 5, "complete")
        progress_steps(steps)

        # Step 6: Write file
        steps <- update_step(steps, 6, "active")
        progress_steps(steps)
        progress_percent(90)

        create_audit_workbook(
          output_path = file,
          calculations_path = calculations_path,
          config_path = config_path,
          verbose = FALSE
        )

        steps <- update_step(steps, 6, "complete")
        progress_steps(steps)
        progress_percent(100)

        progress_title("Excel Workbook Generated Successfully")

      }, error = function(e) {
        steps <- progress_steps()
        for (i in seq_along(steps)) {
          if (steps[[i]]$status == "active") {
            steps <- update_step(steps, i, "error")
            break
          }
        }
        progress_steps(steps)
        progress_title(paste("Error:", e$message))

        tryCatch({
          wb <- openxlsx::createWorkbook()
          openxlsx::addWorksheet(wb, "Error")
          openxlsx::writeData(wb, "Error", data.frame(Error = c("Error generating workbook:", e$message)))
          openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
        }, error = function(e2) NULL)
      })

      # Hide progress after delay
      later::later(function() {
        progress_visible(FALSE)
      }, 3)
    }
  )

  # ============================================================================
  # RENDER: DASHBOARD PREVIEW
  # ============================================================================

  output$dashboard_preview <- renderUI({
    metrics <- dashboard_data()

    if (is.null(metrics)) {
      return(
        div(
          p(class = "govuk-body", "Click 'Preview Dashboard' to load the labour market statistics."),
          tags$ul(class = "govuk-list govuk-list--bullet",
            tags$li("Employment and unemployment figures"),
            tags$li("Inactivity rates"),
            tags$li("Vacancies and payroll data"),
            tags$li("Wage statistics")
          )
        )
      )
    }

    format_change <- function(val, invert, type) {
      if (is.na(val)) return(tags$span(class = "stat-neutral", "-"))

      if (is.na(invert)) {
        css_class <- "stat-neutral"
      } else if (val > 0) {
        css_class <- if (invert) "stat-negative" else "stat-positive"
      } else if (val < 0) {
        css_class <- if (invert) "stat-positive" else "stat-negative"
      } else {
        css_class <- "stat-neutral"
      }

      sign_str <- if (val > 0) "+" else ""
      formatted <- if (type == "rate") {
        paste0(sign_str, round(val, 1), "pp")
      } else if (type == "wages") {
        paste0(sign_str, round(val, 1), "%")
      } else {
        paste0(sign_str, format(round(val), big.mark = ","))
      }

      tags$span(class = css_class, formatted)
    }

    format_current <- function(val, type) {
      if (is.na(val)) return("-")
      if (type == "rate" || type == "wages") {
        paste0(round(val, 1), "%")
      } else {
        format(round(val), big.mark = ",")
      }
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

  # ============================================================================
  # RENDER: TOP TEN PREVIEW
  # ============================================================================

  output$topten_preview <- renderUI({
    top10 <- topten_data()

    if (is.null(top10)) {
      return(
        div(
          p(class = "govuk-body", "Click 'Preview Top Ten Stats' to load the key statistics."),
          tags$ul(class = "govuk-list govuk-list--bullet",
            tags$li("Wage growth (nominal and CPI-adjusted)"),
            tags$li("Employment and unemployment rates"),
            tags$li("Payroll employment"),
            tags$li("Inactivity trends"),
            tags$li("Vacancies and redundancies")
          )
        )
      )
    }

    items <- lapply(1:10, function(i) {
      line_key <- paste0("line", i)
      line_text <- top10[[line_key]]
      if (is.null(line_text) || line_text == "") {
        line_text <- "(Data not available)"
      }
      tags$li(line_text)
    })

    tags$ol(class = "top-ten-list", items)
  })
}

# ==============================================================================
# RUN APPLICATION
# ==============================================================================

shinyApp(ui = ui, server = server)
