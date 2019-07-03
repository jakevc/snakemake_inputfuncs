# README 

This example snakemake workflow shows how to use input functions to map a sample name to various sample files, propagating the sample name through to the end rule: rule all. 


To run this workflow run the following commands

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

