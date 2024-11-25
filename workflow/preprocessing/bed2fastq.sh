# loop over bed files and convert bam to fastq

DATA_DIR=../../samples/encode/bed
OUT_DIR=../../samples/encode/fastq
GENOME_FASTA=../../ref/allchrom.Chr1ToChrM.validated.fa
GENOME_FAI=../../ref/allchrom.Chr1ToChrM.validated.fa.fai

for bed in $(ls $DATA_DIR/*.bed.gz); do
    # get the basename of the bed file
    bed_base=$(basename $bed .bed.gz)

    # generate the fastq file name
    fastq=$OUT_DIR/$bed_base.fastq

    # check if the bed file exists
    if [ -f $bed ]; then
        # check if the fastq file already exists
        if [ ! -f $fastq ]; then
            # convert bam to fastq
            bedtools bamtofastq -i $bed -fq $fastq
            bedtools getfasta -fi $GENOME_FASTA \
            -bed $bed \
            -fo $fastq
        else
            echo "File $fastq already exists."
        fi
    else
        echo "File $bed does not exist."
    fi
done


# Generate a genome bed file
GENOME_BED=../../ref/genome.bed

bedtools makewindows -g $GENOME_FASTA.fai -w 100000 > $GENOME_BED


# Generate the genome sizes file from the genome FASTA index file
GENOME_SIZES=../../ref/genome_sizes.txt

cut -f1,2 $GENOME_FAI > $GENOME_SIZES


# Create the exclude file from the bed files in the data directory
EXCLUDE_FILE=../../samples/encode/bed/all_dnase_peaks.bed

cat $DATA_DIR/*.bed.gz > $EXCLUDE_FILE


# Randomly sample regions from the genome that do not overlap DNase peaks
SAMPLED_REGIONS=../../samples/encode/bed/sampled_regions.bed

for i in {1..10}; do
    bedtools shuffle -i $GENOME_BED -g $GENOME_SIZES -excl $EXCLUDE_FILE > $SAMPLED_REGIONS.$i
done