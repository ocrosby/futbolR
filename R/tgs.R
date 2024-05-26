# Install and load the necessary packages
if (!require(httr)) install.packages("httr")
if (!require(jsonlite)) install.packages("jsonlite")

# Load necessary libraries
library(httr)
library(jsonlite)
library(dplyr)

base_url <- "https://public.totalglobalsports.com"

get_all_states <- function() {
  api_endpoint = "/api/Association"
  method = "/get-all-states"

  # Join the parts of the URL
  url <- paste0(base_url, api_endpoint, method)

  # Send a GET request to the URL
  response <- GET(url)

  # Check if the request was successful
  if (status_code(response) != 200) {
    stop("Request failed with status ", status_code(response))
  }

  # Parse the JSON response
  data <- fromJSON(content(response, "text"))

  # Return the data
  return(data)
}

get_all_countries <- function() {
  # Define the URL
  url <- "https://public.totalglobalsports.com/api/Association/get-all-countries"

  # Send a GET request to the URL
  response <- GET(url)

  # Check if the request was successful
  if (status_code(response) != 200) {
    stop("Request failed with status ", status_code(response))
  }

  # Parse the JSON response
  data <- fromJSON(content(response, "text"))

  # Return the data
  return(data)
}

get_current_orgs_list <- function(ecnlOnly = FALSE) {
  # Define the URL
  url <- "https://public.totalglobalsports.com/api/Association/get-current-orgs-list"

  # Send a GET request to the URL
  response <- GET(url)

  # Check if the request was successful
  if (status_code(response) != 200) {
    stop("Request failed with status ", status_code(response))
  }

  # Parse the JSON response
  data <- fromJSON(content(response, "text"))

  # Parse the JSON response
  data <- fromJSON(content(response, "text"))

  # Filter data if ecnlOnly is TRUE
  if (ecnlOnly) {
    data <- data %>% filter(grepl("ECNL", orgName, ignore.case = TRUE))
  }

  # Return the data
  return(data)
}


# Call the function
states <- get_all_states()
countries <- get_all_countries()
orgs <- get_current_orgs_list()

print(countries)
print(orgs)

# Interate over the list of organizations printing each one

for (org in orgs) {
  print(org["orgName"])
}
