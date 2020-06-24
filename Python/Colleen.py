# here is my source code
def self():
	return '# here is my source code%cdef self():%c\treturn %r%cdef main():%c\t# print my source code%c\tprint(self() %% (10,10,self(),10,10,10,10,10))%c%cmain()'
def main():
	# print my source code
	print(self() % (10,10,self(),10,10,10,10,10))

main()
