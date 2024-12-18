# Remark : Use this script to add new domain zone and www host useful for
#          vhosting 
#
# AddDomain.sh ver. b0.3
#
# 
# Change following varibles to point out correct entries
#
# 
NAMED_CONF_PATH="/etc/named.conf"  # named.conf file location with path
BIND_DB_PATH="/var/named"          # do not append / at the end

SERIAL_NO_COUNT="/var/named/AddDomain" # Where to get serial number count

MAIL_SERVER="mail.ecyberciti.com." # MX Pointer i.e. All Mail forword to this
                                   # domain will goes to this mail server

NS1="ns1.ecyberciti.com."          # First Name Server  
NS2="ns2.ecyberciti.com."          # Second Name Server


ADMIN_EMAIL="hostmaster.ecyberciti.com." # Hostmaster e-mail ID

# Input for - UDVs

ZONE_DB="" 
domainame=""
ipadd=""
serial_no=1                     # Default

#
# Main script begins here
#
echo -n "Enter Domain Name : " 
read domainame

ZONE_DB="$BIND_DB_PATH/$domainame.zone"

echo -n "Enter IP Address for $domainame : "
read ipadd

#
# Find the serial_no count for domain
#

if ! [ -f $SERIAL_NO_COUNT ] ; then
   echo "Init... Serial Number count to default 1"
   echo "1" > $SERIAL_NO_COUNT
   serial_no=1
else # get the last time saved serial_no count
   serial_no=`cat $SERIAL_NO_COUNT`
   serial_no=`expr $serial_no + 1`
   echo "$serial_no" > $SERIAL_NO_COUNT
fi

#
# See if domain alrady exists or not
#

if  grep \"$domainame\" $NAMED_CONF_PATH > /dev/null  ; then
    echo "Domain $domainame already exists, please try another domain"
    exit 1
fi

#
# Make sure its valid IP Address
#  
if which ipcalc > /dev/null ; then

 ipcalc -ms $ipadd > /dev/null 
 if ! [ $? -eq 0 ] ; then
    echo -e "*** Bad ip address: $ipadd\nTry again with correct IP Address."
    exit 2
 fi
else
  echo "Warning can't validate the IP Address $ipadd"
fi

#
# Open the named.conf file and append the entries
#
echo "zone  \"$domainame\" {" >> $NAMED_CONF_PATH
echo "       type master;  " >> $NAMED_CONF_PATH
echo "       file \"$domainame.zone\";" >> $NAMED_CONF_PATH
echo "};" >> $NAMED_CONF_PATH

#
# Crate zone file for our domain
#
echo "$domainame.  IN  SOA  $NS1  $ADMIN_EMAIL  ("        > $ZONE_DB
echo "               $serial_no       ;serial"           >> $ZONE_DB
echo "               28800            ;refresh"  >> $ZONE_DB
echo "               7200             ;retry"     >> $ZONE_DB
echo "               604800           ;expire"    >> $ZONE_DB
echo "               86400            ;TTL">> $ZONE_DB
echo "                                          )"       >> $ZONE_DB
echo ";" 						 >> $ZONE_DB
echo ";Name Servers"                                     >> $ZONE_DB
echo "$domainame.                IN        NS        $NS1" >> $ZONE_DB
#
# See if we want Name server 2
#
if [ "$NS2" != "" ]; then 
 echo "$domainame.                IN        NS        $NS2" >> $ZONE_DB
fi
echo ";" 						   >> $ZONE_DB
echo ";Mail Servers" 					   >> $ZONE_DB
echo "$domainame.	IN	MX	  10	    $MAIL_SERVER" >> $ZONE_DB
echo ";" 						   >> $ZONE_DB
echo ";IP addresses $domainame " 			   >> $ZONE_DB
echo "$domainame.	IN	A	$ipadd" >> $ZONE_DB
echo "www			IN	A	$ipadd" >> $ZONE_DB

echo "$domainame ($ipadd) Addedd successfully."




