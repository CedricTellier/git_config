#!/usr/bin/bash
declare -A circle
circle[directory]=D:/Circle/circle
echo '----------------------------------------------------------'
echo '-----------           Release routine          -----------'
echo '----------------------------------------------------------'

# Dropbox Backupd Directories
CirRelease="D:\Dropbox (Work4Cad)\Dossier de l'équipe Caddev\circle_backup\release"

# NAS Backupd Directories
NasRelease="\\\\192.168.100.200\\Caddev\\Circle\\circle_backup\\release"

#For each weekly directories
declare -a releaseDir
releaseDir=("$CirRelease" "$NasRelease")
arraylength=${#releaseDir[@]}
for (( i=0; i<${arraylength}; i++ ))
do
	# First step verify if directories are created
	if [ -d "${releaseDir[$i-1]}" ] 
	then
		# directory existing
		cd "${releaseDir[$i-1]}"
	else
		# directory not existing so creation needed
		mkdir -p -- "${releaseDir[$i-1]}"
		echo "Following directory has been created: ${releaseDir[$i-1]}"
	fi
	currentDate=$(date +"%d-%m-%y")
    # Creation of the archive to right path
    cd "${circle[directory]}"
    nbrCommit=$(git rev-parse --short origin/integration)
    git archive --format zip --output "${releaseDir[$i-1]}"/"$currentDate"_release"($1)"_"$nbrCommit".zip integration
    archive="${releaseDir[$i-1]}"/"$currentDate"_release"($1)"_"$nbrCommit"_.zip
    echo "Archive created: $archive"
done