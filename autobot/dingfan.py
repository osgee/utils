#!/usr/bin/env python3
import math

def main():
	group_size=int(input('group size:\n'))
	cost=float(input('cost:\n'))
	group={}
	for i in range(group_size):
		name=input("name "+str(i+1)+':\n')
		price=float(input("price "+str(i+1)+':\n'))
		group[name]=price
	discount=cost/sum(group.values())
	print('cost for each name:')
	for name in group.keys():
		print(name, '%.2f' % (math.ceil(group[name]*discount*100)/100))

if __name__ == '__main__':
	main()
