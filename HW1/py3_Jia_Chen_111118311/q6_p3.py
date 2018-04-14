def interleavingsHelper(str1, str2, iStr, m, n, i):

    if(m==0 and n==0):
        print(list(iStr))

    if(m != 0):
        iStr[i] = str1[0]
        interleavingsHelper(str1[1:], str2, iStr, m-1, n, i+1)

    if(n != 0):
        iStr[i] = str2[0]
        interleavingsHelper(str1, str2[1:], iStr, m, n-1, i+1)
 

def interleavings(list1, list2):
	str1 = ''.join(map(str,list1))
	str2 = ''.join(map(str,list2))
	m = len(str1)
	n = len(str2)
	iStr = [''] *(m+n)

	interleavingsHelper(str1, str2, iStr, m, n, 0)

interleavings([1,2,3],[4,5,6])