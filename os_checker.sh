#!/bin/sh

# The function returns Linux distribution id
linux_flavor()
{
	# Get distribution information searching for release file
	# Filter only the ID param using grep
	# Filter the stream to get clean text using sed
	echo $(cat /etc/*release | grep ^ID= | sed 's/ID=// ; s/"//g')
}

# Check if root is running the script ( root id is 0 )
if [ "$(id -u)" -ne 0 ]
then
	echo "Only root can run this script"
	exit 1
fi

# Check if the system is Linux based
if [ "$(uname)" != "Linux" ]
then
	echo "This is not a Linux platform"
	exit 1
fi

dist_name=$(linux_flavor)

# Check the Linux distribution and provide information about the specific distributaion
case ${dist_name} in

	centos)
		echo "CentOS is a Linux distribution that provides a free and open-source community-supported computing platform"
		;;
	rhel)
		echo "Red Hat, Inc. is an American software company that provides open source software products"
		;;
	sles)
		echo "SUSE is a German-based multinational open-source software company"
		;;
	*)
		echo "Other Linux distribution"
		;;
esac