#!/bin/bash
HOME_DIR=/disk/ocean/zheng/ # Cohort-server
source ${HOME_DIR}/.bashrc
conda activate cdt

# for multilingual models 
for CORPUS in $(cat scripts/languages_div10.lst); do
  echo "python preprocess_treebank.py $CORPUS --xlmr xlm-roberta-base"
  TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
  python preprocess_treebank.py $CORPUS \
  --xlmr xlm-roberta-base \
  --use-gpu \
  --use_own_lm \
  --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/Div10_pretraining_output/final
done

# # for monolingual models
# for CORPUS in $(cat scripts/languages_div10.lst); do
#   echo "python preprocess_treebank.py $CORPUS --xlmr xlm-roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   python preprocess_treebank.py $CORPUS \
#   --roberta roberta-base \
#   --use-gpu \
#   --use_own_lm \
#   --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/Div10_pretraining_output/final
# done