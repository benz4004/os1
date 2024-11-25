
year=0

echo -n "Enter the year, I will tell you whether its Leap year or Not? "
read year

ans=$(($year % 4))  # or try ans=`expr $year % 2`

if [ $ans -eq 0 ]; then
   echo "$year is Leap Year"
else
   echo "$year is NOT Leap Year"
fi


