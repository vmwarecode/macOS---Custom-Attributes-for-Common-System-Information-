##  SIP-STATUS  ##

csrutil status | awk '{print toupper($5)}' | sed 's/\.//g'


##  OS-MINORBUILDVERSION  ##  

/usr/bin/sw_vers -buildVersion


##  BATTERY-CYCLECOUNT  ##

ioreg -r -c "AppleSmartBattery" | grep -w "CycleCount" | awk '{print $3}' | sed s/\"//g


##  BATTERY-HEALTHSTATUS  ##

result=`ioreg -r -c "AppleSmartBattery" | grep "PermanentFailureStatus" | awk '{print $3}' | sed s/\"//g`
if [ "$result" == "1" ]; then
result="FAIL"
elif [ "$result" == "0" ]; then
result="OK"
fi
echo $result
