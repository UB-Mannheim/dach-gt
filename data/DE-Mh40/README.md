## MARCHIVUM (Stadtarchiv Mannheim)

* Wöchentliches Mannheimer Frag- und Kundschafft-Blat (1748–1773), [Original](https://nbn-resolving.org/urn:nbn:de:bsz:mh40-994401)

### URL examples

* OAI/METS file – https://druckschriften-digital.marchivum.de/oai/?verb=GetRecord&metadataPrefix=mets&identifier=680731
* JPEG image (MAX) – https://druckschriften-digital.marchivum.de/download/webcache/0/606887

### Page images

The names of the PAGE files are the page identifiers of the library. To get
the images:

```
cd urn_nbn_de_bsz_mh40-994401/GT-PAGE
for x in *.xml; do
  curl -o ${x%.xml}.jpg https://druckschriften-digital.marchivum.de/download/webcache/0/${x%.xml}
done
```
