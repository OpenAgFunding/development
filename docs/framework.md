Framework
=========

The Open Ag Funding framework identifies 20 elements from the IATI standard and how they should be used to meet the needs of agricultural development and food security funders and practitioners.

The requirements can be divided into three groups

```eval_rst
.. csv-table:: Data Quality Requirements: Overview
           :header-rows: 1

           Meta-Data,Core IATI,Enhanced Data
           "Fields that are important for interoperability, but that can often be set as constant values in the software or spreadsheets used to publish data","Fields that are part of the basic International Aid Transparency Initiative standard. These are commonly available in existing databases of funding or investments.","Fields or quality requirements for existing fields, tailored to the needs of the Agriculture and Food Security community. Providing these will  invole some additional steps to collect or re-code information."
           "Activity ID, Activity Status, Default currency and language, Reporting Organisation, Aid Classifications","Activity Title, Activity Descriptions, Activity Dates, Budget, Location (Country/region), Transactions","Participating orgnaisations, Contact details, Sub-national location, Transaction classification, Transaction parties, Transaction traceability, Results information"
```

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

        <iati-identifier>US-1-TZ-50-AID-EXAMPLE-IDENTIFIER</iati-identifier>

    .. container :: csv

        .. csv-table:: CSV
           :header-rows: 1

           iati-identifier
           US-1-TZ-50-AID-EXAMPLE-IDENTIFIER

```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [IATI Identifier](http://iatistandard.org/activity-standard/iati-activities/iati-activity/iati-identifier/)

### Activity Title

A clear and comprehensible project title that indicates the focus of the activity.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Giving each activity a clear titles makes discovering and understanding the focus of activities much easier. This is particularly important when data about activities is being shared across contexts and in different platforms.

        Compare the two lists below? Which would you prefer to see in your search results when browsing for relevant projects and investments?

        .. csv-table:: CSV
           :header-rows: 1

           Bad titles,Good titles
           PROFSERV 15-17 Ghana WDP,Western Ghana Wheat Development Project
           PA Zambia RDP,Zambia Rural Development Project (Partnership Agreement)
           EARS NP,Early Recovery in Agriculture Sector in Nepal

    .. admonition:: How?

        Usually you will be able to take activity titles from your existing database or management information systems. A good title will:

        * Avoid acroynms (unless very widely used - e.g. UN);
        * Be 2 - 10 words long;
        * Put a project in context (e.g. mentioning the country or locality for the project, the goals, or the crop types)

        Consider whether the interface for entering activity names in your database, or training for the people who add new activities, needs to be adapted to promote good quality titles.

        The title field in IATI uses the 'narrative' element to allow titles to be provided in multiple languages. If you don

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: </reporting-org>
       :end-before: <description type="1">
       :dedent: 8

    .. container :: csv

        .. csv-table:: CSV
           :header-rows: 1

           title/narrative
           Agricultural Capacity Building in Tanzania

```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Title](http://iatistandard.org/activity-standard/iati-activities/iati-activity/title/)

### Activity Descriptions

Unstructured text describing the activity, its objectives, or its target groups.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        The general description of an activity is often the first thing peopel will see when trying to understand the details of an investment or activity. Descriptions are also used by auto-classification tools, that may look for agriculture-specific keywords.

        Including a separate description of the objectives of an activity, and the target groups, can further help both individuals reading up on a project, and computers configured to assist with searching across projects.

    .. admonition:: How?

        The description element can be used to provide distinct text for:

        * A description of activity in general
        * The objectives of activity
        * The target groups of activity

        The type of description provided is specified using the description's `@code` attribute as illustrated in the see the xml example.

        You may need to consider how project forms, and project databases, collect clear descriptions for each of these fields, or it may be possible to automatically populate objective and target-group fields from structured information in your project database, log-frames or project documents.

        A good general description to support Open Ag Funding will be:

        * 20 - 500 words long;
        * Have a first paragraph written for a general audience;
        * Include additional detail in subsequent paragraphs, with specialist information and terminology where appropriate;
        * Avoid acronyms, but not avoid specific technical terms - as these can be useful for search and auto-classification;
        * Include a line-break between paragraphs;

        Objectives and target group descriptions might be written in prose, or using short bullet points.

        TODO: IMPROVE THE EXAMPLE DESCRIPTIONS TO MATCH THE ABOVE REQUIREMENTS

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: </title>
       :end-before: <participating-org ref="US-USAGOV" role="1" type="10">
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/description.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Description](http://iatistandard.org/activity-standard/iati-activities/iati-activity/title/)

### Activity Status

Indidcates what phase an activity is in its life cycle.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        The activity status makes it clear whether a project is planned, active or completed. This is important to support collaboration on upcoming projects, or shared learning from projects that have already taken place.

    .. admonition:: How?

        Chose from one of the available codes in the `Activity Status codelist <http://iatistandard.org/202/codelists/ActivityStatus/>`_.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <!--pre-status-bookmark-->
       :end-before: <activity-date iso-date="2011-04-08" type="2"/>
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
         :header-rows: 1

         activity-status/@code
         2
```
> Note: the code '2' in the examples above means 'Implementing'

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Activity Status](http://iatistandard.org/activity-standard/iati-activities/iati-activity/activity-status/)

### Activity Dates

Start and end dates, either planned or actual.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        These dates allow data users to tell when a project is planned to start and finish, or when a project actually started or finished.

    .. admonition:: How?

        A standardised iso date with the format YYYY-MM-DD, plus a code to declare if a date is start/end planned/actual, according to the `Activity Date Type codelist <http://iatistandard.org/202/codelists/ActivityDateType/>`__.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <activity-status code="2"/>
       :end-before: <contact-info type="1">
       :dedent: 8

    .. container :: csv

        .. csv-table:: CSV
           :header-rows: 1

           activity-date/@iso-date, activity-date/@type
           2011-04-08,2
           2017-04-07,4
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Activity Date](http://iatistandard.org/activity-standard/iati-activities/iati-activity/activity-date/)


### Aid classifications

Classifications against core IATI fields for: Collaboration Type, Default Flow Type, Default Finance Type, Default Aid Type and Default Tied Status.
Note: These will often be set as constant values for any given reporting organisation if they are not otherwise recorded for ODA reporting.


```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        These fields are particularly useful when publishing `OECD DAC CRS <https://stats.oecd.org/Index.aspx?DataSetCode=CRS1>`__ compatible activities.

    .. admonition:: How?

        Each of these fields have their own corresponding codelist, linked below:

        .. list-table:: Aid Classification Codelists
         :header-rows: 1

         * - Element
           - Codelist
         * - `Collaboration Type <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/collaboration-type/>`__
           - `Collaboration Type <http://iatistandard.org/202/codelists/CollaborationType/>`__
         * - `Default Flow Type <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/default-flow-type/>`__
           - `Flow Type <http://iatistandard.org/202/codelists/FlowType/>`__
         * - `Default Finance Type <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/default-finance-type/>`__
           - `Finance Type <http://iatistandard.org/202/codelists/FinanceType/>`__
         * - `Default Aid Type <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/default-aid-type/>`__
           - `Aid Type <http://iatistandard.org/202/codelists/AidType/>`__
         * - `Default Tied Status <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/default-tied-status/>`__
           - `Tied Status <http://iatistandard.org/202/codelists/TiedStatus/>`__


    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <!-- pre-aid-classifications-bookmark -->
       :end-before: <transaction ref="1234" humanitarian="1">
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/aid_classifications.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | (see 'How' above)


### Sector Classification

Classification against OECD DAC Sector codes, plus additional vocabularies, which can be found on the [Sector vocabulary codelist](http://iatistandard.org/202/codelists/SectorVocabulary/), or a custom sector codelist can be used (see 'how').

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Sector classifications allow publishers to specify why they are undertaking a given activity. This is very useful for data users, as it can be cross-referenced with locations / recipient countries / and the receivers of transctions to give an insight in to what aspects of development assistance are well funded, where and to whom.

    .. admonition:: How?

        A recognised code, from a recognised vocabulary, classifying the purpose of the activity. Sector must either be reported at the activity level or at transaction level for all transactions.

        The most commonly used sector vocabulary is the `OECD DAC CRS Purpose Codes <http://www.oecd.org/dac/stats/dacandcrscodelists.htm>`__. This is useful to make a broad categorisation of an activity (or transaction), but has limited scope to capture details about agricultural projects.

        This is where other vocabularies become useful. There are two ways of using another sector vocabularly:

        1. By using one of the alternative vocabularies available on the `Sector Vocabulary codelist <http://iatistandard.org/202/codelists/SectorVocabulary/>`__.

        2. By declaring the ``vocabulary`` of the sector to be ``99``, and then specifying the ``vocabulary-uri`` along with it.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: </location>
       :end-before: <!-- pre-policy-marker-bookmark -->
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/sectors.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Sector](http://iatistandard.org/activity-standard/iati-activities/iati-activity/sector/)

### Policy Marker

Classification against OECD DAC Policy Marker codes, plus additional vocabularies, which can be found on the [Policy Marker Vocabulary codelist](http://iatistandard.org/202/codelists/PolicyMarkerVocabulary/), or a custom sector codelist can be used (see 'how').

> TODO: check available Ag codelists

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Policy Markers allow publishers to specify the focus of a given activity, and indicate the degree of that focus. This is very useful for data users, as it can be cross-referenced with locations / recipient countries / and the receivers of transctions to give an insight in to what aspects of development assistance are well funded, where and to whom. Unlike the Sector elemet, the Policy Marker element doesn't extend to transaction level, and doesn't expect percentages for more than one instance, which means they act more like a *tag*.

    .. admonition:: How?

        A recognised code, from a recognised vocabulary, classifying the policy focus of the activity. Currently, this can only be reported at the activity level.

        The most commonly used vocabulary for this element is the `OECD DAC CRS Policy Marker <http://www.oecd.org/dac/stats/dacandcrscodelists.htm>`__. Again, this vocabulary is useful to make a broad categorisation of an activity (or transaction), but has limited scope to capture details about agricultural projects.

        As with Sector elemnts, other vocabularies are useful here. There are two ways of using another Policy Marker vocabularly:

        1. By using one of the alternative vocabularies available on the `Sector Vocabulary codelist <http://iatistandard.org/202/codelists/PolicyMarkerVocabulary/>`__.

        2. By declaring the ``vocabulary`` of the sector to be ``99``, and then specifying the ``vocabulary-uri`` along with it. See the XML and and CSV boxes for an example using `AGROVOC <http://aims.fao.org/aos/agrovoc/>`__.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: </location>
       :end-before: <!-- pre-policy-marker-bookmark -->
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/sectors.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Policy Marker](http://iatistandard.org/activity-standard/iati-activities/iati-activity/policy-marker/)

### Participating Organisations

Details on all participating organisations, including partners. This information should be kept updated as new partners are engaged with a project.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Declaring participating organisations is one way of connecting IATI data together, and allowing data users to know which funders, partners, sub-contractors, or grantees are conencted to a given activity.

    .. admonition:: How?

        Organisations are identified by their name and IATI Identifier (which is declared in the ``ref`` attribute). How they relate to the project is declared in the ``role`` attribute, which corresponds to the `Organisation Role codelist <http://iatistandard.org/202/codelists/OrganisationRole/>`__, and the type of the organisation is declared in the `Organisation Type codelist <http://iatistandard.org/202/codelists/OrganisationType/>`__.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <!--pre-participating-org-bookmark-->
       :end-before: <!--pre-status-bookmark-->
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/participating-orgs.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Participating Organisation](http://iatistandard.org/activity-standard/iati-activities/iati-activity/participating-org/)

### Contact details

At least one contact address for more information on the specific project.
Documents
Any relevant and associated project documents should be published and linked to. Examples of useful documents include: project plans, monitoring data, interim reports and evaluations.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Contact details offer data users an official communication channel which can be used to make enquiries about data.

    .. admonition:: How?

        IATI is quite flexible with which aspects of the contact information can be included or omitted, but the fields given in the XML and CSV is recommended. For a full breakdown of the available fields, see the official documentation linked below

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <activity-date iso-date="2017-04-07" type="4"/>
       :end-before: <activity-scope code="4"/>
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/contact-info.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Contact Info](http://iatistandard.org/activity-standard/iati-activities/iati-activity/contact-info/)

### Location (Country/Region)

A broad declaration of the country or region which is the recipient of the activity. This is achieved using codelists reference in the 'how' section below.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        To share where the benefit of a given activity will be. Ideally specifying a country, but if that information isn't available, then specifying a region.

    .. admonition:: How?

        By using an `ISO country code <http://iatistandard.org/202/codelists/Country/>`__, or `OECD DAC CRS Region code <http://iatistandard.org/202/codelists/Region/>`__.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <activity-scope code="4"/>
       :end-before: <location>
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :header-rows: 1

        recipient-country/@code, recipient-country/@percentage
        "TZ","100"

      For Tanzania. This could also have been:

      .. csv-table::
        :header-rows: 1

        recipient-region/@code, recipient-region/@percentage
        "298","100"

      298 = 'Africa, regional' on the Region codelist (see 'how')



```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Recipient Country](http://iatistandard.org/activity-standard/iati-activities/iati-activity/recipient-country/) OR [Recipient Region](http://iatistandard.org/activity-standard/iati-activities/iati-activity/recipient-region/)


### Sub-national location

Detailed information on the on-the-ground location where activities are taking place.  Where possible, this should be to the geographic precision of second order administrative division (ADM2) - see the video in 'how' below.

> Note that the fields which have been highlighted yellow in the XML example are likely to be generic across activities, and so haven't been explored in much depth below. See the location documentation linked at the bottom of this section for more details.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        To share where the benefit or beneficiaries of a given activity will be *specifically*.

    .. admonition:: How?

       This element has a lot of flexibility, supporting multiple vocabularies and allowing a data publisher to include a lot of information.

       Due to this flexibility, there are many possibilities for how to gather location data. One fairly intuitive method is to use a tool like Geonames both to confirm an activity's location, and to record the relelvant values to specify it. Take a look at the video below:

       .. raw:: html

         <embed align="centre">
          <video width="640" height="480" controls>
            <source src="../_static/video/geonames_example.mp4" type="video/mp4">
              Your browser does not support the video tag.
          </video>
         </embed>

       **Steps:**

       * Go to the `Geonames website <http://www.geonames.org/v3/>`__
       * Search for the country, province, administrative district etc., "Ilala District" in this case.
       * Click the 'Search worldwide' button.
       * Click the dropdown menu, which reads "Found X items in this area".
       * Filter by code or class for find the 'AMD2' entries if possible (if unsucessful, try a broader region like "Dar es Salaam" and look for 'AMD1').
       * Once the small preview has come up, click on the name of the area to be taken to an overview of its boundaries

       Below is an image of the resulting pop-up window, annotated with green numbers for reference:

       .. image:: _static/images/markedup_geonames_result.png
          :width: 640

       These values can then be used to populat the following location fields:

       * (1): "ADM2" in ``feature-designation``
       * (2): "159239" in ``location-id`` and ``administrative``
       * (3): "-6.91805, 39.16254" in ``point``

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :emphasize-lines: 2, 11, 14, 15
       :start-after: <recipient-region code="298" percentage="100"/>
       :end-before: <sector vocabulary="1" code="31110">
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
       :file: docs/examples/location.csv
       :header-rows: 1


```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Location](http://iatistandard.org/activity-standard/iati-activities/iati-activity/location/)

### Budget

A given activity's budget, broken into periods of time.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        Budgets are very useful for users of IATI data, as they can indicate how much has been allocated for a given activity, and offer a good point of comparison with expenditure and disbursements (in ``transactions``).

        This is particularly true of *forward looking* budgets - those which apply to future time perious. These allow stakeholders to react to funding shortfalls or surpluses i.e. instances of budgets not being met with comparable expenditure.

    .. admonition:: How?

        Budgets only require the amount allocted, the currency, and relevant start, end, and valuation dates, and the following flags:

        * `Type <http://iatistandard.org/202/codelists/BudgetType/>`__: Whether this is the original budget (prepared when the original commitment was made) or has subsequently been revised

        * `Status <http://iatistandard.org/202/codelists/BudgetStatus/>`__: The status explains whether the budget being reported is indicative or has been formally committed. The value should appear within the BudgetStatus codelist. If the @status attribute is not present, the budget is assumed to be indicative.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: <default-tied-status code="5"/>
       :end-before: <transaction ref="1234" humanitarian="1">
       :dedent: 8

    .. container :: csv

      .. csv-table:: CSV
        :file: docs/examples/budget.csv
        :header-rows: 1
```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Budget](http://iatistandard.org/activity-standard/iati-activities/iati-activity/budget/)

### Transaction

Information on the major transactions associated with the project, particularly commitments and disbursements to partners. Transaction elements can get large and complex when compared with most other elements of an IATI activity, so the specific use-case for various aspects of the transaction model have been given their own sections below.

> Note that highlighted lines in the example XML above are the same fields as their 'default' equivalents on the activity level. Specifying them on the transaction level can 'override' the defaults, and must be done for all transactions if there are no defults speficied. Because of this they won't be shown in CSV examples or explained in detial below.

```eval_rst

.. doc-tabs::

    .. admonition:: Why?

        why text

    .. admonition:: Codelists

      .. csv-table:: CSV
         :header-rows: 1

         "Codelist", "Element", "description"
         "`Transaction Type <http://iatistandard.org/202/codelists/TransactionType/>`__", "`transaction-type/@code <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/transaction-type/>`__", "What kind of transaction? Incoming/Outgoing, Expenditure/Disbursement etc."
         "`Currency <http://iatistandard.org/202/codelists/Currency/>`__", "`value/@currency <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/value/>`__", "The currency a given transaction was made using, given in the three-letter ISO code e.g. 'GBP' for Pounds Sterling."
         "`Organisation Type <http://iatistandard.org/202/codelists/OrganisationType/>`__", "`provider-org/@type <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/provider-org/>`__", "What kind of organisation is fulfilling the role of provider or receiver in a given transaction."
         "`DAC 5 Digit Sector  <http://iatistandard.org/202/codelists/Sector/>`__", "`sector/@code <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/sector/>`__", "A transaction-level equivalent of the activity level element. The purpose or category of a given transaction."
         "`Sector Vocabulary <http://iatistandard.org/202/codelists/SectorVocabulary/>`__", "`sector/@vocabulary <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/sector/>`__", "Again, this is a corrolary of the activity-level equivalent. It can be used to specify another (or custom) vocabulary for transaction sectors"
         "`Country <http://iatistandard.org/202/codelists/Country/>`__", "`recipient-country/@code <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/recipient-country/>`__", "Two-letter ISO code denoting the country that will benefit from a given transaction."
         "`Region <http://iatistandard.org/202/codelists/Region/>`__", "`recipient-region/@code <http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/transaction/recipient-region/>`__", "An OECD DAC CRS Region code denoting the region that will benefit from a given transaction."

    .. admonition:: How?

        In the IATI Standard, Transaction elements range from small blocks with three values, to much larger pieces of data, which can convey a fair amount of the same metadata as a whole activity. Here is the smallest *valid* transaction which can be published.

        **Minimal activity elements CSV:**

        .. csv-table:: CSV
         :file: docs/examples/transaction_minimal.csv
         :header-rows: 1

        **... And as XML:**

        .. code-block:: XML

           <transaction>
               <transaction-type code="3"/>
               <transaction-date iso-date="2015-12-31"/>
               <value>257051.44</value>
           </transaction>

        Clearly, this isn't very useful or even usable, except to say that an amount *has been disbursed at a given time*. For a more comprehensive example, see the 'xml' tab.

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
       :language: xml
       :start-after: </budget>
       :end-before: <!--transaction-bookmark-1-->
       :emphasize-lines: 14, 16, 17, 18, 19, 20, 21
       :dedent: 8

    .. admonition:: csv

       Unfortunately, a full CSV representation of a transaction element would be too big to comfortably read, but the principles in the examples above can be used to encorporate whichever elements are desired above those that are minimally required.

```

IATI Docs: [IATI Activity](http://iatistandard.org/activity-standard/iati-activities/iati-activity/) | [Transaction](http://iatistandard.org/activity-standard/iati-activities/iati-activity/transaction/)


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

    .. literalinclude:: /examples/US-1-TZ-50-AID-EXAMPLE-IDENTIFIER.xml
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
