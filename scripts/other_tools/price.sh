#!/bin/bash

cd ../../data

mkdir genome/price
gedi -e IndexGenome -s genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa -a genome/Homo_sapiens.GRCh38.107.gtf -f genome/price -nobowtie -nostar -nokallisto

while read -r line
do
	# init
	dataset=$(echo $line | cut -f 1 -d ' ')
    mkdir ribo/${dataset}/out/price/

    gedi -e Price -reads ribo/${dataset}/out/genome/${dataset}_aligned.bam -genomic Homo_sapiens.GRCh38.107 -prefix  ribo/${dataset}/out/price/out -progress

done < "ribo/metadata.txt"