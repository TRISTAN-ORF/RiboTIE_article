<div align="center">
<h1>🧮 RIBO-former (article)</h1>

Supporting repository named after the equally named study

</div>

## 📋 About <a name="about"></a>
RIBO-former is created to annotate translation initiation sites on transcripts using ribosome profiling data. This repository holds the scripts, data, models and model outputs used to perform the study and benchmarks as discussed in [the paper]().

To apply the models on custom data or train new models following our approach, we refer to the [RIBO-former tool](https://github.com/jdcla/RIBO_former) GitHub repository.

Data files too large to host on GitHub, specifically those in the `data/`, `models/`, and `outputs/` folders, can be downloaded from [Zenodo]().

The repository of TIS Transformer, a similar publication for the delineation of novel coding sequences, where the model relies on transcript sequence data, can be found [here](https://github.com/jdcla/TIS_transformer)

## 🔗 Methodology <a name="methodology"></a>
Annotations are performed by a machine learning model following a methodology similar to those defined for natural language modelling tasks. Ensemble annotations (GRCh38, v107) and STAR have been used to map reads to transcripts. The model processes only ribosome profiling data to predict the presence of TIS at each position on the transcript.

The model architecture is based on that of the [Performer](https://arxiv.org/abs/2009.14794), which allows the use of longer input sequences due to the memory efficiency of the attention-based calculations.

## 📏 Benchmark <a name="benchmark"></a>

The tool has been compared to similar approaches applying TIS prediction based on ribosome profiling data. More details about the benchmarking approach are listed in the [article](). The scripts are deposited in `scripts/benchmarks`. The two models trained are found under `models/benchmarks`


## 📖 User guide <a name="userguide"></a>

For now, RIBO-former can be run following the steps described on the [RIBO-former tool](https://github.com/jdcla/RIBO_former) GitHub repository. Future work will focus on simplifying deployment and data pre-processing for RIBO_former.

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
