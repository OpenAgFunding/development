# Extensions

The `tag` extension allows you to provide multiple classification of an aid activity to support **discovery** of relevant activities through search and browse interfaces. 

It is based on the IATI [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element, but differs in that it _cannot_ be used to express statistical information about the share of a project budget or spend allocated to the topic of the tag. 

### What is it?

This new element looks a lot like the existing [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element, but without a percentage:

```xml
<openag:tag vocabulary="99" vocabulary-uri="http://aims.fao.org/aos/agrovoc/" code="c_4397">
    <narrative xml:lang="en">Livestock</narrative>
</openag:tag>
```

> NB: the 'openag:' at the start of the element is because this element is currently available via an extension. If tag is adopted as a core part of IATI 2.03 the element name will simply be `<tag>`, and the namespace declaration detailed below can be dropped.

**Values**:

* the `@code` attribute will change use by use, but must always be included.
* the `@vocabulary` attribute is '99' to specify that it's a custom vocabulary (as opposed to one of IATI's embedded ones).
* the `@vocabulary-uri` should always be "http://aims.fao.org/aos/agrovoc/" for OpenAg early adopters, as they will be using the AGROVOC vocabulary, but in principle this extension can be used with any codelist.
* the `<narrative>` should be included to show users what the code means, but will change depending on the `@code` attribute.

### How to include it?

At the top of the `<iati-activities>` if using throughout a file, or at the top of any `<iati-activity>` element which uses the extension, a user should add a `@xmlns:openag` attribute which equals the URL of this extension page.

Furthermore, the `tag` element above should appear at the **end** of an IATI activity with `openag:tag` as the element name.

Here is a worked example

```xml
<iati-activities xmlns:openag="http://openagfunding.readthedocs.io/en/latest/extensions/" version="2.02">
<iati-activity>
  <!-- .................. -->
  <!-- the rest of the    -->
  <!-- activity: sectors, -->
  <!-- transactions, etc  -->
  <!-- .................. -->
  <openag:tag vocabulary="99" vocabulary-uri="http://aims.fao.org/aos/agrovoc/" code="c_4397">
      <narrative xml:lang="en">Livestock</narrative>
  </openag:tag>
  </iati-activity>
</iati-activities>
```

> NB: there can be more than one `<openag:tag>` element per activity.

If you have any questions about implementing this extension, don't hesitate to [get in touch](http://openagfunding.readthedocs.io/en/latest/contact/).

### Using tagged data

If you are building a tool that uses IATI data, consider adding support for the `tag` element. Below are some tips for handling tag data:

**When querying for `tag` data** consider establishing a query that will search for both namespaced, and namespace free, data. This will ensure that your tool is 'future proof' for IATI 2.03, but also can accommodate data that was published before `tag` was adopted in the core standard. 

For example, the xpath below should fetch both extension and core `tag` data:

```xpath
/iati-activities/iati-activity/openag:tag | /iati-activities/iati-activity/tag
```

**Be vocabulary aware**. Some tag vocabularies, like AgroVoc, may have a hierarchy to their classifications. You can use this to (a) provide an improved interface for users to select the tags they want to search on; (b) search on all values from a 'child' category when the parent category is selected.

Be careful not to mix information from different vocabularies together when displaying tags to users, unless this is appropriate in your interface.

### History and future: towards inclusion in 2.03

In order to allow for the most useful agricultural investment data, the Open Ag Funding Partnership consulted with the IATI community about ways to include additional classifications against established vocabularies. This led to proposals for an addition of `tag` to the next version of the IATI standard (version 2.03).

The primary need met by the `tag` element is to declare classifications which _aren't_ statistical. For instance, if a donor is sure that their project concerns both irrigation and livestock, but doesn't want to split the budget based on those groups (as they would have to in the [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element).

This addition has been accepted and taken forward by the IATI secretariat for inclusion in the next version. Discussion and subsequent consensus can be found [here](discuss_link).

However, the next new version of IATI might not be released for a while, but users want to get going!  This is where extensions come in. IATI XML based standard allows publishers to declare their own extensions using a [namespace extension](http://iatistandard.org/202/namespaces-extensions/).


