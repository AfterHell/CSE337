import operator

def getDictionary():
	#inputFileName = input("Enter your filename: ")
	inFile = open("q4_input.txt", "r")
	words = {}

	for line in inFile:
		for word in line.split():
			countOfThisWord = words.get(word, 0)
			words.update({word : countOfThisWord+1})

	print(words)
	inFile.close()


	return words

getDictionary()
