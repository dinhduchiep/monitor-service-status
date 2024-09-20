#!/bin/bash
while true
do

# Set up Telegram bot API and chat ID
BOT_API_KEY="BOT_API_KEY"
CHAT_ID="206948142"

# Check if MySQL service is running  
if ! systemctl is-active --quiet mysql.service; then
  # If not running, send message to Telegram
  MESSAGE="MySQL service is down!"
  curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if NGINX web server is running
if ! systemctl is-active --quiet nginx.service; then
  # If not running, send message to Telegram
  MESSAGE="NGINX web server is down!"
  curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if Apache web server is running
if ! systemctl is-active --quiet apache2.service; then
  # If not running, send message to Telegram
  MESSAGE="Apache web server is down!"
  curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if PHP8.2 service is running
if ! systemctl is-active --quiet php8.2-fpm.service; then
  # If not running, send message to Telegram
  MESSAGE="PHP service is down!"
  curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

sleep 1
done
