#!/usr/bin/env nextflow

/*
#==============================================
code documentation
#==============================================
*/


/*
#==============================================
params
#==============================================
*/

params.trimmed = false
params.saveBy = 'copy'
params.resultsDir = 'results/kvarq'




inputUntrimmedRawFilePattern = "./*_{R1,R2}.fastq.gz"
inputTrimmedRawFilePattern = "./*_{R1,R2}.p.fastq.gz"

inputRawFilePattern = params.trimmed ? inputTrimmedRawFilePattern : inputUntrimmedRawFilePattern

Channel.fromFilePairs(inputRawFilePattern)
        .set { ch_in_kvarq }

/*
#==============================================
kvarq
#==============================================
*/


process kvarq {

    container 'abhi18av/kvarq'
    publishDir params.resultsDir, mode: params.saveBy

    input:
    set genomeFileName, file(genomeReads) from ch_in_kvarq

    output:
    path("""${genomeName}.json""") into ch_out_kvarq

    script:
    genomeName = genomeFileName.toString().split("\\_")[0]


    """
    kvarq scan -l MTBC -p ${genomeReads[0]} ${genomeName}.json
    """

//kvarq scan -l MTBC -p 10BCG_S20_R1_001.p.fastq.gz 10BCG_S20_R1_001.json

}


/*
#==============================================
# extra
#==============================================
*/

// TODO add this as a separate process
// To create CSV
// kvarq summarize results/*.json > kvarq_results.csv
