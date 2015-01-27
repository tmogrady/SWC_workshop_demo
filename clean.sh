#This is the cleanup script that we wrote together on Tuesday morning. 
#It performs cleaning operations on gapminder country files with errors.

cd data/clean

# Fix the Guinea file - we just want the middle 12 rows
echo "Fixing Guinea.cc.txt file"
head -n 24 Guinea.cc.txt | tail -n 12 > Guinea.cc.txt.clean
mv -v Guinea.cc.txt.clean Guinea.cc.txt

# Fix the China file - we just want the top 12 rows
echo "Fixing the China.cc.txt file"
head -n 12 China.cc.txt > China.cc.txt.clean
mv -v China.cc.txt.clean China.cc.txt

# Fix the Niger file - we just want the top 12 rows
echo "Fixing the Niger.cc.txt file"
head -n 12 Niger.cc.txt > Niger.cc.txt.clean
mv -v Niger.cc.txt.clean Niger.cc.txt

cd ../..

sleep 1
