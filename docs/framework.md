Framework
========= 

The Open Ag Funding framework identifies 20 elements from the IATI standard and how they should be used to meet the needs of agricultural development and food security funders and practitioners.

Each of the elements are outlined below, along with:

* Why this element matters;
* An example of this element represented in IATI XML;
* An example of this element represented in tabular format;
* Additional information about collecting and managing this information.

For each activtiy reported, data publishers should aim to provide each of the following components:

### Reporting Organization
 
```eval_rst
.. doc-tabs::

    .. admonition:: Why?
    
        **Data users need to know where information has come from.**

        You can use the IATI standard to publish information about your own activities, or to provide information you have collected on the investments and funding activities of others.

        The reporting organization block is used to identify the publisher of all of the following information.

    .. admonition:: How?
      
        The reporting organisation details can usually be set as a constant value for all the activities you publish.

        As well as the organisation name, you will need an **identifier** and a code to describe the organisation type from the OrganisationType codelist.

        Check the **identifiers** page for information on locating your own organisation identifier. 

    .. literalinclude:: /examples/US-1-TZ-50-AID-621-TO-11-05000.xml
       :language: xml
       :start-after: <iati-identifier>
       :end-before: <title>
       :dedent: 8

    .. container :: csv

        .. csv-table:: CSV
           :file: docs/examples/reporting-org.csv
           :header-rows: 1

```

IATI Docs: [reporting-org](http://iatistandard.org/activity-standard/iati-activities/iati-activity/reporting-org/) | [OrganisationType codelist](http://iatistandard.org/201/codelists/OrganisationType/) 

### Metadata

Default currencies and languages used in reporting.

```eval_rst

```


### Activity ID

Activities should be described at a suitable level of granularity. For example, different projects in the same country should not be bundled together in reporting.

### Activity Title

A clear and comprehensible project title that indicates the focus of the activity.

### Activity Status

Information about activities should be regularly updated

### Activity Dates

Start and end dates, either planned or actual.

### Activity Descriptions

Distinct descriptions should be provided for:

### Description of activity

Objectives of activity

Target groups of activity

### Aid classifications

Classifications against core IATI fields for: Collaboration Type, Default Flow Type, Default Finance Type, Default Aid Type and Default Tied Status. 
Note: These will often be set as constant values for any given reporting organisation if they are not otherwise recorded for ODA reporting. 

### Sector Classification

Classification against OECD DAC Sector codes, plus additional taxonomies, including (tbc):
AGROVOC
Agricultural Technology Ontology

### Participating Organisations

Details on all participating organisations, including partners. This information should be kept updated as new partners are engaged with a project.

### Contact details

At least one contact address for more information on the specific project. 
Documents
Any relevant and associated project documents should be published and linked to. Examples of useful documents include: project plans, monitoring data, interim reports and evaluations.

### Location (Country/Region)

Including information on the percentage of total project budget in each country or region (when more than one is present).

### Sub-national location

Detailed information on the on-the-ground location where activities are taking place.  Where possible, this should be to the geographic precision of second order administrative division (ADM2).

### Budget

Year by year project budget information.

### Transaction

Information on the major transactions associated with the project, particularly commitments and disbursements to partners.

### Transaction classification

Where possible, transactions should be classified against relevant sector codes (see Focus 3)

### Transaction parties (participating organisations)

Transactions should clearly identify the partner receiving funding, and the relevant organisation should be detailed under participating organisations.

### Transaction Traceability

Where possible, transactions should link onwards to related IATI activities (sometimes published by other organisations).

### Results information

Project should publish information on any indicators and benchmarks the project is oriented towards meeting, as well as any structured results data that is available.

Even when results data is not available, the indicators by which a project impact will be measured should be published in a structured form, and associated results documents linked to via the document section. 
