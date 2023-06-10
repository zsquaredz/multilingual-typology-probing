#!/bin/bash
HOME_DIR=/disk/ocean/zheng/ # Cohort-server
source ${HOME_DIR}/.bashrc
conda activate cdt

# # for multilingual models Div-10
# while read line; do
#   CORPUS=($line)
#   echo "python preprocess_treebank.py ${CORPUS[0]} --xlmr xlm-roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   python preprocess_treebank.py ${CORPUS[0]} \
#   --xlmr xlm-roberta-base \
#   --use-gpu \
#   --use_own_lm \
#   --exp_name Div10-CSD3 \
#   --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/Div10_csd3_pretraining_output/final
# done < scripts/languages_debug.lst

# # for multilingual models Rel-5
# while read line; do
#   CORPUS=($line)
#   echo "python preprocess_treebank.py ${CORPUS[0]} --xlmr xlm-roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   python preprocess_treebank.py ${CORPUS[0]} \
#   --xlmr xlm-roberta-base \
#   --use-gpu \
#   --use_own_lm \
#   --exp_name Rel5 \
#   --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/Rel5_pretraining_output/final
# done < scripts/languages_rel5.lst

# for multilingual models All-33
export PYTHONPATH=${PYTHONPATH}:${HOME_DIR}/multilingual-typology-probing
HOME=$HOME_DIR TRANSFORMERS_CACHE=${HOME_DIR}/.cache/ 
while read line; do
  CORPUS=($line)
  echo "python preprocess_treebank.py ${CORPUS[0]} --xlmr xlm-roberta-base"
  TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
  CUDA_VISIBLE_DEVICES=1 python preprocess_treebank.py ${CORPUS[0]} \
  --xlmr xlm-roberta-base \
  --use-gpu \
  --use_own_lm \
  --exp_name All33LowFR10S00 \
  --lang ${CORPUS[1]} \
  --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/All33_pretraining_output_low_fr_10_sampling_00/final
done < scripts/languages_debug2.lst

# # for pretrained checkpoint multilingual models All-33
# export PYTHONPATH=${PYTHONPATH}:${HOME_DIR}/multilingual-typology-probing
# HOME=$HOME_DIR TRANSFORMERS_CACHE=${HOME_DIR}/.cache/ 
# while read line; do
#   CORPUS=($line)
#   echo "python preprocess_treebank.py ${CORPUS[0]} --xlmr xlm-roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   CUDA_VISIBLE_DEVICES=0 python preprocess_treebank.py ${CORPUS[0]} \
#   --xlmr xlm-roberta-base \
#   --use-gpu \
#   --use_vanilla \
#   --exp_name All33Vanilla \
#   --lang ${CORPUS[1]} 
# done < scripts/languages_debug1.lst

# # for monolingual models
# while read line; do
#   CORPUS=($line)
#   echo "python preprocess_treebank.py ${CORPUS[0]} --roberta roberta-base"
#   TRANSFORMERS_CACHE=${HOME_DIR}/.cache/
#   CUDA_VISIBLE_DEVICES=0 python preprocess_treebank.py ${CORPUS[0]} \
#   --roberta roberta-base \
#   --use-gpu \
#   --use_own_lm \
#   --exp_name LOWRES10 \
#   --lang ${CORPUS[1]} \
#   --model_path /disk/ocean/zheng/multilingual_lm_analysis/out/${CORPUS[1]}-multi-tok_pretraining_output_low_res_10/final
# done < scripts/languages_debug1.lst