#! /bin/bash

: '
conversion from Jefferson (2004) and samtalebank transcriptions conventions
to samtalegrammatik.dk transcription conventions'

echo "Enter filename of the transcript you want to convert" #the filename should be a .txt
read fileName

if [[ -f $fileName ]] 
then
        sed -e "s/£/☺/g" -e "s/,/→/g" -e "s/⇘/↘/g" -e "s/⇗/↗/g" \
        -e "s/⌈/[/g" -e "s/⌊/[/g" -e "s/⌉/]/g" -e "s/⌋/]/g" \
        -e "s/∆/>/" -e "s/∆/</" -e "s/∆/>/" -e "s/∆/</" -e "s/∆/>/" -e "s/∆/</" \
        -e "s/∇/</" -e "s/∇/>/" -e "s/∇/</" -e "s/∇/>/" -e "s/∇/</" -e "s/∇/>/" \
        -e "s/((/{/g" -e "s/))/}/g" -e "s/Ἡ/(h)/g" \
        -e "s/≈/=/g" -e "s/+≈/=/g" -e "s/≋//g" -e "s/+//g" \
        -e "s/??/(/" -e "s/??/)/" -e "s/??/(/" -e "s/??/)/" -e "s/??/(/" -e "s/??/)/" \
        -e "s/?/↗/" -e "/[a-zA-Z]/s/\./↘/g" -e "/[()]/s/\↘/./g" $fileName > samgrammed_$fileName
        
        echo "done! a new file called samgrammed_$fileName has been placed in the same folder as $fileName"

else
        echo "$fileName doesn't exist"
fi
 

