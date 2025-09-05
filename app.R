library(shiny)
library(bslib)

# UI
ui <- page_fillable(
	title = "Motor Trends Car Data",
	theme = bs_theme(bootswatch = "flatly"),

	card(
		card_header(
			"Motor Trend Car Road Tests",
			class = "bg-primary text-white"
		),
		card_body(
			p(
				"This dataset contains fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."
			),
			tableOutput("car_table")
		)
	)
)

# Server
server <- function(input, output, session) {
	output$car_table <- renderTable(
		{
			mtcars
		},
		rownames = TRUE
	)
}

# Run the app
shinyApp(ui, server)
