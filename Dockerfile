FROM wankrohit04/myshinyapp:server

ENV PORT=3838
CMD ["R", "-e", "shiny::runApp('mek/home/chat/app.R', host = '0.0.0.0')"]
