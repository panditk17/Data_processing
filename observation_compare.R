setwd('C:/Karun_documents/fire_related_docs/fire_analysis/R_analysis')

obs<-read.csv('flux_observation.csv')


library(ggplot2)
library(gridExtra)
library(grid)
vvv=expression(paste("GPP (kgCm"^{-2},"yr"^{-1},")"))
var="GPP"
graphics.off()


plotname1 <- paste0("GPP_obsall111",var,".png")

png(plotname1,res = 300,width =12,height=12,units='in')

#par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)

par(mai=c(1,1.2,1,0))

attach(obs)
p1<- plot(obs[,1], obs[,2], main="EC observation vs model output",cex.main=2.5,
     xlab="", xaxt="n",ylab=vvv,yaxt="n",pch=19,cex=3, 
     col="red", bg="red", lwd=2,ylim=c(0,1.15),cex.lab=2.5)
axis(side=1,at=seq(1,4,1), cex.axis=1.5,labels = c("LS","WBS","US","RMS"), 
     cex.axis=2,cex.lab=2, tck = 0, col.ticks = "black")
axis(side=2,at=seq(0,1.2,0.2), cex.axis=2,labels = c(seq(0,1.2,0.2)), 
     cex.axis=2,cex.lab=2, tck = -0.01, col.ticks = "black")
abline(h=c(seq(0,1.2,0.2)),col="gray",lty=3,lwd=2)
par(xpd=TRUE)
legend(0.9,1.19,  legend=c("observation (2015)","observation (2016)","observation (2017)",
"model (no fire)", "model (low fire severity)","model (high fire severity)"),
col=c("blue","black","gray","green3","orange","red"),
pch=c(17,17,17,19,19,19),cex=2.2,ncol=2,bty="n")

par(new=TRUE)
plot(obs[,1], obs[,3], xlab="", ylab="",pch=19,cex=3, 
     col="orange", bg="red", xaxt="n",yaxt="n",lwd=2,ylim=c(0,1.15))
par(new=TRUE)
plot(obs[,1], obs[,4], xlab="", ylab="",pch=19,cex=3, 
     col="green3", bg="red", xaxt="n",yaxt="n",lwd=2,ylim=c(0,1.15))
par(new=TRUE)
plot(obs[,1], obs[,5], xlab="", ylab="",pch=17,cex=3, 
     col="blue", bg="red", xaxt="n",yaxt="n",lwd=2,ylim=c(0,1.15))
par(new=TRUE)
plot(obs[,1], obs[,6], xlab="", ylab="",pch=17,cex=3, 
     col="black", bg="red", xaxt="n",yaxt="n",lwd=2,ylim=c(0,1.15))
par(new=TRUE)
plot(obs[,1], obs[,7], xlab="", ylab="",pch=17,cex=3, 
     col="gray", bg="red", xaxt="n",yaxt="n",lwd=2,ylim=c(0,1.15))



dev.off()


test<-obs[,6:7]
mtest<-rowMeans(test)
nf_obs<-obs[,4]
obstest<-cbind(nf_obs,mtest)

pe<-(nf_obs-mtest)/mtest

