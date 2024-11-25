# Q3
# Algo:
#       1) START: set value of i to 5 (since we want to start from 5, if you
#          want to start from other value put that value)
#       2) Start While Loop
#       3) Chechk, Is value of i is zero, If yes goto step 5 else
#          continue with next step
#       4) print i, decement i by 1 (i.e. i=i-1 to goto zero) and
#          goto step 3
#       5) END
#
i=5
while test $i != 0
do
	echo "$i
"
	i=`expr $i - 1`
done

