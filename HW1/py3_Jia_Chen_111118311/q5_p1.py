def hasNumber(string):
	return any(char.isdigit() for char in string)

def hasAlpha(string):
	return any(char.isalpha() for char in string)

def hasSpecial(string):
	return any((not(char.isalpha()) and not(char.isdigit())) for char in string)

def hasSameCharTwiceConsecutively(string):
	lastChar = ''
	count = 0
	for char in string:
		if(count == 0):
			pass
		else:
			#check here
			if(char == lastChar):
				return True
		lastChar = char
		count += 1
	return False

def has3IncreasingChars(string):
	first = ''
	second = ''

	count = 0
	for char in string:
		if(count == 0):
			first = char

		elif(count == 1):
			second = char

		else:
			if((first.isdigit() == True and second.isdigit() == True and char.isdigit() == True)
			or((first.isalpha() == True and second.isalpha() == True and char.isalpha() == True))):
				#compare here
				if(ord(first) + 2 == ord(second) + 1 == ord(char)):
					return True
			else:
				pass

			first = second
			second = char


		count += 1
	return False

def hasLessThanHalfDistinctChars(password):
	setOfDistinctChars = set(password)
	if(len(setOfDistinctChars) < len(password)/2):
		return True
	else:
		return False

def checkPassword(password):
	#1.
	if(len(password) < 8):
		print("Less than 8")
		return False

	#2.
	elif(hasNumber(password) == False or hasAlpha(password) == False or hasSpecial(password) == False):
		print("Has no number or alpha or special")
		return False
	#3.
	elif(hasSameCharTwiceConsecutively(password) == True):
		print("Has SameChar Twice Consecutively")
		return False

	#4.
	elif(has3IncreasingChars(password) == True):
		print("Has 3 Increasing Chars")
		return False

	#5.
	elif(hasLessThanHalfDistinctChars(password) == True):
		print("Less than half distinct chars")
		return False

	else:
		return True
'''
#1
print(checkPassword("1234567"))
#2
print(checkPassword("12345678"))
print(checkPassword("abcdefgh"))
print(checkPassword("1234abcd"))

'''