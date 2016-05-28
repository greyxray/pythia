#!/bin/sh -f
EXE=amadeus_pythia6221.exe
EXE=amadeus_herwig6510.exe
cardname=$(ls | grep cards | head -n 1 | cut -f 1 -d.)
#dccp -t 3200 dcap://dcap.desy.de/pnfs/desy.de/usr/zeus/users/andriish/amadeus_pythia6221.exe ./amadeus_pythia6221.exe
#dccp -t 3200 dcap://dcap.desy.de/pnfs/desy.de/usr/zeus/users/andriish/amadeus_pythia6416.exe ./amadeus_pythia6416.exe
#dccp -t 3200 dcap://dcap.desy.de/pnfs/desy.de/usr/zeus/users/andriish/libgfortran.so.3       ./libgfortran.so.3
#dccp -t 3200 dcap://dcap.desy.de/pnfs/desy.de/usr/zeus/users/andriish/zdd_load.rz            ./zdd_load.rz
#mkdir cnd
#dccp -t 3200 dcap://dcap.desy.de/pnfs/desy.de/usr/zeus/users/andriish/CND_GLOBAL.RZ            ./cnd/CND_GLOBAL.RZ
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
sed -i   "s|^ZDIN-PATH.*$|ZDIN-PATH .\/ |g" $cardname".cards"
ldd $EXE
#ldd amadeus_pythia6416.exe
#chmod +x amadeus_pythia6416.exe
chmod +x  $EXE
RANGE=10000


ls 
a=$(date +%N )
echo $cardname
rm -f fort.7
rm -f fort.11
rm -f fort.9
rm -f fort.10
#echo " " >> amadeus.rndm
number=$RANDOM
let "number=number/$RANGE"
sleep $number
b=$(date +%N)
rm amadeus.rndm
echo $a $b > amadeus.rndm
ln -s particle.data   fort.9
cp $cardname".cards"  fort.7
ln -s amadeus.rndm    fort.10

./$EXE >  output_$EXE.log
mv output output_$EXE

