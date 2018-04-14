import csv
import time
from math import *


def main():
	inFile = open("prices_sample.csv", "r")
	reader = csv.reader(inFile)

	maxPrice = 0
	minPrice = 0
	medianPrice = 0
	meanPrice = 0
	sdPirce = 0

	maxDate = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(0))
	minDate = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(0))
	medianDate = time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(0))

	sumPrice = 0

	list1 = []
	for row in reader:
		list1.append([time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(int(row[0]))), float(row[1])])

		sumPrice += float(row[1])

	sortedList = sorted(list1, key = lambda l:l[1])
	count = len(sortedList)




	maxDate = sortedList[count-1][0]
	maxPrice = sortedList[count-1][1]
	minDate = sortedList[0][0]
	minPrice = sortedList[0][1]
	meanPrice = sumPrice/count

	indexOfMedian = 0
	if(count%2 == 1):
		indexOfMedian = int((count-1)/2)
	else:
		indexOfMedian = int(count/2)

	medianDate = sortedList[indexOfMedian][0]
	medianPrice = sortedList[indexOfMedian][1]

	innerValue = 0
	tempIndex = 0
	for i in sortedList:
		innerValue += (sortedList[tempIndex][1] - meanPrice) ** 2
		tempIndex += 1

	sdPrice = sqrt(innerValue/count)


	#print(list2)
	print("[maxDate = ",maxDate, ", ","maxPrice = ", maxPrice,"]")
	print("[minDate = ",minDate, ", ","minPrice = ", minPrice,"]")
	print("[medianDate = ",medianDate, ", ","medianPrice = ", medianPrice,"]")
	print("meanPrice = ", meanPrice)
	print("sdPrice = ", sdPrice)
	




	inFile.close()


main()
