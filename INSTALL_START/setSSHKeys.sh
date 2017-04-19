#! /bin/bash
if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
      	echo "Creating authorized_keys file"
        touch ~/.ssh/authorized_keys
        chmod 0600 ~/.ssh/authorized_keys
else
	if [ ! -d ~/.ssh/authorized_keys ]; then
        	echo "Creating authorized_keys file"
                touch ~/.ssh/authorized_keys
                chmod 0600 ~/.ssh/authorized_keys
	fi
fi

PATH_TO_KEY="http://key.pilarkto.net/key"
wget $PATH_TO_KEY

key=$(echo $PATH_TO_KEY | sed 's_.*/__')
cat $key >> ~/.ssh/authorized_keys
rm $key
