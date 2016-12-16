
	#install.packages("data.table")
	#install.packages("xgboost")
	#install.packages("snow")
	#install.packages("xlsx")
	#install.packages("glmnet")
	#install.packages("dplyr")
	#install.packages("moments")

	library(data.table)
	library(xgboost)
	library(snow)
	library(xlsx)
	library(glmnet)
	library(dplyr)
	library(moments)
	setwd("g:\\kaggle")

	main.train=fread("train.csv")
	main.test=fread("test.csv")

	#data 分割
	main.train.y=filter(main.train,Semana==9)

	main.train.x=filter(main.train,Semana %in% c(3:8))#訓練 預測9
	main.train.x.2=filter(main.train,Semana %in% c(3:9))#實際 預測10
	
	
	rm(main.train)
	gc()
	#------------------------------------------------------------
	s=Sys.time()
	result1=pred.fun(main.train.x,main.train.x.2,5000000,main.test)
	e=Sys.time()
	e-s
	gc()
	
	#s=Sys.time()
	#result2=pred.fun(main.train.x11,main.train.x11.2,5000000,main.test.11)
	#e=Sys.time()
	#e-s
	#gc()

	#------------------------------------------------------------
	result3 = result1 %>% arrange(id)

	gc()
	write.csv(result3,"pred1.csv",row.names = FALSE)










	
	
	
	
	
	
	







