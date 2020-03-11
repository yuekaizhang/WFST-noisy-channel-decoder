#!/bin/bash

set -e

for name in DelSomeSpaces DelSuffixes Typos Telephone Tinyphone MultiNoiser; do

    grmfilter -r noisy_add18.grm  ${name} < entest.txt > entest_noisy_${name}.txt
    grmfilter -s noisy_add18.grm ${name}_inv,str_vocab2byte_inv,LM_inv < entest_noisy_${name}.txt > entest_recover_${name}.txt
    editdist entest.txt entest_recover_${name}.txt > dist_${name}.txt
    echo "=================================================="
    echo $name :
    tail -n 1 dist_${name}.txt
done > dist.txt
