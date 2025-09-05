library(shiny)
library(bslib)

ui <- page_fillable(
	title = "Motor Trends Car Data",
	theme = bs_theme(bootswatch = "flatly"),

	card(
		card_header(
			"Motor Trend Car Road Tests",
			class = "bg-primary text-white"
		),
		card_body(
			tableOutput("car_table")
		)
	)
)


server <- function(input, output, session) {
	# Pull LFS files before reading data
	system("git lfs pull")

	data <- readr::read_csv("mtcars3.csv")
	output$car_table <- renderTable(
		{
			data |> dplyr::sample_n(10)
		},
		rownames = TRUE
	)
}

# Run the app
shinyApp(ui, server)
