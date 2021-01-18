#! /bin/bash  
  
HTPASSWD=/var/www/private/.htpasswd  
  
die () { echo "$*" >&2 ; exit 1 ; }  
  
read -p 'Enter user name: ' USER  
read -s -p 'Old password: ' OLDPW ; echo  
read -s -p 'New password: ' NEWPW0 ; echo  
read -s -p 'Re-type new password: ' NEWPW1 ; echo  
  
if LINE=$(grep ^"$USER": "$HTPASSWD")  
then  
    echo "$LINE" | sed 's/.*:\(..\)\(.\+\)/\1 \2/' | {   
        read SALT CRYPT  
        if [[ "$SALT$CRYPT" = $(echo "$OLDPW" | mkpasswd -sS "$SALT") ]] ; then  
            if [ "$NEWPW0" != "$NEWPW1" ] ; then  
                die "Password verification error!"  
	        fi  
            PWS=$(grep -v ^"$USER:" "$HTPASSWD")  
            {  
                echo "$PWS"  
                echo -n "$USER:"  
                echo "$NEWPW0" | mkpasswd -s  
            } > "$HTPASSWD"  
            echo "Updating password for user $USER."  
        else  
            die "Password verification error!"  
        fi  
    }  
else  
    die "Password verification error!"  
fi  


