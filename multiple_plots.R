setwd('C:/Karun_documents/fire_related_docs/fire_analysis/R_analysis')

ls_data<-read.csv('LS_fire_data.csv')
wbs_data<-read.csv('WBS_fire_data.csv')
us_data<-read.csv('US_fire_data.csv')
rms_data<-read.csv('RMS_fire_data.csv')

one<-us_data[,1]
var_name="GPP (kgC/m2/yr)"
var="gpp"
vvv=expression(paste("KgC/m"^"2","/yr"))

par(mfrow = c(2, 3))
par(cex = 0.6)
par(mar = c(6, 5, 2.5, 0.5), oma = c(0.2, 2.5, 3, 0.3))
#par(mar = c(0,0,0,0), oma = c(0.2, 2.5, 3, 0.3))
par(tcl = -0.25)
par(mgp = c(2, 0.35, 0))


# plots shrub GPP
plot(ls_data[,2],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.8)
#par(new=TRUE)
lines(ls_data[,5],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(ls_data[,8],type="l",ylab=vvv,xlab="Year",col="limegreen", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("Shrub GPP", side = 3, line = 0.5, cex = 1)


# plots grass GPP
plot(ls_data[,3],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.8)
#par(new=TRUE)
lines(ls_data[,6],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(ls_data[,9],type="l",ylab=vvv,xlab="Year",col="green2", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("C3 grass GPP", side = 3, line = 0.5, cex = 1)

#total gpp plot
plot(ls_data[,4],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.8)
#par(new=TRUE)
lines(ls_data[,7],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(ls_data[,10],type="l",ylab=vvv,xlab="Year",col="green2", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("Total GPP", side = 3, line = 0.5, cex = 1)

## WBS PLOTS *******************************************************

#shrub gpp plot
plot(wbs_data[,2],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.6)
#par(new=TRUE)
lines(wbs_data[,5],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(wbs_data[,8],type="l",ylab=vvv,xlab="Year",col="green2", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("Shrub GPP", side = 3, line = 0.5, cex = 1)

#C3 grass gpp plot
plot(wbs_data[,3],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.6)
#par(new=TRUE)
lines(wbs_data[,6],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(wbs_data[,9],type="l",ylab=vvv,xlab="Year",col="green2", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("Shrub GPP", side = 3, line = 0.5, cex = 1)

#total gpp plot
plot(wbs_data[,4],type="l",ylab=vvv,xlab="Year",col="red", xaxt="n",ylim= range(0,0.6),cex.axis=1.4,cex.lab=1.6)
#par(new=TRUE)
lines(wbs_data[,7],type="l",ylab=vvv,xlab="Year",col="yellow3", xaxt="n",ylim= range(0,0.6))
#par(new=TRUE)
lines(wbs_data[,10],type="l",ylab=vvv,xlab="Year",col="green2", xaxt="n",ylim= range(0,0.6))
axis(side=1,at=seq(0,150,25), cex.axis=1.5, labels = c(seq(0,150,25)), cex.axis=1.5,cex.lab=1.5, tck = -0.02, col.ticks = "black")
#par(xpd=FALSE)
abline(h=0, col="black", lty=2)
#abline(v=0, col="black", lty=2)
abline(v=25, col="red", lty=2)
mtext("Total GPP", side = 3, line = 0.5, cex = 1)


dev.off()

