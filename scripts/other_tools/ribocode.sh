#!/bin/bash

cd ../../data
mkdir genome/ribocode
prepare_transcripts -g genome/Homo_sapiens.GRCh38.107.gtf -f genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa -o genome/ribocode

while read -r line
do
	# init
	dataset=$(echo $line | cut -f 1 -d ' ')
    mkdir ribo/${dataset}/out/ribocode/
    mkdir ribo/${dataset}/out/ribocode/output
    
    # P-sites
    metaplots -a genome/ribocode -m 20 -M 40 -r ribo/${dataset}/out/${dataset}_aligned_tran.bam -o ribo/${dataset}/out/ribocode/

    # ORF calling
    RiboCode  -a genome/ribocode -c ribo/${dataset}/out/ribocode/_pre_config.txt -l no -g -o ribo/${dataset}/out/ribocode/

done < "ribo/metadata.txt"
