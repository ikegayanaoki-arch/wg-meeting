#!/bin/bash

 # Gemini model
 MD=gemini-2.5-flash
 # log file
 LOG="gemini.log"
 ##for launchd 
 NODE=/opt/homebrew/bin/node
 GEMINI=/opt/homebrew/bin/gemini
 
 echo "  ***  Updating  index.html  ***  "
 for d in ../*/ 
 do
   DN=$(basename "$d")
   echo $d
   echo $DN
 
   case "$DN" in
     index*|form|_bk)
       echo "  ***  Skipping $DN"
       ;;
     *)
       if [[ -d $DN ]]
       then
         echo $DN
         echo "   ***  Paper '$DN' already in index.html"
       else
         mkdir $DN
         cp -r ../$DN/html/* $DN

         echo "  ***  Adding paper '$DN' to index.html"

         DATE=${DN%-*}
         REPORT=${DN#*-}

         sed "s/<dir>/${DN}/g" html.md > htmlTmp.md
         sed -i '' "s/<date>/${DATE}/g" htmlTmp.md
         sed -i '' "s/<report>/${REPORT}/g" htmlTmp.md
         # Run gemini
         INST="@htmlTmp.md の指示を実行"
         #gemini --model $MD -y "$INST" 2>&1 | tee -a $LOG
         $NODE $GEMINI --model $MD -y "$INST" 2>&1 | tee -a $LOG
       fi
       ;;
   esac
 done
 
 echo "  ***  Finished updating index.html  ***  "
 rm -rf htmlTmp.md

 ##git part: mannual for the time being
  git add . 
  DATE=`date+%y%m%d `
  git commit -m "Meeting recoded added @ "$DATE
  git push
