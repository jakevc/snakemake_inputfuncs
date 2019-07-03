# snakefile testing inpt funcitons

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
