function cal()
{
   n1=$1
   op=$2
   n2=$3
   ans=0
   if [ $# -eq 3 ]; then
       ans=$(( $n1 $op $n2 ))
       echo "$n1 $op $n2 = $ans"
       return $ans
   else
      echo "Function cal requires atleast three args"
   fi
 return
}

 cal 5 + 10
 cal 10 - 2
 cal 10 / 2
 echo $? 

