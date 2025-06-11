#! /bin/bash
# from Elizabeth's github

BOWTIE=/opt/bifxapps/bowtie2-2.4.5  
SAMTOOLS=/opt/bifxapps/samtools-1.9/bin

cd /home/glbrc.org/trina.mcmahon/ebpr/analysis/coverM/R1_67nextera_vs_accumrefs

# Run this manually just once to build index
# /opt/bifxapps/bowtie2-2.3.5.1/bowtie2-build /home/glbrc.org/trina.mcmahon/ebpr/analysis/coverM/R1_67nextera_vs_accumrefs/accumulibacter_ref_genomes_concat.fna accum_refs &


# arguments
reads=$1  # path to metagenome reads
sampleID=$2 # name of output file


# mapping command

$BOWTIE/bowtie2 --threads 2 -x /home/glbrc.org/trina.mcmahon/ebpr/analysis/coverM/R1_67nextera_vs_accumrefs/accum_refs --interleaved $reads > $sampleID.sam

# BAM, sort to keep only mapped reads (allows multimapping)
$SAMTOOLS/samtools  view -F 4 -b  $sampleID.sam >  $sampleID.bam
$SAMTOOLS/samtools  sort  $sampleID.bam -o  $sampleID.sorted.bam

# $SAMTOOLS/samtools  index $sampleID.sorted.bam $sampleID.sorted.bam.bai
rm -f $sampleID.sam
rm -f $sampleID.bam
