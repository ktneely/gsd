#! /bin/bash

# Status report creation script  ver 0.1
# Written by Kevin Neely, see the LICENSE file included in the repository.

DATE=`date +%Y-%m-%d`
REPORT=status-$DATE
#alias t='~ktneely/bin/todo'

echo "Status report for week ending $DATE" > $REPORT
echo "==================================="  >> $REPORT
echo " " >> $REPORT
echo "Actions needed:"  >> $REPORT
echo "--------------- " >> $REPORT
/home/ktneely/bin/todo.txt-cli/todo.sh -p list @waiting >> $REPORT

echo " " >> $REPORT
echo " " >> $REPORT
echo "Staff discussion or topic suggestions:"  >> $REPORT
echo "--------------------------------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p list +@topic >> $REPORT

echo " " >> $REPORT
echo " " >> $REPORT
echo "Accomplishments:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p lately >> $REPORT

echo " " >> $REPORT
echo " " >> $REPORT
echo " "  >> $REPORT 
echo "Open Todo items:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p projectview -@waiting >> $REPORT

echo "General FYI:" >> $REPORT
echo "-------------------" >> $REPORT
echo "none at this time" >> $REPORT

echo " " >> $REPORT
echo " " >> $REPORT
echo "Upcoming PTO & Training:" >> $REPORT
echo "-------------------"  >> $REPORT
remind ~/box/Documents/reminders/travel.txt |grep -v Reminders >> $REPORT

echo " " >> $REPORT
echo " " >> $REPORT
echo "{ Legend" >> $REPORT
echo "{ The todos loosely follow the GTD methodology" >> $REPORT
echo "{ + associates a task or item with a project" >> $REPORT
echo "{ @ associates a task or item with a context" >> $REPORT
echo "{ an (A) or (B) indicates priority" >> $REPORT
echo "{ the number is simply the task number and has no meaning " >> $REPORT
echo "{ " >> $REPORT
echo " "  >> $REPORT
