#!/bin/bash

mkdir $1/res_perQuery

for query in `cat $2 | cut -d' ' -f2`;
do
	echo $query
	n_res=`cat $1/CDVS-client.out | grep $query -A1 | tail -1 | cut -d' ' -f2`
	n_res1=$((n_res+1))
	queryN=`echo $query | grep -o "90.*.jpg" | sed 's/\.jpg//g'`
	cat $1/CDVS-client.out | grep $query -A$n_res1 | tail -$n_res | cut -d'/' -f4 | sed 's/.jpg//g' > $1/res_perQuery/$queryN\.res
done

cat $1/res_perQuery/*.res | grep -v " 0" | cut -d' ' -f2 > $1/scores_only.res



