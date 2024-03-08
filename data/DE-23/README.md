## Herzog August Bibliothek Wolfenbüttel

* Disputationum Academicarum (1652), [Original](http://diglib.hab.de/drucke/li-1876-1/start.htm)

### URL examples

* OAI/METS file – http://oai.hab.de/?verb=GetRecord&metadataPrefix=mets&identifier=oai:diglib.hab.de:ppn_549836969
* JPEG image (DEFAULT) – http://diglib.hab.de/drucke/li-1876-1/00016.jpg
* JPEG image (MAX) – http://diglib.hab.de/drucke/li-1876-1/max/00016.jpg

### Useful commands for data handling

```
# Remove PAGE XML files without transcriptions.
rm $(grep -L "<Unicode>..*</Unicode>" *xml)
```

#### Add ALTO files to METS file for presentation

```
# Create and activate a virtual Python environment.
python3 -m venv venv
source venv/bin/activate

# Update / install Python packages.
pip install -U pip
pip install ocrd

# Get METS file.
ocrd workspace clone "http://oai.hab.de/?verb=GetRecord&metadataPrefix=mets&identifier=oai:diglib.hab.de:ppn_549836969"

# Export all manual transcriptions in ALTO format from eScriptorium, download and unzip them.
(
mkdir gt && cd gt
wget ...
unzip ...
)

# Export all OCR results in ALTO format from eScriptorium, download and unzip them.
(
mkdir kraken && cd kraken
wget ...
unzip ...
)

# Combine manual transcriptions and OCR result in the same directory.
(
mkdir alto && cd alto
ln -s ../kraken/*.xml .
ln -sf ../gt/*.xml .
...
)

# Add ALTO files to METS file.
grep ID=.struct-physical- mets.xml | \
ocrd --log-level INFO workspace bulk-add \
  --regex '.* ID=.struct-physical-(?P<physid>idp[0-9]+).*image=(?P<fileid>[^"]+)' \
  --file-grp FULLTEXT \
  --mimetype text/xml \
  --file-id 'file-alto-{{ physid }}' \
  --page-id='struct-physical-{{ physid }}' \
  --local-filename='alto/{{ fileid }}.xml' \
  --url='https://ub-backup.bib.uni-mannheim.de/~stweil/d-gt/data/DE-23/urn_nbn_de_gbv_23-drucke_li-1876-12/alto/{{ fileid }}.xml' \
  -
```
