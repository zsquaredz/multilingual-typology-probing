#!/bin/bash
HOME_DIR=/disk/ocean/zheng/ # Cohort-server
source ${HOME_DIR}/.bashrc
conda activate cdt

# # for multilingual models 
# for line in $(cat scripts/languages_div10.lst); do
#   CORPUS=($line)
#   echo "python preprocess_treebank.py ${CORPUS[0]} --xlmr xlm-roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   python preprocess_treebank.py ${CORPUS[0]} \
#   --xlmr xlm-roberta-base \
#   --use-gpu \
#   --use_own_lm \
#   --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/Div10_pretraining_output/final
# done

# for monolingual models
for read line; do
  CORPUS=($line)
  echo ${line}
  # echo "python preprocess_treebank.py ${CORPUS[0]} --roberta roberta-base"
  # TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
  # python preprocess_treebank.py ${CORPUS[0]} \
  # --roberta roberta-base \
  # --use-gpu \
  # --use_own_lm \
  # --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/${CORPUS[1]}_pretraining_output/final
done < scripts/languages_div.lst