# README 

This example snakemake workflow shows how to use input functions to map a sample name to various sample files, propagating the sample name through to the end rule: rule all. 

The sample dict maps a sample name to multiple files

```
sample_dict = {"sample1": ["data/barcode1_1.fq", "data/barcode1_2.fq", "data/barcode1_3.fq"],
               "sample2": ["data/barcode2_1.fq", "data/barcode2_2.fq", "data/barcode2_3.fq"]}

rule all:
    input:
        # the final output of the pipeline {sample}.txt for each sample
        expand("data/{sample}.txt", sample=["sample1", "sample2"])

rule first:
    input:
        # input function returns the list of fq files for a given sample using sample_dict
        lambda wildcards: sample_dict[wildcards.sample]
    output:
        "data/{sample}.txt"
    shell:
        # concat the txt in each fq file in the list
        "cat {input} > {output}"
```

To run this workflow run the following commands.
This assumes you have a working installation of anaconda, or miniconda, with conda in your PATH.

If you already have an environment with snakemake activate it, or with snakemake in your path, start from "Clone this repo".

```
# create environment containing snakemake
conda create -n smk_example snakemake 

# activate that environment
source activate smk_example

# clone this repo
git clone git@github.com:jakevc/snakemake_inputfuncs.git
cd snakemake_inputfuncs

# run the workflow
snakemake
```

