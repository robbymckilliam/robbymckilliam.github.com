print("Generating markstats.pdf from marks.csv")
marksdata <- read.csv("marks.csv")
marks <- marksdata$Midsem.exam
pdf(file='markstats.pdf')
namarks <- na.omit(marks)
hist(namarks,breaks=0:20,prob=TRUE,xlab="Marks",main=sprintf("Midsem exam, mean %.2f, median %.0f, stdev %.2f", mean(namarks), median(namarks), sd(namarks)))
lines(density(namarks,bw="SJ"))
dev.off()
