#!/bin/bash
echo "Good morning Sir "
echo "Please make sure files EPI_ISL_410538.fa and EPI_ISL_410540.fa are downloaded in your PC and ready to use in the terminal"
echo ""
read -p "How would you like your directory to be called, Sir: " folder
mkdir $folder
cp EPI_ISL_410538.fa EPI_ISL_410540.fa $folder
cd $folder
cat EPI_ISL_410538.fa | head
echo ""
cat EPI_ISL_410540.fa | head
echo ""
efetch -db=nuccore -format=fasta -id=KY417146.1 > KY417146_1.fa
cat  KY417146_1.fa | head
echo ""
efetch -db=nuccore -format=fasta -id=MK211376.1 > MK211376_1.fa
cat  MK211376_1.fa | head
echo ""
efetch -db=nuccore -format=fasta -id=MN996532.1 > MN996532_1.fa
cat  MN996532_1.fa | head
echo ""
efetch -db=nuccore -format=fasta -id=MN996532.2 > MN996532_2.fa
cat  MN996532_2.fa | head
echo ""
efetch -db=nuccore -format=fasta -id=NC_045512.2 > NC_045512_2.fa
cat  NC_045512_2.fa | head
echo ""
echo "Download complete, BLAST of sequences is now starting"
echo ""
echo "All sequences identity with Sars-Cov-2"
echo ""

echo "Identity with Bat Sars-like rs4231"
blastn -query NC_045512_2.fa -subject KY417146_1.fa -outfmt 7 -gapextend 1 -gapopen 1
echo ""

echo "Identity with BTRS BetaCov/YN2018B"
blastn -query NC_045512_2.fa -subject MK211376_1.fa -outfmt 7 -gapextend 1 -gapopen 1

echo ""
echo "Identity with RaTG13 Bat Coronavirus v1"
blastn -query NC_045512_2.fa -subject MN996532_1.fa -outfmt 7

echo ""
echo "Identity with RaTG13 Bat Coronavirus v2"
blastn -query NC_045512_2.fa -subject MN996532_2.fa -outfmt 7

echo ""
echo "Identity with Pangolin SarsCov P4L"
blastn -query NC_045512_2.fa -subject EPI_ISL_410538.fa -outfmt 7 -gapextend 1 -gapopen 1

echo ""
echo "Identity with Pangolin SarsCov P5L"
blastn -query NC_045512_2.fa -subject EPI_ISL_410540.fa -outfmt 7 -gapextend 1 -gapopen 1

echo ""
echo "Multiple alignment will star now"
echo ""
echo "While in Clustalw please input the following sequence of inputs: 1, merged.fa, 2, 9, toggle on FASTA and CLUSTAL, enter, 1 "

cat *.fa > merged.fa
clustalw
echo "we have finished the first task, please go to Rstudio in order to build phylogenetic tree"
