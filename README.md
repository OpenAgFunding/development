# Development Workspace: Initiative for Open Ag Funding

![Project Logo](https://avatars1.githubusercontent.com/u/19473827)

Food insecurity constitutes one of the world’s most pressing development needs. Although progress is being made, almost 800 million people worldwide still suffer from hunger.

Investments in agriculture are critical to improving food security and nutrition and to reducing poverty. However, in order to make the most effective investment decisions, organizations must have access to timely, comprehensive, and comparable information. Today, such information is either unavailable or not comparable due to differing data or coding standards. Simply put, without a clearer and more reliable picture of agricultural investments worldwide, the billions of dollars invested in agriculture each year might not be reaching their full potential.

The Initiative for Open Ag Funding is seeking to improve international standards for reporting on funding for food security and agriculture. Our goal is to ensure that those providing funding in this sector have the data they need to make good decisions about their investments, and that those working to improve the effectiveness of those resources have the data they need to hold organizations accountable.

To do so, the project will identify current data needs and propose relevant changes and extensions to the International Aid Transparency Initiative (IATI) standard, which has become the international standard for sharing data on aid activities. InterAction and its partners will then promote the adoption of any updates to the IATI standard by donors, foundations and NGOs, with the aim of increasing the amount of high quality, standardized data publicly available. Our ultimate goal is to see this data used to inform investments to improve the lives of millions affected by food insecurity and poverty. 

For more information on the Initiative for Open Ag Funding, please contact [David Duffeck](dduffeck@interaction.org).

## This repository

This repository is a workspace for development of approaches to address the current gap in data availability and usability.

You can [engage in discussions through the issue tracker](https://github.com/OpenAgFunding/development/issues) and you will find a growing collection of documentation here as the project develops. 

## Building the documentation

The docs folder contains documentation on use of IATI for Agriculture. 

The documentation is written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and built with [Sphinx](http://www.sphinx-doc.org/en/1.5.1/)

To build the documentation locally:

(1) Clone the project and setup a python virtual environment

```
git clone https://github.com/OpenAgFunding/development.git
virtualenv .ve -p python3
source .ve/bin/activate
pip install -r docs/requirements.txt
```

(2) Enter the documentation folder and build the project

```
cd docs
make dirhtml
```

(3) Serve the files using pythons local web server

```
cd _build/dirhtml
python3 -m http.server
```

The documentation site will now be accessible at http://localhost:8000/

On OSX you can use fswatch to rebuild whenever there are updates to the markdown files:

```
fswatch -o *.md |  xargs -n1 make dirhtml &
```


## Partners

The Initiative for Open Ag Funding is a partnership project, co-ordinated by [InterAction](http://www.interaction.org) and working with [Development Gateway](http://www.developmentgateway.org/), the [Foundation Center](http://foundationcenter.org/), [Publish What You Fund](http://www.publishwhatyoufund.org/), and the [CGIAR Research Program on Policies, Institutions and Markets (PIM)](http://www.pim.cgiar.org/).

Technical consultancy for the project is provided by [Open Data Services Co-operative](http://www.opendataservices.coop).
