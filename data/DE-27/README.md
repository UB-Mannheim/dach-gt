## Thüringer Universitäts- und Landesbibliothek Jena

* Bibliotheca Electoralis [Konvolut: Sign. 4 Theol.XXIV,52] (1516–1517), [Original](https://nbn-resolving.org/urn:nbn:de:urmel-9a42d37f-4d2b-4daf-a90c-0667ad0ddefa4), [mit Volltext]()

### URL examples

* IIIF manifest – https://collections.thulb.uni-jena.de/api/iiif/presentation/v2/HisBest_derivate_00000163/manifest
* METS file – https://collections.thulb.uni-jena.de/servlets/MCRMETSServlet/HisBest_derivate_00000163?XSL.Style=dfg

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
ocrd workspace clone https://collections.thulb.uni-jena.de/servlets/MCRMETSServlet/HisBest_derivate_00000163?XSL.Style=dfg
