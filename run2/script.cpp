int script()  
{    
 
gSystem->Exec("export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH");
const char *name ="dsbf25.h22795.8b.pyth_php_dir_0405e_";	  
const char *card="php_nondiff_res_9899.cards";
const char *path="/afs/desy.de/user/g/glusheno/pythia_run/run2/dir/"; 
//////////// file loop //////////////////
for (unsigned i=1; i<=1; ++i)   // produce 20 files
{ 
		gSystem->Exec("rm -f fort.11 fort.9 fort.10 fort.7 amadeus.rndm; ln -s particle.data fort.9");
		gSystem->Exec(Form("cp %s fort.7", card));
		gSystem->Exec("a=$(date +%N); sleep .$[ ( $RANDOM % 10 ) + 1 ]s; b=$(date +%N); echo $a $b > amadeus.rndm; ln -s amadeus.rndm fort.10");    // write random seed numbers in "amadeus.rndm"

        gSystem->Exec(Form("/afs/desy.de/group/zeus.zsmsm/ZEUSSysSoft/Released/Support/Monte_Carlo/Generators/amadeus/v2010a/exe/i586-sl5-linux/amadeus_pythia6416.exe > %s%03d.zdi",name,i)); 
        //gSystem->Exec(Form("mv output %s%03d",name,i));
		//gSystem->Exec(Form("gzip %s%03d",name,i));
		//gSystem->Exec(Form("mv %s%03d.gz %s",name,i,path));
	 	//gSystem->Exec(Form("mv %s%03d.zdi %s",name,i,path));
}

return 0;
}
