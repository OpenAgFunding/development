## Taxonomy exploration

This folder contains some rough-and-ready scripts for querying a GACS or AGROVOC sparql endpoint, and:

* Providing a starting term;
* Getting all the descendents of that term (transitive);
* Re-building the hierarchy from the starting term to the descendent term;
* Outputting a CSV file;

This is part of an exploration of how AGROVOC or GACS could be used in the Open Ag Funding project as tag lists.

### GACS

As no public SPARQL endpoint is currently available for GACS, running this script requires a local instance of Virtuoso with the GACS triples loaded.

### AGROVOC

The script currently uses the public AGROVOC sparql endpoint

