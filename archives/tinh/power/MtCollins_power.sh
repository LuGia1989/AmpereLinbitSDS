for i in {1..30}; do ipmitool -I lanplus -U admin -P admin -H $1 sdr get Total_Power | grep "Sensor Reading" >> /home/ampere/archives/tinh/power/$2; sleep 1; done
