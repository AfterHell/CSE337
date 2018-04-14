import time 

def method_1(lst):
	summation = 0
	length = float(len(lst))
	for i in lst:
		summation += i
	return summation/length

def method_2(lst):
	summation = 0
	length = float(len(lst))
	for i in lst:
		summation += i/length
	return summation

def method_3(lst):
	length = float(len(lst))
	return sum(lst)/length


range_max = 1000000
lst = range(range_max)

# method 1

begin = time.time()
avg = method_1(lst)
end = time.time()
print "Summation-then-division time elapsed", end - begin

# method 2

begin = time.time()
avg = method_2(lst)
end = time.time()
print "Division-then-summation time elapsed", end - begin

# method 3 

begin = time.time()
avg = method_3(lst)
end = time.time()
print "Built-in summation time elapsed", end - begin
