#!/bin/bash

cd ../../data

while read -r line
do
    # init
    dataset=$(echo $line | cut -f 1 -d ' ')
    echo $dataset
    mkdir ribo/${dataset}/out/ribotish

    samtools sort ribo/${dataset}/out/${dataset}_aligned_tran.bam -o ribo/${dataset}/out/${dataset}_aligned_tran.bam -@ 8 -m 4G
    samtools index ribo/${dataset}/out/${dataset}_aligned_tran.bam ribo/${dataset}/out/${dataset}_aligned_tran.bam.bai -@ 8

    ribotish quality -b ribo/${dataset}/out/genome/${dataset}_aligned.bam -g genome/Homo_sapiens.GRCh38.107.gtf -f ribo/${dataset}/out/ribotish/quality.pdf -r ribo/${dataset}/out/ribotish/offset.txt -o ribo/${dataset}/out/ribotish/quality.txt -l 20,41
    ribotish predict -b ribo/${dataset}/out/genome/${dataset}_aligned.bam -g genome/Homo_sapiens.GRCh38.107.gtf -f genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa -o ribo/${dataset}/out/ribotish/orfs.txt --ribopara ribo/${dataset}/out/ribotish/offset.txt

done < "ribo/metadata.txt"
