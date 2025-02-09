
#library(gargle)
#library(shinylogs)

#library(sparklyr)
library(glue)
library(lubridate)

library(shiny)
options(cores=4)
library(glue)
#library(geoloc)
library(DBI)
library(dplyr)
#library(bigrquery)
#library(googleCloudStorageR)
library(jsonlite)
library(httr)
library(lubridate)
library(waiter)
#library(gargle)
#library(shinylogs)


library(shinyToastify)
#sc <- spark_connect(master = "local")
library(RSQLite)

#bq_auth(email = "wankrohit04@gmail.com",path = "WWW/spheric-crow-377302-c442e265da86.json")
#Sys.setenv("GCS_AUTH_FILE" = "WWW/spheric-crow-377302-c442e265da86.json")
con <- dbConnect(RSQLite::SQLite(), dbname = "WWW/Chat.DB")

#billing="spheric-crow-377302"
#con<-dbConnect(bigquery(),project="spheric-crow-377302",dataset="Chat",biling=billing)

con
#YOUR_API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmFwcGVhci5pbiIsImF1ZCI6Imh0dHBzOi8vYXBpLmFwcGVhci5pbi92MSIsImV4cCI6OTAwNzE5OTI1NDc0MDk5MSwiaWF0IjoxNzAzMTM4NDI5LCJvcmdhbml6YXRpb25JZCI6MjA0ODI3LCJqdGkiOiIyZDI5ZGEyYS0xOTEwLTQwMTgtOTc0My04Nzk5M2RmMTAxYTEifQ.9y3jkyNnhYecW6LkEiDjY4m8DyDZ5wafNmd9roMOhQo"

YOUR_API_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmFwcGVhci5pbiIsImF1ZCI6Imh0dHBzOi8vYXBpLmFwcGVhci5pbi92MSIsImV4cCI6OTAwNzE5OTI1NDc0MDk5MSwiaWF0IjoxNzM2MzAyNjY5LCJvcmdhbml6YXRpb25JZCI6MzAzMzc3LCJqdGkiOiIwZTYyNTViZC0wYzM2LTQwNWEtYTY3NC1jOTdlZmYyOGM0OWIifQ.C9Sd04edZq2mvm-Q4bOQq7ZwV25PKWFqB3A0zWXI1ZA"

#bq_auth(email = "wankrohit04@gmail.com",path = "WWW/spheric-crow-377302-c442e265da86.json")
#Sys.setenv("GCS_AUTH_FILE" = "WWW/spheric-crow-377302-c442e265da86.json")

# Define UI for application that draws a histogram
ui <- fluidPage(# log rocket
  useShinyToastify(),
  
  
  #twipla
  # HTML("<!-- TWIPLA Tracking Code for https://globalchathub.com/ish-hub-live-1/ --><script>(function(v,i,s,a,t){v[t]=v[t]||fun>"),
  
  tags$a(href="https://www.isolacehub.com","Visit OUR COMPANY SITE",target="_blank"),
  
  #tags$head(includeHTML("google-analytics.html")),
  #use_tracking(),
  
  waiter::use_waiter(),
  tagList(shiny::tags$div(class="random",style="width:100%;height:100vh;background-image:url('girl.jpg'); background-repeat: no-repeat;",shiny::tags$br(),shiny::tags$p(class='random-calls'),shiny::tags$p(class="wait",style="text-align:center;","JUST WAIT ..."))
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output,session) {
  session$onSessionEnded(function() {
    #active_users(active_users() - 1)
    
   # x=data.frame(t=Sys.time(),online=F)
   # saveRDS(x,"C:/Users/Acer/Documents/sesseion/WWW/x.RDS")
    reactive({
    sql=glue_sql("update 'Ip-server' set Ip= 'no'  where Link={I_p$L} ",.con = con)
    dbExecute(con,sql)
    #sql=glue_sql( "update 'Ip-server' set Person= '0'  where Link={I_p$L} ",.con = con)
    #dbGetQuery(con,sql)
    print("observe 1 query executed")
    sql1=glue_sql( "update 'Ip-server' set Person= '1'  where Link={t()$Link} ",.con = con)
    dbGetQuery(con,sql1)
    })
   # dbExecute(con,sql1)
    print(paste0("close",session$token))
    
  })
  observe({
    showToast(session,input,autoClose = F,type = "success",text = "If you are not connected to someone for more than 1 min, please press Change Room button below")
  }                                                             
  
  )
  #track_usage(storage_mode = store_json(path = "WWW/logs/"))
  
  
  
  t1=reactive({
    
    waiter <- waiter::Waiter$new()
    #waiter::use_waiter()
    
    waiter$show()
    on.exit(waiter$hide())
    #xx=tbl(con,"Ip-server")
    xx=dbReadTable(con,"Ip-server")
    
   #2/6/2025# sql=glue_sql("select * from 'Ip-server' where D_time BETWEEN {Sys.time()-minutes(3)} AND {(Sys.time())} AND Person ='1' order by RANDOM() LIMIT 1 " ,.con  = con)
    
    sql=glue_sql("select * from 'Ip-server' where Ip='yes' AND Person ='1' order by RANDOM() LIMIT 1 " ,.con  = con)
    
    
    q=dbGetQuery(con,sql)
    
    
    #print(paste("cx0",cx$D_time[1]))
    q
    #xx%>%filter(D_time, BETWEEN (now()-minutes(30) AND (now())) )
    #12-16sql=glue_sql("select * from 'Ip-server' where D_time BETWEEN {now()-minutes(10)} AND {(now())} AND Person ='1' ",.con = con)
    
    #12-16 q=dbExecute(con,sql)
    #dbFetch(q)
    #12-16 print(paste("1 link",q$Link))
    #12-16print(q$D_time)
    #   print(q$Ip)
    # print(geoloc::wtfismyip()$Your_IPAddress)
    
    # print(geoloc::wtfismyip()$Your_IPAddress)
    # print(paste("clas", class(cx)))
    #q=as.data.frame(q)
    
    #print(paste("1 link",q$Link))
    #12-16print(q$D_time)
    
    #q
    
  })
  
  
  
  
  
  
  observeEvent(input$Random_again,ignoreInit = T,{
    removeUI(".rand1")
    removeUI("iframe",multiple = T)
    removeUI("iframe",multiple = T)
    
    waiter <- waiter::Waiter$new()
    #waiter::use_waiter()
    
    waiter$show()
    on.exit(waiter$hide())
    #12-16sql=glue_sql("select * from Ip-server where D_time BETWEEN {Sys.time()-minutes(3)} AND {(Sys.time())} AND Person ='1' ",.con = con)
    
    # 12-16 q1=dbExecute(con,sql)
    
    #12-16 print(q1$Link)
    #2/6/2025xx=dbReadTable(con,"Ip-server")
    
    #2/6/2025c=xx%>%filter(D_time==today())
    #2/6/2025q1=c%>%filter(between(D_time,as.character(now()-minutes(30)) , as.character(now()) ) & Person==1)
   #2/6/2025 print(q1)
   
    sql=glue_sql("select * from 'Ip-server' where Ip='yes' AND Person ='1' order by RANDOM() LIMIT 1 " ,.con  = con)
    
    q1=dbGetQuery(con,sql)
    
     removeUI(".wait")
    
    #12-16  if(nrow(q1)==0){
    if(is.null(nrow(q1)) | nrow(q1)==0){
      removeUI(selector =  "#r1",multiple = T,immediate = T)
      
      insertUI(".random-calls","afterBegin",ui=tagList(shiny::tags$iframe(class="rand1",style="width:100vw;height:80vh;",src=I_p$L,allow="autoplay;camera;microphone;"),actionButton("Random_again","CHANGE PERSON",width = "100%",class="btn-warning")))
      removeUI("#Random_again",multiple = T)
      sql=glue_sql("update 'Ip-server' set Person= '1'  where Link={I_p$L} ",.con = con)
      
      dbGetQuery(con,sql)
      
      print(paste("self link",I_p$L))
      #jqui_hide("#r1",effect = "bounce")
    }
    else{
      cn=sample_n(q1,1)
      print(paste("sample",cn))
      print(paste("sample_time",cn$D_time))
      print("row>0")
      insertUI(".random-calls","afterBegin",ui=tagList(shiny::tags$iframe(class="rand",id="r1",style="width:100vw;height:80vh;",src=q1$Link,allow="autoplay;camera;microphone;"),actionButton("Random_again","CHANGE PERSON",width = "100%",class="btn-warning")))
      removeUI("#Random_again",multiple = T)
      
      sql=glue_sql( "update 'Ip-server' set Person= '0'  where Link={I_p$L} ",.con = con)
      dbGetQuery(con,sql)
      sql1=glue_sql( "update 'Ip-server' set Person= '2'  where Link={cn$Link} ",.con = con)
      dbGetQuery(con,sql1)
      #12-26  print(paste("2 link ",t()$Link))
      
      # removeUI(".rand")
      #insertUI(".random-calls","afterBegin",ui=shiny::tags$iframe(style="width:100vw;height:80vh;",src="https://r-testing.w>
      
    }
    
  })
  
  
  
  I_p= reactiveValues(L="")
  
  # I_p$x=geoloc::wtfismyip()$Your_IPAddress
  observe({
    
    waiter <- waiter::Waiter$new()
    #waiter::use_waiter()
    
    waiter$show()
    on.exit(waiter$hide())
    
    #12-16 print(paste("t=",t()))
    print(nrow(t()))
    removeUI(".wait")
    
    if(is.null(nrow(t()) ) |  nrow(t())==0){
      #12-16      removeUI(selector =  "#r1",multiple = T,immediate = T)
      #12-16      removeUI("iframe",multiple = T)
      removeUI(".rand1")
      removeUI("iframe",multiple = T)
      removeUI("iframe",multiple = T)
      
      
      removeUI("#Random_again")
      insertUI(".random-calls","afterBegin",ui=tagList(shiny::tags$iframe(class="rand1",style="width:100vw;height:80vh;",src=I_p$L,allow="autoplay;camera;microphone;"),actionButton("Random_again","CHANGE ROOM",width = "100%",class="btn-warning")))
      
      sql=glue_sql("update 'Ip-server' set Person= '1'  where Link={I_p$L} ",.con = con)
      dbExecute(con,sql)
      
      print(paste("self link",I_p$L))
      
      #jqui_hide("#r1",effect = "bounce")
    }
    else{
      
      #1-1-2025 cn=sample_n(t(),1)
      
      print(paste("sample_time",t()$D_time))
      print(class(t()))
      
      print(paste("person in t",t()$Person))
      print(paste("rows of sample",nrow(t())))
      #12-25  print(paste("sample",cn))
      #12-22removeUI(selector =  "#r1",multiple = T,immediate = T)
      #12-22 removeUI("iframe",multiple = T)
      print("row>0")
      removeUI(".rand1")
      removeUI("iframe",multiple = T)
      removeUI("iframe",multiple = T)
      removeUI("#Random_again")
      insertUI(".random-calls","afterBegin",ui=tagList(shiny::tags$iframe(class="rand",id="r1",style="width:100vw;height:80vh;",src=t()$Link,allow="autoplay;camera;microphone;"),actionButton("Random_again","CHANGE ROOM",width = "100%" ,class="btn-warning")))
      
      sql=glue_sql( "update 'Ip-server' set Person= '0'  where Link={I_p$L} ",.con = con)
      dbGetQuery(con,sql)
      print("observe 1 query executed")
      sql1=glue_sql( "update 'Ip-server' set Person= '2'  where Link={t()$Link} ",.con = con)
      dbGetQuery(con,sql1)
      print("observe executed")
      #12-16  print(paste("2 link ",t()$Link))
      
      # removeUI(".rand")
      #insertUI(".random-calls","afterBegin",ui=shiny::tags$iframe(style="width:100vw;height:80vh;",src="https://r-testing.w>
      
      
      
    }
    
    
  })
  
  
  observe({
    waiter <- waiter::Waiter$new()
    #waiter::use_waiter()
    
    waiter$show()
    on.exit(waiter$hide())
    # geoloc::wtfismyip()
    headers = c(
      `Authorization` = paste("Bearer ", YOUR_API_KEY, sep = ""),
      `Content-Type` = "application/json"
    )
    
    data = '{  "endDate": "2099-02-18T14:23:00.000Z",  "fields": ["hostRoomUrl"]}'
    
    res <- as.character(httr::POST(url = "https://api.whereby.dev/v1/meetings", httr::add_headers(.headers=headers), body = data))
    
    
    
    #li$hostRoomUrl
    li=fromJSON(res)
    
    sql1=glue_sql("insert into 'Ip-server' values ('0','yes','0','0','0',{now()},{li$hostRoomUrl},{'0'})",.con=con)
    
    dbExecute(con,sql1)
    I_p$L=li$hostRoomUrl
    print(paste("self linko:" ,I_p$L))
    #insertUI(".random-calls","afterBegin",ui=class="rand",id="r1",shiny::tags$iframe(class="rand",id="r1",style="width:100v>
    
  })
  
  
  
  t=reactive({
    
    waiter <- waiter::Waiter$new()
    #waiter::use_waiter()
    
    waiter$show()
    on.exit(waiter$hide())
    #xx=tbl(con,"Ip-server")
    xx=dbReadTable(con,"Ip-server")
    #6/2/2025 sql=glue_sql("select * from 'Ip-server' where D_time BETWEEN {Sys.time()-minutes(3)} AND {(Sys.time())} AND Person ='1' order by RANDOM() LIMIT 1 " ,.con  = con)
    sql=glue_sql("select * from 'Ip-server' where Ip='yes' AND Person ='1' order by RANDOM() LIMIT 1 " ,.con  = con)
    
    q=dbGetQuery(con,sql)
    
    #12-31c=xx%>%filter(D_time==today())
    #12-31cx=c%>%filter(between(D_time,as.character(now()-minutes(3)) , as.character(now()) ) & Person==1)
    #cn=sample_n(cx,1)
    print(paste("cx1",q$D_time[1]))
    print(paste("person in t",q$Person[1]))
    q
    #xx%>%filter(D_time, BETWEEN (now()-minutes(30) AND (now())) )
    # 312-16 sql=glue_sql("select * from 'Ip-server' where D_time BETWEEN {now()-minutes(10)} AND {(now())} AND Person ='1' ",.con = con)
    
    #12-16q=dbGetQuery(con,sql)
    #dbFetch(q)
    #12-16 print(paste("1 link",q$Link))
    #12-16print(q$D_time)
    #   print(q$Ip)
    # print(geoloc::wtfismyip()$Your_IPAddress)
    
    # print(geoloc::wtfismyip()$Your_IPAddress)
    #  print(paste("clas", class(q)))
    #q=as.data.frame(q)
    
    #print(paste("1 link",q$Link))
    #12-16print(q$D_time)
    
    #12-16 print(paste("new",q$Link))
    
    
  })
  
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
