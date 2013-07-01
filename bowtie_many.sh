#!bin/bash
# run bowtie on all (paired end reads). Before running this you must have an indexed
# transcriptome/genome to compare againsted (look at bowtie2-build)

# a list of directories to look in for the file
MY_DIRECTORIES="*"

for i in $MY_DIRECTORIES
    do
        # check if there are .fastq files in the folder.
        count=`ls -1 $i/*.fastq 2>/dev/null | wc -l`
        if [ $count != 0 ]
        then
            # get the R1 file
            R1=`ls $i/*R1_001.fastq`

            # get the R2 file
            R2=`ls $i/*R2_001.fastq`

            # specify output file
            out_file="$i.sam"

            # run bowtie2
            bowtie2 -x ~/Documents/Katherine/Tatiltrus/Transcriptomes/talitrus_trinity_transcriptome -1 $R1 -2 $R2 -S $out_file

        else
            echo ".fastq files not found in $i"
        fi
done