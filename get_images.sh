#!/usr/bin/env bash

# Get all missing page images for the dach-gt data set.

for ppn in data/DE-1/ppn* data/DE-12/urn_nbn_de_bvb_12-bsb*/GT-PAGE; do (
  cd $ppn
  for xml in *.xml; do
    filename=$(grep imageFilename $xml|perl -pe 's/^.*imageFilename="(.*jpg)".*/$1/')
    url=$(grep externalRef $xml|perl -pe 's/^.*(http.*jpg).*/$1/')
    test -f "$filename" && echo "$ppn/$filename already exists" || (echo "$ppn/$filename - $url"; curl -s -o "$filename" "$url")
  done
) done

(
urn=data/DE-17/urn_nbn_de_tuda-tudigit-155093
cd $urn
dir=GK-9099-S322-1
for xml in *.xml; do
  img=${xml/xml/jpg}
  url=https://tudigit.ulb.tu-darmstadt.de/image/$dir/3/$img
  test -f $img && echo "$urn/$img already exists" ||
  (echo $url; curl -LO --silent $url)
done
)
