# shellcheck shell=sh
sleep_time=1800
while [ true ]
do
  notify-send --icon=/home/marko977x/Pictures/reminder.png Reminder "exercise"
  sleep $sleep_time
done