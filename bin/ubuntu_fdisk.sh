#!/bin/bash

user=`whoami`
if [ ! x"$user" = x"root" ];then
	    echo "must use root"
	    exit 1
fi
MK_FS=/sbin/mkfs.ext4

#mk dev/sdb /home 
#b_st=`fdisk -l | grep "^/dev/sdb1"  2>/dev/null`
#if [ x"$b_st" = "x" ];then

#fdisk /dev/sdb  << EOF
#n
#p
#1



#wq
#EOF
#         sleep 10
#	 $MK_FS /dev/sdb1  
#	 sed -i '/^\/dev\/sdb1/'d /etc/fstab
#	 echo '/dev/sdb1  /home ext4    defaults    0  0' >> /etc/fstab
#	 sleep 2
#	 mount -a
# else 
#	 echo "sdb already fs"

#fi



#mk others /disk
F_ALL=`fdisk -l | grep "^Disk" | grep GB |  grep -v "/dev/sd[a,b]"  | awk '{print $2}' | awk -F":" '{print $1}'  2>/dev/null`
j=1
echo $F_ALL
for i in $F_ALL
do
	st=`fdisk -l | grep "^${i}1"  2>/dev/null`
	if [ x"$st" = "x" ];then
fdisk  ${i} << EOF
n
p
1



wq
EOF
         sleep 10
	 $MK_FS ${i}1
	 mkdir -p /disk${j}
	 sed -i '/\/disk'${j}'/'d /etc/fstab
	 echo "${i}1  /disk${j}  ext4    defaults    0  0" >> /etc/fstab
	 sleep 2
	 mount -a

	 ((j++))
fi
done

#add to rc.local
rc="/etc/rc.local"
rc_st=`cat $rc | grep "mount -a" 2>/dev/null`
if [ x"$rc_st" = "x" ];then
	echo "mount -a" >> $rc
fi

