<div align="center">
<h1>🧮 RiboTIE (article)</h1>

*Driving coding sequence discovery since 2023*

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8059764.svg)](https://doi.org/10.5281/zenodo.8059764)
[![GitHub stars](https://img.shields.io/github/stars/jdcla/RIBO_former_paper)](https://github.com/jdcla/RIBO_former_paper/stargazers)


</div>

## 📋 About <a name="about"></a>
RiboTIE is created to annotate translation initiation sites on transcripts using ribosome profiling data. This repository holds the scripts, data, models and model outputs used to perform the study and benchmarks as discussed in [the paper](https://doi.org/10.1101/2023.06.20.545724).

To apply the models on custom data or train new models following our approach, we refer to the [RiboTIE tool](https://github.com/jdcla/RIBO_former) GitHub repository.

Data files too large to host on GitHub, specifically those in the `data/`, `models/`, and `outputs/` folders, can be downloaded from [Zenodo](https://zenodo.org/record/8059764).

The repository of TIS Transformer, a similar publication for the delineation of novel coding sequences, where the model relies on transcript sequence data, can be found [here](https://github.com/jdcla/TIS_transformer)

## 🔗 Methodology <a name="methodology"></a>
Annotations are performed by a machine learning model following a methodology similar to those defined for natural language modelling tasks. Ensemble annotations (GRCh38, v107) and STAR have been used to map reads to transcripts. The model processes only ribosome profiling data to predict the presence of TIS at each position on the transcript.

The model architecture is based on that of the [Performer](https://arxiv.org/abs/2009.14794), which allows the use of longer input sequences due to the memory efficiency of the attention-based calculations.

## 📏 Benchmark <a name="benchmark"></a>
**NOTE that all scripts were run on an old version (v0.3.3) of the `transcript-transformer` package. It is always recommended to use the newest version**

The tool has been compared to similar approaches applying TIS prediction based on ribosome profiling data. More details about the benchmarking approach are listed in the [article](https://doi.org/10.1101/2023.06.20.545724). The scripts are deposited in `scripts/benchmarks`. The models used for the benchmark are listed under `models/benchmarks/finetune`.

## 📖 User guide <a name="userguide"></a>

For now, RiboTIE can be run following the steps described on the [RiboTIE tool](https://github.com/jdcla/RIBO_former) GitHub repository. Future work will focus on simplifying deployment and data pre-processing for RIBO_former.

## 🖊️ Citation <a name="citation"></a>
    
```bibtex
@article {10.1093/nargab/lqad021,
    author = {Clauwaert, Jim and McVey, Zahra and Gupta, Ramneek and Menschaert, Gerben},
    title = "{TIS Transformer: remapping the human proteome using deep learning}",
    journal = {NAR Genomics and Bioinformatics},
    volume = {5},
    number = {1},
    year = {2023},
    month = {03},
    issn = {2631-9268},
    doi = {10.1093/nargab/lqad021},
    url = {https://doi.org/10.1093/nargab/lqad021},
    note = {lqad021},
    eprint = {https://academic.oup.com/nargab/article-pdf/5/1/lqad021/49418780/lqad021\_supplemental\_file.pdf},
}
```
