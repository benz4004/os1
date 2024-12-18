

AWK_SCRIPT="rename.awk"

#
# change your location here
#
awkspath=$HOME/bin/$AWK_SCRIPT

ls -1 > /tmp/file1.$$

tr "[A-Z]" "[a-z]" < /tmp/file1.$$ > /tmp/file2.$$

paste /tmp/file1.$$ /tmp/file2.$$ > /tmp/tmpdb.$$

rm -f /tmp/file1.$$
rm -f /tmp/file2.$$

#
# Make sure awk script exist
#

if [ -f $awkspath ]; then
   awk -f $awkspath /tmp/tmpdb.$$
else
   echo -e "\n$0: Fatal error - $awkspath not found"
   echo -e "\nMake sure \$awkspath is set correctly in $0 script\n"
fi

rm -f /tmp/tmpdb.$$


