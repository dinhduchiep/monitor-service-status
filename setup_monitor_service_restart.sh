sudo wget --no-check-certificate https://raw.githubusercontent.com/dinhduchiep/monitor-service-status/main/monitor_service_restart.sh -O /usr/local/bin/monitor_service_restart.sh
chmod +x /usr/local/bin/monitor_service_restart.sh
nohup /usr/local/bin/monitor_service_restart.sh >> ./out 2>&1 <&- &
crontab -l > monitor_service_restart
echo "@reboot nohup /usr/local/bin/monitor_service_restart.sh >> ./out 2>&1 <&- &" >> monitor_service_restart
crontab monitor_service_restart
