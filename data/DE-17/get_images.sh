#!/usr/bin/env bash

# Get all missing page images for ther local data set.

cd urn_nbn_de_tuda-tudigit-155093
dir=GK-9099-S322-1
for xml in *.xml; do
  img=${xml/xml/jpg}
  url=https://tudigit.ulb.tu-darmstadt.de/image/$dir/3/$img
  test -f $img ||
  (echo $url; curl -LO --silent $url)
done
