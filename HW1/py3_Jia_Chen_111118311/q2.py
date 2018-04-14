import csv
import time
from math import *


def main():
	inFile = open("prices_sample.csv", "r")
	reader = csv.reader(inFile)

	sumOfXY = 0
	sumOfX = 0
	sumOfY = 0
	sumOfX2 = 0
	sumOfY2 = 0

	count = 0
	result = 0


	for row in reader:
		
		sumOfXY += float(row[0]) * float(row[1])
		sumOfX += float(row[0])
		sumOfY += float(row[1])
		sumOfX2 += float(row[0]) ** 2
		sumOfY2 += float(row[1]) ** 2
		count += 1
		
	result = (sumOfXY - (sumOfX*sumOfY)/count)/sqrt((sumOfX2 - (sumOfX**2)/count)*(sumOfY2 - (sumOfY**2)/count))



	print("The result of the Pearson Correlation = ", result)
	
	inFile.close()


main()
