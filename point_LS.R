# script to subset and create met files into hdf5 files from netcdf files for LS site
# Karun Pandit, 2019
############################################33
rm(list=ls()) 


library(rhdf5)
library(ncdf4)
setwd('/home/kpandit/scratch/MET_LS')


for (i in 2001:2017) { # i = '2007'
  for (j in 1:12) {


jj <- sprintf("%02d",j)

infile <- paste0("/mnt/selway/data/data_02/karun_test/d02_",i,"_",jj,".nc")

#Create new hdf5 file
ncin<-nc_open(infile)

tmp<-ncvar_get(ncin,"T2") [83,59,]
pres <- ncvar_get(ncin,"PSFC") [83,59,]
prate_c<-ncvar_get(ncin,"RAINNC")[83,59,]
hgt<- ncvar_get(ncin,"HGT")[83,59,]
ugrd<- ncvar_get(ncin,"U10") [83,59,]
vgrd<- ncvar_get(ncin,"V10")[83,59,]
sh <- ncvar_get(ncin,"Q2")[83,59,]
dlwrf<- ncvar_get(ncin, "GLW")[83,59,]
nbdsf<- ncvar_get(ncin,"SWDOWN")[83,59,]
lat<- ncvar_get(ncin,"XLAT")[83,59,]
lon <- ncvar_get(ncin,"XLONG")[83,59,]



s=1

t = length(prate_c)
pr1 =  matrix (0,t)
pr2 = matrix(0,t)

for (s in 2:t) {

  
  pr1<- prate_c[c(s)]-prate_c[c(s-1)] 
  
 
  
  pr2[s] <- pr1 
}

bbb<- mean(pr2[2:4])

pr2[1] <-bbb


prate <- pr2/3600

n = length(tmp)


if (j == 1) {j  = "JAN"}
if (j == 2) {j  = "FEB"}
if (j == 3) {j  = "MAR"}
if (j == 4) {j  = "APR"}
if (j == 5) {j  = "MAY"}
if (j == 6) {j  = "JUN"}
if (j == 7) {j  = "JUL"}
if (j == 8) {j  = "AUG"}
if (j == 9) {j  = "SEP"}
if (j == 10) {j = "OCT"}
if (j == 11) {j = "NOV"}
if (j == 12) {j = "DEC"}



filename <- paste0("US_",i,j,".h5")

# Create new hdf5 file
h5createFile(filename)

h5createDataset(filename, "tmp", c(n,1,1))
h5createDataset(filename, "pres", c(n,1,1))
h5createDataset(filename, "prate", c(n,1,1))
h5createDataset(filename, "hgt", c(n,1,1))
h5createDataset(filename, "ugrd", c(n,1,1))
h5createDataset(filename, "vgrd", c(n,1,1))

h5createDataset(filename, "sh", c(n,1,1))
h5createDataset(filename, "dlwrf", c(n,1,1))
h5createDataset(filename, "nbdsf", c(n,1,1))

h5createDataset(filename, "nddsf", c(n,1,1))
h5createDataset(filename, "vbdsf", c(n,1,1))
h5createDataset(filename, "vddsf", c(n,1,1))




h5write(tmp, file = filename, name = "/tmp")
h5write(pres, file = filename, name = "/pres")
h5write(prate, file = filename, name = "/prate")
h5write(hgt, file = filename, name = "/hgt")
h5write(ugrd, file = filename, name = "/ugrd")
h5write(vgrd, file = filename, name = "/vgrd")
h5write(sh, file = filename, name = "/sh")
h5write(dlwrf, file = filename, name = "/dlwrf")
h5write(nbdsf, file = filename, name = "/nbdsf")


 }

}

H5close()

