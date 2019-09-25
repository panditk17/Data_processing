# Codes to read cohort level outputs, patch level outputs and polygon level outputs
# and calculate polygon level outputs from cohort outputs over time
# to calculate sensitivity index (SI)
# Karun Pandit
###################################################3

# remove previous files
rm(list=ls()) 

# install necessary packages
library(rhdf5)
#      library(ncdf4)

# ........................


path1<- '/home/kpandit/scratch/point_sens/ls_sens_a/lw_1'
path2<- '/home/kpandit/scratch/point_sens/ls_sens_a/lw_01'

setwd(path1)
#setwd('/home/karunpandit/new_sens/rt01')

styr <- 2001
endyr <- 2016
stmn<- 1
endmn<-12

var = "DMEAN_GPP_PY"
var_name = "NEP (KgC/m2/yr)"


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
      
      fileyy <- h5read(filexx,var)
      
      
      
      ddd1<- dim(fileyy)
      
      #yr <- matrix(0,ddd1)
      
      
      
      yr <- year
      
      
      cmm1 = sprintf("%02d",cmm)
      
      
      
      date1 <- paste0(yr,cmm1)
      
      date2 <- yr
      
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      
      
      
      
      
      abab<- cbind(fileyy,date1,date2,date3)
      
      
      
      bcd_1 <- rbind(bcd_1,abab)
      
      
    }
  }
}




aaaa<- as.numeric(as.character(bcd_1[,1]))
nnnn<- length(aaaa)
bbbb<- gl(nnnn,365,nnnn)
bcd_2<-aggregate(aaaa~bbbb, FUN=mean)

#********************************************************************************

setwd(path2)
#setwd('/home/karunpandit/new_sens/rt2')


rm(list=ls() [!ls() %in% c("bcd_1","bcd_2","styr","endyr")])

#styr <- 2001
#endyr <- 2009
stmn <- 1
endmn <- 12

var = "DMEAN_GPP_PY"
var_name = "NEP (KgC/m2/yr)"


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
      
      fileyy <- h5read(filexx,var)
      
      
      
      ddd1<- dim(fileyy)
      
      #yr <- matrix(0,ddd1)
      
      
      
      yr <- year
      
      
      cmm1 = sprintf("%02d",cmm)
      
      
      
      date1 <- paste0(yr,cmm1)
      
      date2 <- yr
      
      date3<- paste0(yr,"-",cmm1,"-",cddd)
      
      
      
      
      abab<- cbind(fileyy,date1,date2,date3)
      
      
      
      cde_1 <- rbind(cde_1,abab)
      
      
    }
  }
}

aa<- as.numeric(as.character(cde_1[,1]))
nn<- length(aa)
bb<- gl(nn,365,nn)
cde_2<-aggregate(aa~bb, FUN=mean)


#sensitivity analysis

bcdcol<-as.numeric(bcd_1[,1])
bcd_mean<-mean(bcdcol)

cdecol<-as.numeric(cde_1[,1])
cde_mean<-mean(cdecol)


diff<-bcd_mean-cde_mean
div<-max(bcd_mean,cde_mean)

si<-diff/div


maxmax<-as.numeric(bcd_1[,1])
minmin<-as.numeric(cde_1[,1])
mn_max<-mean(maxmax)
mn_min<-mean(minmin)

diff_new<- mn_max-mn_min
div_new<-max(mn_max,mn_min)
si_new <- diff_new/div_new


max_a<-as.numeric(bcd_2[15,2])
min_a<-as.numeric(cde_2[15,2])


diff_a<- max_a - min_a
div_a<-max(max_a,min_a)
si_a<-diff_a/div_a


si_all<-rbind(si,si_new,si_a)
write.csv(si_all,file="si_out")
print(si_all)



