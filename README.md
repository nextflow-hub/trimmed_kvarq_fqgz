# Nextflow wrapper for `kvarq` process.

## Pre-requisites

- Nextflow
- Docker 

**NOTE** If you plan to setup a basic server, then you can refer [minimal-nextflow-setup](https://github.com/nextflow-hub/minimal-nextflow-setup)

## Usage

```
nextflow run https://github.com/nextflow-hub/kvarq
```

## Options

- `trimmed` and `untrimmed` input files

By default the pipeline assumes the files to follow the untrimmed `*.fastq.gz` format. For trimmed files i.e. `*.p.fastq.gz` pattern simply add the `trimmed` option.

```
nextflow run https://github.com/nextflow-hub/kvarq --trimmed 
```
- `resultsDir`

By default, it stores the result files locally into `results` directory.

## Contribution

Contribution, in all forms, is most welcome!
