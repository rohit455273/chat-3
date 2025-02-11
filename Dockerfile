FROM wankrohit04/myshinyapp:server

ENV PORT=3838
CMD ["R", "-e", "shiny::runApp('/home/app', host = '0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
