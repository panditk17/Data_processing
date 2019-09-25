# Codes to read cohort level outputs, patch level outputs and polygon level outputs
# and calculate polygon level outputs from cohort outputs over time
# to plot ensemble of best simulations
# Karun Pandit
######################################################

# install necessary packages
library(rhdf5)
# remove previous files
rm(list=ls()) 

var = "DMEAN_GPP_PY"
var_name = "GPP_PY"
styr <- 2013
endyr <- 2014
# ...................................................
# ................ best_1............................
setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_1') # Define working directory

stmn <- 1
endmn <- 12

abc_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      abc_1 <- rbind(abc_1,abab)
    }
  }
}

# .........................................................
# ...................................................
# ................ best_2............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_2')

rm(list=ls() [!ls() %in% c("abc_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

bcd_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      bcd_1 <- rbind(bcd_1,abab)
    }
  }
}

# .........................................................

# ................ best_3............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_3')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

cde_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      cde_1 <- rbind(cde_1,abab)
    }
  }
}

# .........................................................
# ................ best_4............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_4')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

def_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      def_1 <- rbind(def_1,abab)
    }
  }
}

# .........................................................

# ................ best_5............................

setwd('//home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_5')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

efg_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      efg_1 <- rbind(efg_1,abab)
    }
  }
}

# .........................................................
# ................ best_6............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_6')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

fgh_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      fgh_1 <- rbind(fgh_1,abab)
    }
  }
}

# .........................................................

# ................ best_7............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_7')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","fgh_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

ghi_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      ghi_1 <- rbind(ghi_1,abab)
    }
  }
}

# .........................................................

# ................ best_8............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_8')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","fgh_1","ghi_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

hij_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      hij_1 <- rbind(hij_1,abab)
    }
  }
}

# .........................................................

# ................ best_9............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_9')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","fgh_1","ghi_1","hij_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

ijk_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      ijk_1 <- rbind(ijk_1,abab)
    }
  }
}

# .........................................................

# ................ best_10............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/best_10')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","fgh_1","ghi_1","hij_1","ijk_1","styr","endyr","var")]) 

stmn <- 1
endmn <- 12

jkl_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1} 
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}
    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}
    
    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      jkl_1 <- rbind(jkl_1,abab)
    }
  }
}

# .........................................................

# ................ ens_mean1............................

setwd('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/new_sens/mean_ens1')

rm(list=ls() [!ls() %in% c("abc_1","bcd_1","cde_1","def_1","efg_1","fgh_1","ghi_1","hij_1","ijk_1","jkl_1","styr","endyr","var")])

stmn <- 1
endmn <- 12

ens_1<-matrix(nrow=0,ncol=4)

for (year in seq (styr, endyr,1)) {
  if (year==styr) {stmn=10} else {stmn=1}
  if (year==endyr) {endmn=9} else {endmn=12}
  for (cmm in seq(stmn, endmn, 1)) {
    if (cmm == 1) {dd = 31}
    if (cmm == 2) {dd = 28}
    if (cmm == 3) {dd = 31}
    if (cmm == 4) {dd = 30}
    if (cmm== 5) {dd = 31}
    if (cmm== 6) {dd = 30}
    if (cmm== 7) {dd = 31}
    if (cmm== 8) {dd = 31}
    if (cmm== 9) {dd = 30}
    if (cmm== 10) {dd = 31}

    if (cmm== 11) {dd = 30}
    if (cmm== 12) {dd = 31}

    for (cdd in seq(1,dd,1)) {
      cmmm <- sprintf("%02d",cmm)
      cddd <- sprintf("%02d",cdd)
      filexx <- paste0("hhh-D-",year,"-",cmmm,"-",cddd,"-000000-g01.h5")
      fileyyy <- h5read(filexx,var)
      yr <- year
      cmm1 = sprintf("%02d",cmm)
      date1 <- paste0(yr,cmm1)
      date2 <- yr
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      abab<- cbind(fileyyy,date1,date2,date3)
      ens_1 <- rbind(ens_1,abab)
    }
  }
}

# .........................................................






allens<-cbind(abc_1[,1],bcd_1[,1],cde_1[,1],def_1[,1],efg_1[,1],fgh_1[,1],ghi_1[,1],hij_1[,1],ijk_1[,1],jkl_1[,1])
write.csv(allens, file = "all_ensemble")


e1<-as.numeric(abc_1[,1])
e2<-as.numeric(bcd_1[,1])
e3<-as.numeric(cde_1[,1])
e4<-as.numeric(def_1[,1])
e5<-as.numeric(efg_1[,1])
e6<-as.numeric(fgh_1[,1])
e7<-as.numeric(ghi_1[,1])
e8<-as.numeric(hij_1[,1])
e9<-as.numeric(ijk_1[,1])
e10<-as.numeric(jkl_1[,1])

eall<-cbind(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10)

emean<-rowMeans(eall)
eall2<-cbind(eall,emean)
cmean<-colMeans(eall2)
eall3<-rbind(eall2,cmean)

data16<-read.csv('/home/kpandit/EDsh/ED_sla8/output/gpp_fn/GPP_2016_RCEW.csv')
gpp_wy<-data16[,8]/1000*365
gpp_lo<-data16[,9]/1000*365



var_name= "GPP (KgC/m2/yr)"
plot(abc_1[,1],type="l",ylab=var_name,xlab="Days",col="lightgreen", xaxt="n",ylim= range(0,2.2))
axis(side=1,at=seq(0, 365, 50), labels = c(seq(0,365,50)), tck = -0.03, col.ticks = "black")
abline(h=0, col="black", lty=2)
par(new=TRUE)


plot(bcd_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(cde_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(def_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(efg_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)

plot(fgh_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(ghi_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)

plot(hij_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)

plot(ijk_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(jkl_1[,1],type="l",col="green",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)

plot(emean,type="l",col="red",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)
plot(gpp_lo,type="l",col="gray",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))

par(new=TRUE)

plot(gpp_wy,type="l",col="brown",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)


plot(ens_1[,1],type="l",col="black",xaxt="n", ylab="",xlab="", ylim = range(0,2.2))
par(new=TRUE)



legend(0,1.9, c("Daily","Annual"), lty= 1, lwd=c(1.5,1.5), cex=.9, col=c("black","red"),bty="n", text.font=2,x.intersp=1, adj=0.2,xjust=0.1, text.width=NULL)


# calculate mean ...................


#plot(vary, varx, type = "l", xaxt="n",ylim=range(-1,2))
plotname1 <- paste0("PLOT_",var,".png")
dev.copy(png, filename=plotname1)
dev.off()

write.csv(eall3,file="allensemble_means")

