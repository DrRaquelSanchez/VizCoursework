### Project 1:

The variable "Free Lunch" from the table used in this session is telling you how many students receive lunch in a school. 

summary(eduwa$Free.Lunch)
#Then, when you see the minimum and max value, you can create groups by **cutting** the variable:
  
  ```{r, eval=TRUE}
eduwa$Free.LunchGroup=cut(eduwa$Free.Lunch,
                          breaks = c(0,100, 250, 500,1000,2000),
                          labels = c("100 and below","101-250","251-500","501-1000","1001 and above"))
```

This new variable has this table:
  ```{r, eval=TRUE}
table(eduwa$Free.LunchGroup)

Prepare a plot using the table above. 

#turn the table into a data frame
absoluteT2=table(eduwa$Free.LunchGroup,
                exclude = 'nothing') 
View(absoluteT2)

#re-naming the n/a values

names(absoluteT2)[6]='Unknown'

(tableFreq2=as.data.frame(absoluteT2))

# renaming data frame columns

names(tableFreq2)=c("FreeLunch","Count")

# adding percents:
tableFreq2$Percent=as.vector(propT2)

tableFreq2

#range as percents 

absoluteT2
propT2=prop.table(absoluteT2)*100

propT2

# Create the **base** object, which is not a plot, just informing the main variables:
#base GGPLOT2 starts with a "base", telling WHAT VARIABLES TO PLOT

base2= ggplot(data = tableFreq2, aes(x = FreeLunch, y = Percent))

#add the layer that produces the main plots 
#(the next layers will add or customize elements in the plot):

plot7 = base2 + geom_bar(fill ="blue",
                        stat = 'identity') 
plot7

titleText='Total Students Receiving Free Lunch by School'
sourceText='Source: US Department of Education'

plot8 = plot7 + labs(title=titleText,
                     x = "Ranges In Schools", 
                     y = "% of Students per School",
                     caption = sourceText) 
plot8

plot9 = plot8 + geom_hline(yintercept = 25, #where
                           linetype="dashed", 
                           size=1.5, #thickness
                           alpha=0.5) #transparency
plot9

# customize Y axis
plot10 = plot9 + scale_y_continuous(breaks=c(0,10,20, 30,40),
                                   limits = c(0, 40), 
                                   labels=unit_format(suffix = '%')) 
plot10

plot11 = plot10 + theme(plot.caption = element_text(hjust = 0), 
                      plot.title = element_text(hjust = 0.5))
plot11

tableFreq2=tableFreq2[order(tableFreq2$Percent),]
# then:
tableFreq2
(FreeLunchOrder=tableFreq2[order(tableFreq2$Percent),'FreeLunchOrder'])
LABELS=paste0(round(tableFreq2$Percent,2), '%')
base2= ggplot(data = tableFreq2, aes(x = FreeLunchOrder, y = Percent))


paste0(round(tableFreq2$Percent,2), '%')

# createing labels:
LABELS=paste0(round(tableFreq2$Percent,2), '%')
###
plot12 = plot11 + geom_text(vjust=0, #hjust if flipping
                          size = 6,
                          aes(y = Percent ,
                              label = LABELS))
plot12 
# + coord_flip() # wanna flip the plot?



#### adding these to base###
base= base + scale_x_discrete(limits=FreeLunchGroup) 
base= base + theme_classic()

plot7 = base2 + geom_bar(fill ="blue",
                         stat = 'identity') 
plot7

titleText='Total Students Receiving Free Lunch by School'
sourceText='Source: US Department of Education'

plot8 = plot7 + labs(title=titleText,
                     x = "Ranges in Schools", 
                     y = "% of Students per School",
                     caption = sourceText) 
plot8

plot9 = plot8 + geom_hline(yintercept = 25, #where
                           linetype="dashed", 
                           size=1.5, #thickness
                           alpha=0.5) #transparency
plot9

plot10 = plot9 + scale_y_continuous(breaks=c(0,10,20, 30,40),
                                    limits = c(0, 40), 
                                    labels=unit_format(suffix = '%')) 
plot10

plot11 = plot10 + theme(plot.caption = element_text(hjust = 0), 
                        plot.title = element_text(hjust = 0.5))
plot11

paste0(round(tableFreq2$Percent,2), '%')

# createing labels:
LABELS=paste0(round(tableFreq2$Percent,2), '%')
###

plot12 = plot11 + geom_text(vjust=0, size = 6, aes(y = Percent,label = LABELS))

plot12

  