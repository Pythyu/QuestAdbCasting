# Start daemon
adb devices > /dev/null
# Check if any devices is detected 
if [ $(adb devices | wc -l) -le 2 ] 
then
  echo "No devices found, please check that your headset is properly connected to your computer"
  exit 0
fi

echo "Make sure your computer and Quest headset are on the same WIFI network"
echo "Confirm(Enter):"
read conf

adb tcpip 5555
IP=$(adb shell ip route)

adb connect $IP:5555

scrcpy -b 30M --crop 1440:1540:60:60
