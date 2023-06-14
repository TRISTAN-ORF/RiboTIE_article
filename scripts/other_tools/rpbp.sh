#!/bin/bash

cd ../../data

mkdir genome/rpbp
mkdir genome/rpbp/excl_rrna
prepare-rpbp-genome ../scripts/benchmark/rpbp.yml --logging-level INFO --mem 10G
prepare-rpbp-genome ../scripts/benchmark/rpbp_full.yml --star-options "--genomeSAindexNbases 10" --mem 10G --num-cpus 4 --logging-level INFO --log-file genome/rpbp/rpbp-genome.log --overwrite

while read -r line
do
    # init
    dataset=$(echo $line | cut -f 1 -d ' ')
    mkdir ribo/${dataset}/out/rpbp/
    
    cp ../scripts/benchmark/rpbp_tmp.yml ribo/${dataset}/out/rpbp/rpbp.yml
    echo "  ${dataset}: ribo/${dataset}/out/temp/${dataset}_trimmed.fq" >> ribo/${dataset}/out/rpbp/rpbp.yml
    echo "riboseq_data: ribo/${dataset}/out/rpbp" >> ribo/${dataset}/out/rpbp/rpbp.yml

    run-all-rpbp-instances ribo/${dataset}/out/rpbp/rpbp.yml --num-cpus 30 --logging-level INFO --mem 50G --write-unfiltered

done < "ribo/metadata.txt"
