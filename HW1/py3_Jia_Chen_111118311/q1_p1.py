import time
import csv

def main():
	inFile = open("prices_sample.csv", "r")
	reader = csv.reader(inFile)

	outFile = open("datetimes.txt", "w+")

	for row in reader:
		outFile.write(time.strftime('%Y-%m-%d %H:%M:%S\n', time.gmtime(int(row[0]))))


	inFile.close()
	outFile.close()

main()
