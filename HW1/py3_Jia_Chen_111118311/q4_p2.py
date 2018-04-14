from q4_p1 import getDictionary
import operator

def main():
	words = getDictionary()
	outFile = open("top10words.txt", "w+")
	sortedWords = sorted(words.items(), key = operator.itemgetter(1), reverse = True)

	for i in range(10):
		outFile.write(sortedWords[i][0])
		outFile.write(" , ")
		outFile.write(str(sortedWords[i][1]))
		outFile.write("\n")


	outFile.close()

main()