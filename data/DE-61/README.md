## Universitäts- und Landesbibliothek Düsseldorf

*  Die gesammten Materialien zur Civilprozeßordnung und dem Einführungsgesetz zu derselben vom 30. Januar 1877 / Abtheilung 2 (1881), [Original](https://www.ub.uni-koeln.de/cdm/ref/collection/mono19/id/21180), [mit Volltext]()

Die gesammten Materialien zum Bürgerlichen Gesetzbuch für das Deutsche Reich / hrsg. u. bearb. von B. Mugdan

* 1 (1899) Einführungsgesetz und Allgemeiner Theil, http://digital.ub.uni-duesseldorf.de/ihd/content/titleinfo/6052879
* 2 (1899) Recht der Schuldverhältnisse, http://digital.ub.uni-duesseldorf.de/ihd/content/titleinfo/6058991
* 3 (1899) Sachenrecht, http://digital.ub.uni-duesseldorf.de/ihd/content/titleinfo/5986670
* 4 (1899) Familienrecht, http://digital.ub.uni-duesseldorf.de/ihd/content/titleinfo/6008016
* 5 (1899) Erbrecht, http://digital.ub.uni-duesseldorf.de/ihd/content/titleinfo/5986649
* :


### URL examples

* METS file – http://www.ub.uni-koeln.de/cdm4/mets_gateway.php?CISOROOT=/mono19&CISOPTR=21180
* Page image – https://www.ub.uni-koeln.de/cgi-bin/showfile.exe?CISOROOT=/mono19&CISOPTR=20293

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
