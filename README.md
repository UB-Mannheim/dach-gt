## Ground truth and full text for selected prints of German libraries

* [Bayerische Staatsbibliothek](data/DE-12) / Münchener Digitalisierungszentrum


### Collection of useful commands

```
# Remove empty lines from ALTO and PAGE XML.
perl -i -ne "tr|\r||d; next if /^\s*$/;print" *.xml

# Remove ALTO files without fulltext.
rm -f $(grep -L 'CONTENT="..*"' *.xml)

# Remove PAGE files without fulltext.
rm $(grep -L '<Unicode>..*</Unicode>' *.xml)
```
