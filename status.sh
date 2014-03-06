#! /bin/bash

# Status report creation script  ver 0.2
# Written by Kevin Neely to generate TPS reports
# see the LICENSE file included in the repository.

DATE=`date +%Y-%m-%d`
REPORT=status-$DATE
#alias t='~ktneely/bin/todo'

echo "Status report for week ending $DATE" > $REPORT
echo "==================================="  >> $REPORT
echo " " >> $REPORT
echo "Actions needed:"  >> $REPORT
echo "--------------- " >> $REPORT
/home/ktneely/bin/todo -p list @waiting |egrep -v TODO >> $REPORT

echo " " >> $REPORT
echo "Staff discussion or topic suggestions:"  >> $REPORT
echo "--------------------------------------" >> $REPORT
~ktneely/bin/todo -p list @topic |egrep -v TODO >> $REPORT

echo " " >> $REPORT
echo "Accomplishments:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo -p lately |egrep -v 'FYI | \+personal' >> $REPORT

echo " "  >> $REPORT 
echo "Open Todo items:" >> $REPORT
echo "----------------" >> $REPORT
~ktneely/bin/todo -p projectview -@waiting -@topic -+personal |egrep -v ===== >> $REPORT

echo " "
echo "General FYI:" >> $REPORT
echo "------------" >> $REPORT
if [ -e `~ktneely/bin/todo -p lately |egrep FYI` ];
    then
    echo "none at this time" >> $REPORT
else
    ~ktneely/bin/todo -p lately |egrep FYI >> $REPORT
fi

echo " " >> $REPORT
echo "Upcoming PTO & Training:" >> $REPORT
echo "-------------------"  >> $REPORT
remind /media/sf_Box/Documents/reminders/travel.txt |grep -v Reminders >> $REPORT

echo " " >> $REPORT
echo "{ Legend" >> $REPORT
echo "{ The todos loosely follow the GTD methodology" >> $REPORT
echo "{ + associates a task or item with a project" >> $REPORT
echo "{ @ associates a task or item with a context" >> $REPORT
echo "{ an (A) or (B) indicates priority" >> $REPORT
echo "{ the number is simply the task number and has no meaning " >> $REPORT
echo "{ " >> $REPORT
echo " "  >> $REPORT
