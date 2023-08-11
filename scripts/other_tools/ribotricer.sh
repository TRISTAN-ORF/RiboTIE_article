#!/bin/bash

cd ../../data

mkdir genome/ribotricer
ribotricer prepare-orfs --gtf genome/Homo_sapiens.GRCh38.107.gtf --fasta genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa --prefix  genome/ribotricer/ribo

while read -r line
do
	# init
	dataset=$(echo $line | cut -f 1 -d ' ')
    mkdir ribo/${dataset}/out/ribotricer/

    ribotricer detect-orfs \
             --bam ribo/${dataset}/out/genome/${dataset}_aligned.bam \
             --ribotricer_index genome/ribotricer/ribo_candidate_orfs.tsv \
             --prefix ribo/${dataset}/out/ribotricer/

done < "ribo/metadata.txt"
