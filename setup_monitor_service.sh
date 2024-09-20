sudo wget --no-check-certificate https://raw.githubusercontent.com/dinhduchiep/monitor-service-status/main/monitor_service.sh -O /usr/local/bin/monitor_service.sh
chmod +x /usr/local/bin/monitor_service.sh
nohup /usr/local/bin/monitor_service.sh >> ./out 2>&1 <&- &
crontab -l > monitor_service
echo "@reboot nohup /usr/local/bin/monitor_service.sh >> ./out 2>&1 <&- &" >> monitor_service
crontab monitor_service
