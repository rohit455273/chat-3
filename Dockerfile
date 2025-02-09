# Use an R runtime as a base image
FROM rocker/shiny:latest

# Make a directory in the container
RUN mkdir /home/chat

RUN mkdir /home/chat/WWW

# Copy the Shiny app files into the container
COPY app.R /home/chat/app.R

COPY WWW/Chat.DB /home/chat/WWW/Chat.DB

# Install R dependencies
RUN R -e "install.packages(c('shiny','glue','lubridate','DBI','RSQLite','jsonlite','httr','waiter','shinyToastify','dplyr', 'ggplot2', 'lubridate','magrittr'))"

# Expose the application port
#EXPOSE 8000
EXPOSE 3838

# Command to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/home/chat/app.R',host='0.0.0.0', port=3838)"]