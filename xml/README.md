# XML queries on IATI data

This folder contains scripts to work with [BaseX](http://basex.org).

BaseX is an XML database used to import all XML files in an IATI data snapshot
as raw material for further research
(import settings: skip corrupt files; use internal parser; chop whitespaces).

`agdata.xqm` provides a module for all Open Ag-related data based
on DAC sector codes. This can then be used in further explorations.

`lib/iati.xqm` provides a module with some IATI-specific helper functions.

`results` contains output of research scripts.
