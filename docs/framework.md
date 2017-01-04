Framework
========= 

The Open Ag Funding framework identifies 20 elements from the IATI standard and how they should be used to meet the needs of agricultural development and food security funders and practitioners.

Each of the elements are outlined below, along with:

* Why this element matters;
* An example of this element represented in IATI XML;
* An example of this element represented in tabular format;
* Additional information about collecting and managing this information.

For each activity reported, data publishers should aim to provide each of the following components:

### Activity ID

Each funding allocation or invesment you report on should be assigned an activity identifier. The IATI documentation states that:

> An activity is defined by the reporting organisation. Depending on who is reporting, it might be a large programme, a small project or another logical grouping of work and resources.

When publishing your data, you should establish the level at which you will report activities, and then follow IATI guidance to provide a  'globally unique' ID for each one.  

```eval_rst
.. doc-tabs::

    .. admonition:: Why?
    
        It is important that activities are suitably disaggregated. For example, if you have multiple projects in a country, there should be an activity record for each of them. 

        All the other elements of the framework are about the descriptions you apply to each activity. 

        By using a globally unique identifier for each activity, it becomes possible to cross-reference between different publishers datasets. This is important for **traceability**.
       
    .. admonition:: How?
      
        An IATI identifier is usually constructed by combining the **organisation identifier** of the reporting organisation as a prefix, with a dash (-), and then a local identifier from your existing systems.

        For example, if your organisation identifier is 'GB-COH-09506232' and you are reporting on an activity that is in your database as 'A2017_01' then the iati-identifier will be 'GB-COH-09506232-A2017_01'.

        You don't usually need to enter or store the prefix in your database for each individual activity: it can be added when data is exported, or using a formula. 

    .. code-block:: xml
    
        <iati-identifier>US-1-TZ-50-AID-621-TO-11-05000</iati-identifier>

    .. container :: csv

        .. csv-table:: CSV
           :header-rows: 1

           iati-identifier
           US-1-TZ-50-AID-621-TO-11-05000

```

IATI Docs: [iati-activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [IATI Identifier](http://iatistandard.org/activity-standard/iati-activities//iati-activity/iati-identifier/) 

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

        If you are reporting on behalf of another organisation, the secondary-reporter attribute should be set to '1'. Otherwise it should be '0'.

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

### Metadata: default currency and language

```eval_rst
.. doc-tabs::

    .. admonition:: Why?
    
        You can report your activities in different languages and currencies.

        When you specify the default, then tools displaying the data can be sure they show the right language and currency values to their users. 

    .. admonition:: How?
      
        These can usually be set as constant values for all the information you are publishing, unless you have certain sets of activities that use different default currencies and languages. 

        The default currency (default-currency) is represented with a three-letter currency code. 

        The default language (xml:lang) is represented with a two-letter country code

        These are expressed as attributes of the iati-activity element

    .. code-block:: xml
    
        <iati-activity default-currency="USD" xml:lang="en">

    .. container :: csv

        .. csv-table:: CSV
           :header-rows: 1

           xml:lang,default-currency
           en,USD

```

IATI Docs: [iati-activity](http://iatistandard.org/201/activity-standard/iati-activities/iati-activity/) | [Currency codelist](http://iatistandard.org/codelists/Currency/) | [Language codelist](http://iatistandard.org/codelists/Language/)
