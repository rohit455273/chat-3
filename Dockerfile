FROM wankrohit04/myshinyapp:server
EXPOSE 3838
ENV PORT=3838
CMD ["R", "-e", "shiny::runApp('/home/chat/app.R', host = '0.0.0.0', port=3838)"]
