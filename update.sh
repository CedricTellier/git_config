#!/usr/bin/bash
declare -A circle
circle[directory]=D:/Circle/circle
circle[branches]="beta integration"

echo '----------------------------------------------------------'
echo '-----------           Backup routine           -----------'
echo '----------------------------------------------------------'
# Dropbox Backupd Directories
CirWeekly="D:\Dropbox (Work4Cad)\Dossier de l'équipe Caddev\circle_backup\weekly_backup"
# NAS Backupd Directories
NasWeekly="\\\\192.168.100.200\\Caddev\\Circle\\circle_backup\\weekly_backup"
#For each weekly directories
declare -a weeklyDir
weeklyDir=("$NasWeekly" "$CirWeekly")
arraylength=${#weeklyDir[@]}
for (( i=0; i<${arraylength}; i++ ))
do
	# First step verify if directories are created
	if [ -d "${weeklyDir[$i-1]}" ] 
	then
		# directory existing
		cd "${weeklyDir[$i-1]}"
	else
		# directory not existing so creation needed
		mkdir -p -- "${weeklyDir[$i-1]}"
		echo "Following directory has been created: ${weeklyDir[$i-1]}"
	fi
	currentWeek=$(date +"%V")
	currentDate=$(date +"%d-%m-%y")
	#go to repo local && create archive (zip format)
	for j in ${circle[branches]}
	do
		folder="${weeklyDir[$i-1]}"/"$j"
		if [ -d "$folder" ] 
		then
			cd "$folder"
		else
			# folder of the branch not existing so creation needed
			mkdir -p -- "$folder"
			echo "Following branch folder has been created: $folder"
		fi
		tester=true;
		# Need to test if the folder is Empty or not
		if [ "$(ls -A "$folder")" ]; 
		then
			# For each file found in the folder
			for entry in "$folder"/*
			do
				#Test of the date include in the name of the file to see if the archive has been already done for this week
				A="$(cut -d'/' -f3 <<< "$entry")"
				B="$(cut -d'_' -f1 <<< "$A")"
				transit=$(date -d "$B" +"%d-%m-%y")
				fileDateWeek=$(date -d "$transit" +"%V")
				#If week of file corresponding to the current week, archive isalready created, else Creation needed
				if [ $currentWeek = $fileDateWeek ]
				then
					tester=false
					break
				fi
			done
		else
			# Empty backup storage so nothing to do
			echo "$folder is Empty"
			tester=true
		fi
		cd "${circle[directory]}"
		#Creation of the archive to right path
		if [ "$tester" = true ]
		then
			nbrCommit=$(git rev-parse --short origin/$j)
			git archive --format zip --output "$folder"/"$currentDate"_"$j"_"$nbrCommit".zip "$j"
			archive="$folder"/"$currentDate"_"$j"_"$nbrCommit"_.zip
			echo "Archive created: $archive"
		else
			echo "Archive already created for week : $fileDateWeek on branch: $j"
		fi
	done
done
echo '----------------------------------------------------------'
echo '---------          End Backup routine           ----------'
echo '----------------------------------------------------------'
echo '##########################################################'
echo '----------------------------------------------------------'
echo '-----------       Source Update routine        -----------'
echo '----------------------------------------------------------'
echo "${circle[directory]}"
cd "${circle[directory]}"
for i in ${circle[branches]}
do
	git checkout $i
	git pull
	echo $i "pull ok"
	if [ $i == "ct_dev" ]
	then
		git merge "integration"
		echo $i "merge ok"
	fi
	echo '----------------------------------------------------------'
done
echo '----------------------------------------------------------'
echo '-----------      End Source Update routine     -----------'
echo '----------------------------------------------------------'