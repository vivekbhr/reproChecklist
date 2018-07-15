library(shiny)
library(shinyjs)
library(shinychecklist)
library(googlesheets)
## create a google sheet
#checklist_data <- gs_new("checklist", ws_title = "repro-checklist",
 #                   trim = TRUE, verbose = FALSE)

## prepare the OAuth token and set up the target sheet:
##  - do this interactively
##  - do this EXACTLY ONCE

# shiny_token <- gs_auth() # authenticate w/ your desired Google identity here
# saveRDS(shiny_token, "shiny_app_token.rds")

## if you version control your app, don't forget to ignore the token file!
## e.g., put it into .gitignore

googlesheets::gs_auth(token = "shiny_app_token.rds")

# Define the storage type
store <- list(type = STORAGE_TYPES$GOOGLE_SHEETS,
              path = "responses",
              key = "1bXnkNtxVWcWXzhb-SPTNWP30VKiVydVL9Gre811adAc")


## get checklist info from yaml
checklist <- getquestions("checklist.yaml")

## create form
basicInfoForm <- list(
  id = "checklist",
  questions = checklist$questions,
  storage = store,
  name = "#eLifeAmbassadors computational reproducibility checklist",
  password = "shinychecklist",
  reset = TRUE)

#titlePanel(""),

### UI and server
#ui <- fluidPage(
#  titlePanel("#eLifeAmbassadors computational reproducbility checklist"),

#      tabsetPanel(
#        tabPanel("Checklist",
#            formUI(formInfo = basicInfoForm)
#        ),
#        tabPanel("Results",
#                 DT::dataTableOutput('table')
#        )
#      )
#)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.panel === "Checklist"',
        helpText("This is the #eLifeAmbassadors checklist to evaluate
                  reproducibility of computational methods for manuscript
                  authors and reviewers in life sciences. Please enter the
                  details of the article you would like to evaluated below.")
      ),
      conditionalPanel(
        'input.panel === "Results"',
        checkboxGroupInput("show_vars", "Columns in the table to show:",
                           checklist$qtitles, selected = checklist$qtitles[1:2])
      )
    ),
    mainPanel(
      tabsetPanel(
        id = 'panel',
        tabPanel("Checklist", formUI(formInfo = basicInfoForm)),
        tabPanel("Results", DT::dataTableOutput('table'))
      )
    )
  )
)

server <- function(input, output, session) {
  formServer(basicInfoForm)

  output$table <- DT::renderDataTable({
    DT::datatable(
      loadData(basicInfoForm$storage),
      rownames = FALSE,
      input$show_vars,
      options = list(searching = TRUE,
                     lengthChange = TRUE,
                     scrollX = TRUE,
                     orderClasses = TRUE)
    )
  })
  }

## App
shinyApp(ui = ui, server = server)
