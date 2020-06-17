#!/usr/bin/env bash


inpDir="$HOME/dst-stu/d/mr/tf-idf"
outFile="$HOME/dst-stu/src/out.tsv"
swPth="$HOME/dst-stu/src"

cat $inpDir/* | "$swPth/mapper" | "$swPth/reducer" | sort | tee "$outFile"

