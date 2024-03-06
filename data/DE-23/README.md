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
