#!/bin/bash

echo "Start running minimap2"
echo "INPUT_PATH: $INPUT_PATH"
echo "OUTPUT_PATH: $OUTPUT_PATH"
mkdir -p $OUTPUT_PATH

# 如果 INPUT_PATH 是一个文件夹，处理其中所有 .fastq 文件
if [ -d "$INPUT_PATH" ]; then
  for fastq_file in $INPUT_PATH/*.fastq; do
    output_file=$OUTPUT_PATH/$(basename $fastq_file .fastq).sam
    echo "Processing $fastq_file"
    minimap2 -ax map-ont /data/home/grp-sunhao/sunxinhong/reference/GRCh38.p14.genome.fa $fastq_file > $output_file
  done
else
  # 如果 INPUT_PATH 是单个 .fastq 文件
  output_file=$OUTPUT_PATH/$(basename $INPUT_PATH .fastq).sam
  echo "Processing $INPUT_PATH"
  minimap2 -ax map-ont /data/home/grp-sunhao/sunxinhong/reference/GRCh38.p14.genome.fa $INPUT_PATH > $output_file
fi

echo "Minimap2 processing complete"
