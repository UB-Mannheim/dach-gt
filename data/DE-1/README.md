## Staatsbibliothek zu Berlin

Das Hexen Buch.

* Theil 2 (1569), [Original](http://resolver.staatsbibliothek-berlin.de/SBB00018A0E00010000)

Die gesammten Materialien zu den preußischen Ausführungsgesetzen zum Bürgerlichen Gesetzbuch für das Deutsche Reich und seinen Nebengesetzen

* (1900), [Original](http://resolver.staatsbibliothek-berlin.de/SBB000066FA00000000), [mit Volltext]()


### URL examples

* OAI/PMH - https://oai.sbb.berlin/?verb=Identify ([Beschreibung](https://lab.sbb.berlin/dc/))
* IIIF manifest – https://content.staatsbibliothek-berlin.de/dc/671169300/manifest
* METS file – https://content.staatsbibliothek-berlin.de/dc/PPN671169300.mets.xml

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
