## Universitätsbibliothek Marburg

* Mausoleum, herrliches Grab des bayrischen Apostels und Blut-Zeugens S. Emmerami (1752) – [Original](https://archiv.ub.uni-marburg.de/ubfind/Record/urn:nbn:de:hebis:04-eb2010-0168/View), [mit Volltext](https://dfg-viewer.de/show?tx_dlf[id]=https%3A%2F%2Fub-backup.bib.uni-mannheim.de%2F~stweil%2Fd-gt%2Fdata%2FDE-4%2Furn_nbn_de_hebis_04-eb2010-01689%2Fmets.xml)

### URL examples

* METS file - https://archiv.ub.uni-marburg.de/eb/2010/0168/mets-2879.xml
* OAI-PMH - https://archiv.ub.uni-marburg.de/ubfind/OAI/Server?verb=Identify

### Useful commands for data handling

```
# Add ALTO files to METS files.
for f in $(ls alto/image*); do i=$(echo $f|grep -o "[0-9]*"); echo $(expr $i + 1) $f; done | \
ocrd --log-level INFO workspace bulk-add -r '(?P<n>[0-9]*) alto/image(?P<pageid>.*).xml' \
-G FULLTEXT --file-id 'fulltext_{{ n }}' --page-id='phys_tif_{{ n }}' --mimetype text/xml \
--url 'https://raw.githubusercontent.com/UB-Mannheim/dach-gt/refs/heads/main/data/DE-4/urn_nbn_de_hebis_04-eb2010-01689/alto/image{{ pageid }}.xml' -
```
