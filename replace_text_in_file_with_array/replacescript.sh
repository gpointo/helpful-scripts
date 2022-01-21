count= 0
while read p; do
#   echo "$p"
  SUB='formControlName='
  
#   if [[ "$p" == *"$SUB"* ]]; then
#     $p == "formControlName='projLabSumRepNotes' (blur)='onTouched()'>"
#   fi
  if [[ "$p" == *"$SUB"* ]]; then
    count=$((count+1))
    word=$(sed "${count}q;d" test)
    newWord=$(echo -e $word | sed 's/^[ \t]*//;s/[ \t]*$//')
    p=$(echo "formControlName='$newWord' (blur)='onTouched()'>")
  fi
  echo $p >> test.txt
done <test2