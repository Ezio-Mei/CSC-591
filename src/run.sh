#!/bin/bash

# params of --dataset: ag_news, yahoo, imdb
count=0
lbd=0.5
for thr in 0.7 0.8 0.9; do
for mu in 4 7 10; do
    count=`expr $count+1`
    # if [[ $count -le 4 ]];then
    #     continue;
    # fi
    python main.py --task 'baseline' --dataset 'news' --num_labeled 50 --patience 50 --num_epoch 10 --lr_bert 5e-5 --mu $mu --thr $thr --lbd 0.1 --aug_metric 'base'
done
done

# count=0
# lbd=0.1
# for thr in 0.99; do
# for mu in 5; do
#     count=`expr $count+1`
#     # if [[ $count -le 4 ]];then
#     #     continue;
#     # fi
#     CUDA_VISIBLE_DEVICES=0 python main.py --dataset 'yahoo' --num_labeled 20 --task semi --patience 10 --num_epoch 100 --lr_bert 5e-5 --mu $mu --thr $thr --lbd $lbd --aug_metric 'base'
# done
# done
#python main.py --task 'baseline' --dataset 'news' --num_labeled 50 --patience 50 --num_epoch 50 --lr_bert 5e-5 --mu 4 --thr 0.9 --lbd 0.1 --aug_metric 'base'
#python main.py --dataset 'yahoo' --num_labeled 20 --task semi --patience 5 --num_epoch 5 --lr_bert 5e-5 --mu 4 --thr 0.5 --lbd 0.1 --aug_metric 'sim'