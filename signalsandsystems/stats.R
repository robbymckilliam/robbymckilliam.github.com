print("Generating markstats.pdf from marks.csv")

marksdata <- read.csv("marks.csv")
pdf(file='markstats.pdf', width=10, height=9)

layout(matrix(c(1,2,3,4,5,5), 3, 2, byrow = TRUE))
#layout.show(2)

midsemmarks <- na.omit(marksdata$Midsem.exam)
hist(midsemmarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Midsemester exam \n # of students %i,  mean %.2f, median %.0f, stdev %.2f", length(midsemmarks), mean(midsemmarks), median(midsemmarks), sd(midsemmarks)))
lines(density(midsemmarks,bw="SJ"))

pracmarks <- na.omit(marksdata$Practical.assignment)
hist(pracmarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Practical assignment \n # of students %i,  mean %.2f, median %.0f, stdev %.2f",length(pracmarks), mean(pracmarks), median(pracmarks), sd(pracmarks)))
lines(density(pracmarks,adjust=1.3))

theorymarks <- na.omit(marksdata$Theory.assignment)
hist(theorymarks,breaks=0:21-0.5,prob=TRUE,xlab="Marks",main=sprintf("Theory assignment \n # of students %i,  mean %.2f, median %.0f, stdev %.2f",length(theorymarks), mean(theorymarks), median(theorymarks), sd(theorymarks)))
lines(density(theorymarks,adjust=1))

finalexammarks <- na.omit(marksdata$Final.exam)
hist(finalexammarks,breaks=0:41-0.5,prob=TRUE,xlab="Marks",main=sprintf("Final exam \n # of students %i,  mean %.2f, median %.0f, stdev %.2f",length(finalexammarks), mean(finalexammarks), median(finalexammarks), sd(finalexammarks)))
lines(density(finalexammarks,adjust=1))

totalmarks <- na.omit(marksdata$Total)
hist(totalmarks,breaks=0:101-0.5,prob=TRUE,xlab="Marks",main=sprintf("Total \n # of students %i,  mean %.2f, median %.0f, stdev %.2f",length(totalmarks), mean(totalmarks), median(totalmarks), sd(totalmarks)))
lines(density(totalmarks,adjust=1))


dev.off()

