
function demo()
{
  echo "All Arguments to function demo(): $*"
  echo "First argument $1"
  echo "Second argument $2"
  echo "Third argument $3"
  return 
}
#
# Call the function
#
demo -f foo bar


