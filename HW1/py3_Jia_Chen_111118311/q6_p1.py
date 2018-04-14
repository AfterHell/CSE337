def isPrime(x):
	for i in range(2,x):
		if(x%i == 0):
			return False
	return True

def main():
	print(list(filter(lambda x: isPrime(x), range(2,100+1))))

main()