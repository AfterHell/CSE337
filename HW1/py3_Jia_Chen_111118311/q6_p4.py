def checkIfMatch(substring, patternHashes):
	set1 = set()

	for value in patternHashes.values():
		listOfSubSubstring = [substring[index] for index in value]

		set1.add(listOfSubSubstring[0])
		#1. all the same in each list 
		for char in listOfSubSubstring:
			if(char == listOfSubSubstring[0]):
				pass
			else:
				return False

	#2. different from others in different list

	if(len(set1) != len(patternHashes.values())):
		return False

	return True


def count_pattern(str1, pattern, replace_str):
	assert len(str1) >= len(pattern)
	#complete
	pattern = list(pattern)
	str1 = list(str1)

	index = 0
	patternHashes = {}
	for char in pattern:
		value = patternHashes.get(char, 0)
		if(value == 0):
			patternHashes.update({char: [index]})
		else:
			value.append(index)
			patternHashes.update({char: value})

		index += 1

	#print(patternHashes)
	#Now we get the hashes of the pattern where unique chars are the keys,
	#and the list of corresponding indices are the values


	checkTimes = len(str1) - len(pattern) + 1
	i = 0
	while(i < checkTimes):
		if(checkIfMatch(str1[i:i+len(pattern)],patternHashes) == True):
			str1[i:i+len(pattern)] = replace_str
			i += len(pattern)
			#print(str1)
		else:
			i += 1

	return ''.join(str1)

print(count_pattern('shjhfdddedaaba','xyx','123'))

	