
#
# Q2. Script to find out bigest number
#
# Algo:
#      1) START: Take three nos as n1,n2,n3.
#      2) Is n1 is greater than n2 and n3, if yes 
#         print n1 is bigest no goto step 5, otherwise goto next step
#      3) Is n2 is greater than n1 and n3, if yes 
#         print n2 is bigest no goto step 5, otherwise goto next step
#      4) Is n3 is greater than n1 and n2, if yes 
#         print n3 is bigest no goto step 5, otherwise goto next step
#      5) END
#
#

    if [ $# -ne 3 ]
    then
	echo "$0: number1 number2 number3 are not given" >&2
        exit 1    
    fi
    n1=$1
    n2=$2
    n3=$3
    if [ $n1 -gt $n2 ] && [ $n1 -gt $n3 ]
    then
	echo "$n1 is Bigest number"
    elif [ $n2 -gt $n1 ] && [ $n2 -gt $n3 ]         
    then
	echo "$n2 is Bigest number"
    elif [ $n3 -gt $n1 ] && [ $n3 -gt $n2 ]         
    then
        echo "$n3 is Bigest number"
    elif [ $1 -eq $2 ] && [ $1 -eq $3 ] && [ $2 -eq $3 ]
    then
	echo "All the three numbers are equal"    
    else
        echo "I can not figure out which number is biger"    
    fi    

