#!/bin/bash

ln -sf /usr/bin/ld.bfd /etc/alternatives/ld && ln -sf /etc/alternatives/ld /usr/bin/ld

# Retrieving target variables
ARCH=$(rpm -E '%_arch')
KERNEL=$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')
RELEASE=$(rpm -E '%fedora')

echo "Kernel module folder:"
ls /usr/lib/modules/

echo "Kernel SRC folder:"
ls /usr/src/kernels/

echo "LD path:"
find /usr -name ld
which ld

# Clone the repository
git clone https://github.com/umlaeute/v4l2loopback.git /tmp/v4l2loopback

# Change directory to the cloned repository
cd /tmp/v4l2loopback

# Compile the module for the target kernel
make -C /usr/src/kernels/${KERNEL} M=$(pwd) modules

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Error during the compilation of the v4l2loopback module."
    exit 1
fi

# Move the module to the correct location
mkdir -p /usr/lib/modules/${KERNEL}/extra/v4l2loopback/
mv v4l2loopback.ko /usr/lib/modules/${KERNEL}/extra/v4l2loopback/

# Update module dependencies for the specified kernel
depmod -a ${KERNEL}

# Display a confirmation message
echo "The v4l2loopback module has been successfully compiled and moved for kernel ${KERNEL}."
