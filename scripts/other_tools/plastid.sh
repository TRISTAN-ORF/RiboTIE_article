#!/bin/bash

cd ../../data

## Prepare assembly 

cd genome
wget http://ftp.ensembl.org/pub/release-107/gff3/homo_sapiens/Homo_sapiens.GRCh38.107.gff3.gz
unzip *.gz
cd ..
reformat_transcripts --annotation_files genome/Homo_sapiens.GRCh38.107.gff3 --annotation_format GFF3 --output_format GTF2 genome/Homo_sapiens.GRCh38.107.gtf2

## Prepare roi 

mkdir genome/plastid
metagene generate genome/plastid/ --landmark cds_start --annotation_files genome/Homo_sapiens.GRCh38.107.gtf2

## P-site calculation

while read -r line
do
    # init
    dataset=$(echo $line | cut -f 1 -d ' ')
    mkdir ribo/${dataset}/out/plastid

    samtools sort ribo/${dataset}/out/genome/${dataset}_aligned.bam -o ribo/${dataset}/out/genome/${dataset}_aligned.bam -@ 8 -m 4G
    samtools index ribo/${dataset}/out/genome/${dataset}_aligned.bam ribo/${dataset}/out/genome/${dataset}_aligned.bam.bai -@ 8

    psite genome/plastid/_rois.txt ribo/${dataset}/out/plastid/ --min_length 20 --max_length 41 --require_upstream --count_files ribo/${dataset}/out/genome/${dataset}_aligned.bam
done < "ribo/metadata.txt"
