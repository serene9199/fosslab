#!/bin/bash

$(pdftotext -layout -nopgbrk result_MDL.pdf result_MDL.txt)
$(pdftotext -layout -nopgbrk result_MDL1.pdf result_MDL1.txt)
$(grep -A 1 "MDL16CS" result_MDL.txt > result_CS.txt)
$(grep -A 1 "MDL16CS" result_MDL1.txt > result_CS11.txt)


sed -i 's/--//g' result_CS.txt
sed -i 's/,/ /g' result_CS.txt
sed -i 's/MA101//g' result_CS.txt
sed -i 's/PH100//g' result_CS.txt
sed -i 's/BE110//g' result_CS.txt
sed -i 's/BE103//g' result_CS.txt
sed -i 's/EE100//g' result_CS.txt
sed -i 's/PH110//g' result_CS.txt
sed -i 's/EE110//g' result_CS.txt
sed -i 's/\<CS110\>//g' result_CS.txt
sed -i 's/BE10105//g' result_CS.txt
sed -i 's/            //g' result_CS.txt
sed -i 's/      / /g' result_CS.txt

sed -i 's/(O)/10/g' result_CS.txt
sed -i 's/(A+)/9/g' result_CS.txt
sed -i 's/(A)/8.5/g' result_CS.txt
sed -i 's/(B+)/8/g' result_CS.txt
sed -i 's/(B)/7/g' result_CS.txt
sed -i 's/(C)/6/g' result_CS.txt
sed -i 's/(P)/5/g' result_CS.txt

sed -i 's/(F)/0/g' result_CS.txt

tr -d "\n" <result_CS.txt>result_CS1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' result_CS1.txt
 
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*3 + $6*3 + $7*3+ $8+ $9 + $(10))/23 }' result_CS1.txt > resultS1.txt



sed -i 's/--//g' result_CS11.txt
sed -i 's/,/ /g' result_CS11.txt
sed -i 's/CY100//g' result_CS11.txt
sed -i 's/EC100//g' result_CS11.txt
sed -i 's/BE100//g' result_CS11.txt
sed -i 's/CY110//g' result_CS11.txt	
sed -i 's/EC110//g' result_CS11.txt
sed -i 's/MA102//g' result_CS11.txt
sed -i 's/BE102//g' result_CS11.txt
sed -i 's/\<CS120\>//g' result_CS11.txt
sed -i 's/\<CS100\>//g' result_CS11.txt
sed -i 's/     //g' result_CS11.txt
sed -i 's/             //g' result_CS11.txt


sed -i 's/(O)/10/g' result_CS11.txt
sed -i 's/(A+)/9/g' result_CS11.txt
sed -i 's/(A)/8.5/g' result_CS11.txt
sed -i 's/(B+)/8/g' result_CS11.txt
sed -i 's/(B)/7/g' result_CS11.txt
sed -i 's/(C)/6/g' result_CS11.txt
sed -i 's/(P)/5/g' result_CS11.txt
sed -i 's/(F)/0/g' result_CS11.txt

tr -d "\n" <result_CS11.txt>result_CS2.txt
sed -i 's/MDL16CS/\nMDL16CS/g' result_CS2.txt
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*1 + $6*1 + $7*4+ $8*3+ $9*3 + $(10))/24 }' result_CS2.txt > resultS2.txt

$(join -1 1 -2 1 resultS1.txt resultS2.txt > resultS12.txt)
awk '{ print $1 " " ($2*23 + $3*24)/(23+24) }' resultS12.txt > result1.txt

$(join --nocheck-order -1 6 -2 1 c4b.txt resultS12.txt > c4_sgpa.txt)
$(join --nocheck-order -1 1 -2 1 c4_sgpa.txt result1.txt > c4b_sgpa.txt)


