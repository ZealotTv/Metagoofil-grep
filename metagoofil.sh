#!/bin/bash
cd way/to/your/folder/with/metagoofil
python metagoofil.py  -d $1 -t doc,docx,pdf,ppt,pptx,odf,xls,xlsx -l 400 -n 400 -o $2  -w 
filetypes=("doc" "docx" "pdf" "ppt" "pptx" "odf" "xls" "xlsx")
fields=("Author" "Creator" "Email" "Producer" "Template")
cd $2

for i in "${fields[@]}"
do
	echo $i >> $2/$3
    for j in "${filetypes[@]}"
    do
	    exiftool -r *.$j | egrep -i $i | sort -u >> $2/$3
    done
done
