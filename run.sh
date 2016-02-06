#! /usr/bin/env bash


# Which state has the highest popultion?

datasets='/Users/mandyricher/Desktop/Classes/GenomicsWorkshop/data-sets'

states="$datasets/states.tab.gz"

#Sample for how to do things

#$() stores the answers in that vaiable
#e.g. answer1=$(California)

###EXAMPLE

#answer_1=$(gzcat $states \
 #   | grep -v '^#' \
  #  | cut -f1,2 \
   # | sort -k2n \
    #| tail -n1\
    #| cut -f1\
    #| sed 's/"//g')

#echo "answer-1: $answer_1"
#OR at the end, bash answers.sh > answers.yml 
#Jay says, there are reasons to do the latter.
#sed 'sub/this/that/g' the g is global, without g, it will only take the first one.


#Which state in states.tab.gz has the lowest murder rate?

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2g \
    | head -n1 \
    | cut -f1\
    | sed 's/"//g')

echo "answer-1: $answer_1"

#How many sequence records are in the sample.fa file?

sample="$datasets/sample.fa"

answer_2=$(cat $sample \
    | grep -c '^>'\
    | sed 's/"//g')

echo "answer-2: $answer_2"

#How many unique CpG IDs are in cpg.bed.gz?

cpg="$datasets/cpg.bed.gz"

answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l \
    | sed 's/ //g')

echo "answer-3: $answer_3"

#How many sequence records are in the SP1.fq file?

SP1="$datasets/SP1.fq"

answer_4=$(cat $SP1 \
    | grep -c '@cluster')

echo "answer-4: $answer_4"


#How many words are on lines containing the word bloody in hamlet.txt?
#(Hint: use wc to count words).

hamlet="$datasets/hamlet.txt"

answer_5=$(cat $hamlet \
    | grep -i 'bloody' \
    | wc -w \
    | sed 's/ //g')

echo "answer-5: $answer_5"

#What is the length of the sequence in the first record of sample.fa?

answer_6=$(cat $sample \
    | grep -v '^>' \
    | head -n1 \
    | tr -d '\n'\
    | wc -m \
    | sed 's/ //g' \
    )

echo "answer-6: $answer_6"

#What is the name of the longest gene in genes.hg19.bed.gz?

genes="$datasets/genes.hg19.bed.gz"

answer_7=$(gzcat $genes \
    | awk '{ print $4, $3 - $2 }' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d ' ' )

echo "answer-7: $answer_7"

#How many unique chromosomes are in genes.hg19.bed.gz?

answer_8=$(gzcat $genes \
    | cut -f1 \
    | sort -k1 \
    | uniq \
    | wc -l \
    | sed 's/ //g')

echo "answer-8: $answer_8"

#How many intervals are associated with CTCF (not CTCFL) in
#peaks.chr22.bed.gz?

peaks="$datasets/peaks.chr22.bed.gz"

answer_9=$(gzcat $peaks \
    | cut -f4 \
    | grep "CTCF" \
    | grep -v "CTCFL" \
    | wc -l \
    | sed 's/ //g')

echo "answer-9: $answer_9"

#On what chromosome is the largest interval in lamina.bed?

lamina="$datasets/lamina.bed"

answer_10=$(cat $lamina \
    | awk '{ print $1, $3 - $2 }' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d ' ' )

echo "answer-10: $answer_10"
    


