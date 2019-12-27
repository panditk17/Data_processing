setwd('C:/Karun_documents/fire_related_docs/fire_analysis/R_analysis')

ls_data<-read.csv('LS_fire_data.csv')
wbs_data<-read.csv('WBS_fire_data.csv')
us_data<-read.csv('US_fire_data.csv')
rms_data<-read.csv('RMS_fire_data.csv')
dist<-read.csv('annual_disturbance_all.csv')


one<-us_data[,1]
var_name="GPP (kgC/m2/yr)"
var="gpp"
vvv=expression(paste("GPP (kgCm"^{-2},"yr"^{-1},")"))

#attach(mtcars)
#par(mfrow=c(3,3))

graphics.off()
plotname1 <- paste0("GPP_all",var,".png")

png(plotname1,res = 300,width =12,height=12,units='in')


par(mfrow = c(4, 3))
par(cex = 0.6)
par(mar = c(1, 4, 5, 0.5), oma = c(6, 3, 0.2, 0.3))
par(tcl = -0.25)
par(mgp = c(0, 0.35, 0))

library(ggplot2)
library(gridExtra)
library(grid)

xvals<-seq(0,150,25)
yvals<-seq(0,0.6,0.1)
low=2
right=2
top=0.5
left=0.3

low1=2
right1=1.5
top1=0.5
left1=0.3


col_sh="forestgreen"
col_gr="yellow3"
graphics.off()
plotname1 <- paste0("GPP_all",var,".png")

png(plotname1,res = 300,width =16,height=16,units='in')



#plot.margin=unit(c(1,1,1,1),"cm"))

p1<-ggplot(ls_data, aes(x=ls_data[,1])) + 
  geom_area(aes(y=ls_data[,10],fill="psavert")) + 
  geom_area(aes(y=ls_data[,8], fill="uempmed")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6)) +

  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low1,right1,top1,left1), "lines"))+
  geom_hline(yintercept=0, linetype="twodash", color = "red")

p2<-ggplot(ls_data, aes(x=ls_data[,1])) + 
  geom_area(aes(y=ls_data[,7],fill="psavert")) + 
  geom_area(aes(y=ls_data[,5], fill="uempmed")) +
  
   geom_line(aes(x=dist[,1],y=dist[,4]),col="red",linetype="twodash") +
  
  labs(title="", 
       y=vvv,x="Year") +
 
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                          name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
 scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))
  #geom_vline(xintercept=25, linetype="dashed", color = "red")


p3<-ggplot(ls_data, aes(x=ls_data[,1])) + 
  geom_area(aes(y=ls_data[,4],fill="psavert")) + 
  geom_area(aes(y=ls_data[,2], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,7],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))
#geom_vline(xintercept=25, linetype="dashed", color = "red")


p4<-ggplot(wbs_data, aes(x=wbs_data[,1])) + 
  geom_area(aes(y=wbs_data[,10],fill="psavert")) + 
  geom_area(aes(y=wbs_data[,8], fill="uempmed")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6)) +
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low1,right1,top1,left1), "lines"))



p5<-ggplot(wbs_data, aes(x=wbs_data[,1])) + 
  geom_area(aes(y=wbs_data[,7],fill="psavert")) + 
  geom_area(aes(y=wbs_data[,5], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,10],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))

p6<-ggplot(wbs_data, aes(x=wbs_data[,1])) + 
  geom_area(aes(y=wbs_data[,4],fill="psavert")) + 
  geom_area(aes(y=wbs_data[,2], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,13],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))

p7<-ggplot(us_data, aes(x=ls_data[,1])) + 
  geom_area(aes(y=us_data[,10],fill="psavert")) + 
  geom_area(aes(y=us_data[,8], fill="uempmed")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6)) +
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low1,right1,top1,left1), "lines"))


p8<-ggplot(us_data, aes(x=us_data[,1])) + 
  geom_area(aes(y=us_data[,7],fill="psavert")) + 
  geom_area(aes(y=us_data[,5], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,16],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))

p9<-ggplot(us_data, aes(x=us_data[,1])) + 
  geom_area(aes(y=us_data[,4],fill="psavert")) + 
  geom_area(aes(y=us_data[,2], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,19],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))



p10<-ggplot(rms_data, aes(x=ls_data[,1])) + 
  geom_area(aes(y=rms_data[,10],fill="psavert")) + 
  geom_area(aes(y=rms_data[,8], fill="uempmed")) +
  
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6)) +
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray"))+
  theme(plot.margin = unit(c(low1,right1,top1,left1), "lines")) 



p11<-ggplot(rms_data, aes(x=rms_data[,1])) + 
  geom_area(aes(y=rms_data[,7],fill="psavert")) + 
  geom_area(aes(y=rms_data[,5], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,22],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))

p12<-ggplot(rms_data, aes(x=rms_data[,1])) + 
  geom_area(aes(y=rms_data[,4],fill="psavert")) + 
  geom_area(aes(y=rms_data[,2], fill="uempmed")) +
  
  geom_line(aes(x=dist[,1],y=dist[,25],col="red",linetype="twodash")) +
  labs(title="", 
       y=vvv,x="Year") +
  scale_x_continuous(labels = xvals,breaks=xvals,expand=c(0,0)) +  # change to monthly ticks and labels
  scale_y_continuous(labels=yvals,breaks=yvals,limits=c(0,0.6),sec.axis = sec_axis(~ . *1, 
                                                                                   name = "disturbance rate from fire", breaks=yvals,labels=yvals)) +
  theme( axis.title.y.right = element_text( angle = 90))+
  scale_fill_manual(name="", 
                    values = c("psavert"=col_gr, "uempmed"= col_sh)) +  # line color
  scale_color_manual(values=c("red")) +
  scale_linetype_manual(values=c("twodash")) +
  
  theme(plot.title = element_text(hjust=0.5, margin = margin(b = -25)),legend.position="none", panel.background = element_blank(),
        panel.grid.major = element_line(size = 0.25, linetype = 'dashed', colour = "gray")) +
  theme(plot.margin = unit(c(low,right,top,left), "lines"))


library(lemon)
library(cowplot)

#margin = theme(plot.margin = unit(c(1,1,1,1), "lines"))

grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,ncol=3,
             left = textGrob("RMS                                                US                                                  WBS                                                 LS", 
                             x=0.5,y=0.5, gp=gpar(fontsize=18,font=3),rot=90),
             top = textGrob("              No fire                                                     Low fire severity                                              High fire severity",
                            x=0.5,y=0.7,gp=gpar(fontsize=18,font=3))
             #annotation = textGrob("WBS", x=-0.02,y=3.5,gp=gpar(fontsize=16,font=3)),
             #annotation = textGrob("LS", x=-1.02,y=4.5,gp=gpar(fontsize=16,font=3)),
             #annotation = textGrob("RMS", x=-2.02,y=1.5, gp=gpar(fontsize=16,font=3))
             
)



graphics.off()
plotname1 <- paste0("GPP_all_legend1",var,".png")

png(plotname1,res = 300,width =12,height=16,units='in')
plot.new()

legend(x="center", ncol=2,legend=c("Shrub", "C3 grass"),
       fill=c(col_sh,col_gr),cex=1.4)
#par(xpd=TRUE)
#legend(x="center", ncol=2,legend=c("Disturbance rate from fire"),
      # col=c("red"), lty=1,lwd=3,cex=1.4)

graphics.off()
plotname1 <- paste0("GPP_all_legend2",var,".png")

png(plotname1,res = 300,width =12,height=16,units='in')
plot.new()

legend(x="center", ncol=1,legend=c("Disturbance rate from fire"),
       col=c("red"),lty="twodash",lwd=3, cex=1.4)
#par(xpd=TRUE)
#legend(x="center", ncol=2,legend=c("Disturbance rate from fire"),
# col=c("red"), lty=1,lwd=3,cex=1.4)
dev.off()

