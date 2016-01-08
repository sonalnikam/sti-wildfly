if grep -q "Red Hat" /etc/redhat-release ; then 
	yum -y update java 
fi
