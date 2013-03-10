#! /bin/bash

DATE=`date +%Y-%m-%d`
REPORT=status-$DATE
#alias t='~ktneely/bin/todo'

echo "{ Legend" > $REPORT
echo "{ The todos loosely follow the GTD methodology" >> $REPORT
echo "{ + associates a task or item with a project" >> $REPORT
echo "{ @ associates a task or item with a context" >> $REPORT
echo "{" >> $REPORT
echo " "  >> $REPORT
echo "Status report for week ending $DATE" >> $REPORT
echo "==================================="  >> $REPORT
echo " " >> $REPORT
echo "Actions needed:"  >> $REPORT
echo "--------------- " >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p list @waiting >> $REPORT

echo "Staff discussion or topic suggestions:"  >> $REPORT
echo "--------------------------------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p list +@topic >> $REPORT

echo "Accomplishments:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p lately >> $REPORT

echo " "  >> $REPORT 
echo "Open Todo items:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo.txt-cli/todo.sh -p projectview -@waiting >> $REPORT

# echo "General FYI:" >> $REPORT
# echo "-------------------" >> $REPORTlately

echo "Upcoming PTO & Training:" >> $REPORT
echo "-------------------"  >> $REPORT
remind ~/box/Documents/reminders/travel.txt >> $REPORT
