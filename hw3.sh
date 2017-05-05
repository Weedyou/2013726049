#!/bin/bash
A=1
result=`pwd`
echo $PWD
ls|wc -l
LSM=`ls`
S=`ls|sort -df`

count=0
countsec=0 #10

#when count=directory
for count in $S
do
	if [ -d $count ]
	then
	echo "┌[$A] $count"
	echo "│-----------------------INFORMATION---------------------"
	echo -e "│[34mFile type : `stat -c %F $count`"
	echo -e "[0m│File Size : `stat -c %s $count`" #20
	echo "│Last modified time : `stat -c %y $count`"
	echo "│Permission : `stat -c %a $count`"
	echo "│Absolute path : $result/$count"
	echo "│Relative path : ./$count"
	echo "└-------------------------------------------------------"
	A=`expr $A + 1`
cd $count
B=1 #28
if [ `ls -l|wc -l` -gt 1 ]
then
	for countsec in $(ls | sort -df)
	do

	if [ -d $countsec ]
	then
	echo "	┌[$B] $count/$countsec"
	echo "	│-----------------------INFORMATION---------------------"
	echo -e "	│[34mFile type : `stat -c %F $countsec`"
	echo -e "	[0m│File Size : `stat -c %s $countsec`"
	echo "	│Last modified time : `stat -c %y $countsec`"
	echo "	│Permission : `stat -c %a $countsec`"
	echo "	│Absolute path : $result/$countsec"
	echo "	│Relative path : ././$countsec"
	echo "	└-------------------------------------------------------"
	B=`expr $B + 1`
	fi
	done


	for countsec in $(ls | sort -df)
	do

	if [ -f $countsec ]
	then
	echo "	┌[$B] $count/$countsec"
	echo "	│-----------------------INFORMATION---------------------"
	echo -e "	│[0mFile type : `stat -c %F $countsec`"
	echo -e "	[0m│File Size : `stat -c %s $countsec`"
	echo "	│Last modified time : `stat -c %y $countsec`"
	echo "	│Permission : `stat -c %a $countsec`"
	echo "	│Absolute path : $result/$countsec"
	echo "	│Relative path : ././$countsec"
	echo "	└-------------------------------------------------------"
	B=`expr $B + 1`
	fi
	done

	for countsec in $(ls | sort -df)
	do

	if [ -p $countsec ]
	then
	echo "	┌[$B] $count/$countsec"
	echo "	│-----------------------INFORMATION---------------------"
	echo -e "	│[32mFile type : `stat -c %F $countsec`"
	echo -e "	[0m│File Size : `stat -c %s $countsec`"
	echo "	│Last modified time : `stat -c %y $countsec`"
	echo "	│Permission : `stat -c %a $countsec`"
	echo "	│Absolute path : $result/$countsec"
	echo "	│Relative path : ././$countsec"
	echo "	└-------------------------------------------------------"
	B=`expr $B + 1`
	fi
	done


	
cd ..
fi
fi
done
cd ..


#when count=normal file
for count in $LSM
do
	if [ -f $count ]
then
	echo "┌[$A] $count"
	echo "│-----------------------INFORMATION---------------------"
	echo -e "│[0mFile type : `stat -c %F $count`"
	echo -e "[0m│File Size : `stat -c %s $count`"
	echo "│Last modified time : `stat -c %y $count`"
	echo "│Permission : `stat -c %a $count`"
	echo "│Absolute path : $result/$count"
	echo "│Relative path : $count"
	echo "└-------------------------------------------------------"
	A=`expr $A + 1`
fi
done


#when count=special
for count in $LSM
do
	if [ -p $count ]
then
	echo "┌[$A] $count"
	echo "│-----------------------INFORMATION---------------------"
	echo -e "│[32mFile type : `stat -c %F $count`"
	echo -e "[0m│File Size : `stat -c %s $count`"
	echo "│Last modified time : `stat -c %y $count`"
	echo "│Permission : `stat -c %a $count`"
	echo "│Absolute path : $result/$count"
	echo "│Relative path : $count"
	echo "└-------------------------------------------------------"
	A=`expr $A + 1`
fi
done

