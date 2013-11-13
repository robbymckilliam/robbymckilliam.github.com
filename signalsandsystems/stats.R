print("Generating markstats.pdf from marks.csv")

marksdata <- read.csv("marks.csv")
pdf(file='markstats.pdf', width=10, height=5)

layout(matrix(c(1,2,1,2), 2, 2, byrow = TRUE))
#layout.show(2)

midsemmarks <- na.omit(marksdata$Midsem.exam)
hist(midsemmarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Midsemester exam \n # of students %i,  mean %.2f, median %.0f, stdev %.2f", length(midsemmarks), mean(midsemmarks), median(midsemmarks), sd(midsemmarks)))
lines(density(midsemmarks,bw="SJ"))

pracmarks <- na.omit(marksdata$Practical.assignment)
hist(pracmarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Practical assignment \n # of students %i,  mean %.2f, median %.0f, stdev %.2f",length(pracmarks), mean(pracmarks), median(pracmarks), sd(pracmarks)))
lines(density(pracmarks,adjust=1.3))

dev.off()

