## Bayerische Staatsbibliothek / Münchener DigitalisierungsZentrum (MDZ)

* Vinzenz, Ferrer, Heiliger: Hienach hebt an ein wunderberlicher tractat... von dem ende der weltt (1486), [Original](https://mdz-nbn-resolving.de/urn:nbn:de:bvb:12-bsb00034304-6), [mit Volltext](https://dfg-viewer.bib.uni-mannheim.de/viewer?tx_dlf%5Bid%5D=https%3A%2F%2Fub-backup.bib.uni-mannheim.de%2F~stweil%2Fd-gt%2Fdata%2FDE-12%2Furn%3Anbn%3Ade%3Abvb%3A12-bsb00034304-6%2Fmets.xml)

### URL examples

* IIIF manifest – https://api.digitale-sammlungen.de/iiif/presentation/v2/bsb00034304/manifest
* METS file – http://daten.digitale-sammlungen.de/~db/mets/bsb00034304_mets.xml

### Useful commands for data handling

```
# Fix names of ALTO files to match image names.
for f in $(grep -l fileIdent *.xml); do t=$(grep fileIdent $f|sed s/.*iiif.image.v2.//|sed s/.full.*/.xml/); mv -iv $f $t; done

# Create virtual Python3 environment and install OCR-D.
cd d-gt/
python3 -m venv venv
source venv/bin/activate
pip install -U pip wheel ocrd

# Add ALTO files to METS files.
ocrd --log-level INFO workspace bulk-add -r 'alto/.*_0*(?P<pageid>[^/]+).xml' -G FULLTEXT --file-id 'fulltext-{{ pageid }}' --page-id='div{{ pageid }}' --mimetype text/xml alto/*.xml

perl -pi -e 's/LOCTYPE="OTHER" OTHERLOCTYPE="FILE"/LOCTYPE="URL"/' mets.xml
perl -pi -e s,alto,https://ub-backup.bib.uni-mannheim.de/~stweil/d-gt/data/DE-12/urn:nbn:de:bvb:12-bsb00034304-6/alto, mets.xml
```
