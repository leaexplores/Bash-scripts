###############################################################
#Copyright (c)  2011, Mathieu Rhéaume <ddrmanxbxfr@gmail.com>
#
#Permission to use, copy, modify, and/or distribute this software for any
#purpose with or without fee is hereby granted, provided that the above
#copyright notice and this permission notice appear in all copies.
#
#THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
###############################################################
# Location Québec, Canada.
# Date 7 Avril 2011
###############################################################
#!/bin/bash
function pressAKeyToContinue {
echo "==================================="
echo "    Press enter to continue.	"
echo "==================================="
read
clear
}

clear
indMenu="0"
while [ "$indMenu" != "4" ]
do
clear
echo "System information script"
echo "============================================"
echo "1. Informations about the Operating System"
echo "2. Informations about the hardware"
echo "3. Informations and operation in the system (CPU/RAM usage, purge disk cache...)"
echo "4. Exit."
echo -n "Your choice : "
read indMenu
case $indMenu in
	1)
	indMenuOne="0"
	while [ "$indMenuOne" != "6" ]
	do
	clear
	echo "Informations about the Operating System."
	echo "============================================"
	echo "1. Operating system release."
	echo "2. Operating system name."
	echo "3. Operating system version."
	echo "4. Operating system architecture name."
	echo "5. Show all infos of the operating system."
	echo "6. Back to the previous menu."
	echo -n "Your choice : "
	read indMenuOne
	case $indMenuOne in
		1)
		clear
		echo -n "The operating system release is "
		uname -r
		pressAKeyToContinue 
		;;
		2)
		clear
		echo -n "The operating system name is "
		uname -s
		pressAKeyToContinue 
		;;
		3)
		clear
		echo "The operating system version is"
		sysctl kern.version
		pressAKeyToContinue 
		;;
		4)
		clear
		echo -n "The operating system architecture name is "
		uname -p
		pressAKeyToContinue 
		;;
		5)
		clear
		echo -n "The operating system informations are "
		uname -a
		pressAKeyToContinue 
		;;
		6);;
		*)
		clear
		echo "Invalid choice"
		pressAKeyToContinue
		;;

	esac
	done
	;;
	2)
	indMenuSecond=0
	while [ "$indMenuSecond" != "4" ]
	do
		clear
		echo "Hardware infos"
		echo "============================================"
		echo "1. CPU informations"
		echo "2. List the available hard drives and partitions."
		echo "3. Total memory and user memory on the system."
		echo -e "4. Return to the last menu."
		echo -n "Your choice : "
		read indMenuSecond
		case $indMenuSecond in
			1)
			clear
			echo -n "Cpu vendor : " 
			sysctl machdep.cpu.vendor | awk '{print $2}'
			echo -n "Cpu familly : "
			sysctl machdep.cpu.family | awk '{print $2}'
			echo -n "Cpu model : "
			sysctl machdep.cpu.model | awk '{print $2}'
			echo -n "Cpu brand_string :"
			sysctl machdep.cpu.brand_string | awk '{$1="";print}'
			echo -n "Number of physical cores : "
			sysctl machdep.cpu.core_count | awk '{print $2}'
			echo -n "Number of threads : "
			sysctl machdep.cpu.thread_count | awk '{print $2}'
			echo -n "L1 Cache size(in bytes) : "
			sysctl hw.l1dcachesize | awk '{print $2}'
			echo -n "L2 Cache size(in bytes) : "
			sysctl hw.l2cachesize | awk '{print $2}'
			echo -n "L3 Cache size(in bytes) : "
			sysctl hw.l3cachesize | awk '{print $2}'
			echo -n "Cpu extensions supported : "
			sysctl machdep.cpu.features | awk '{$1="";print}'
			pressAKeyToContinue
			;;
			2)
			clear
			echo "Hard drives and partitions available."
			ls /dev | grep "^disk"
			pressAKeyToContinue
			;;
			3)
			clear
			echo "Physical memory available(in bytes) : "
			sysctl hw.physmem | awk '{print $2}'
			sysctl hw.usermem | awk '{print $2}'
			pressAKeyToContinue
			;;
			4);;
			*)
			clear
			echo "Invalid choice"
			pressAKeyToContinue
			;;
		esac
	done
	;;
	3)
	indMenuThird=0
	while [ "$indMenuThird" != "9" ]
	do
	clear
	echo "System usage"
	echo "============================================"
	echo "1. System usage Disk + Cpu."
	echo "2. Available space on hard drives."
	echo "3. System Uptime."
	echo "4. Purge disk cache."
	echo "5. Virtual memory usage."
	echo "6. Users logged into the system."
	echo "7. Process running ( Press Q to quit )"
	echo "8. Kill a running process"
	echo "9. Return to the last menu."
	echo -n "Your choice : "
	read indMenuThird
	case $indMenuThird in
		1)
		clear
		echo "The system usage is (3 count)"
		iostat -c 3
		pressAKeyToContinue
		;;
		2)
		clear
		echo "The space available on hard drives."
		df -h
		pressAKeyToContinue
		;;
		3)
		clear
		echo "The system uptime is"
		uptime
		pressAKeyToContinue
		;;
		4)
		clear
		echo "Purging disk cache."
		if purge;then
			echo "Purge has completed successfully"
		else
			echo "Purge has failed or is not installed!"
		fi
		pressAKeyToContinue
		;;
		5)
		clear
		echo "The virtual memory usage is"
		vm_stat
		pressAKeyToContinue
		;;
		6)
		clear
		echo "The logged in users are"
		who
		pressAKeyToContinue
		;;
		7)
		clear
		ps aux | less
		;;
		8)
		clear
		echo -n "Enter the PID number to kill : "
		read pidToKill
		echo -n "Enter the state you want to kill the process. -15 ends the program normally, -9 kill ! : "
		read pidStatus
		kill $pidStatus $pidToKill
		pressAKeyToContinue
		;;
		9);;
		*)
		clear
		echo "Invalid choice"
		pressAKeyToContinue
		;;
	esac
	done
	;;
	4);;
	*)
	clear
	echo "Invalid choice"
	pressAKeyToContinue
	;;
esac
done
