from q5_p1 import checkPassword

def main():
	password = input("Enter your password: ")
	while(not checkPassword(password)):
		password = input("Enter your password: ")
	print("Strong password, you can go now.")

main()