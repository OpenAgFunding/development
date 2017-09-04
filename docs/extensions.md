# Extensions

## IATI Classification Tag

In order to allow for the most useful agricultural investment data, the Open Ag Funding Partnership has consulted with the IATI community about additions which could me bade to the next version of the IATI standard (version 2.03).

The primary addition is a place to declare classifications which _aren't_ statistical. For instance, if a donor is sure that their project concerns both irrigation and livestock, but doesn't want to split the transactions based on those groups (as they would have to in the [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element).

This addition has been accepted and taken forward by the IATI secretariat for inclusion in the next version. Discussion and subsequent consensus can be found [here](discuss_link).

This is excellent news for prospective users of  the [Auto Classifier](http://pndblog.typepad.com/pndblog/2017/08/two-new-data-tools-for-the-open-ag-sector.html) currently under development within the Open Ag Partnership, but there's an issue for early adopters: the new version of IATI might not be released for a while, but users want to get going!

This is where extensions come in. IATI XML based standard allows publishers to declare their own extensions using a [namespace extension](http://iatistandard.org/202/namespaces-extensions/).

### What is it?

This new element looks a lot like the existing [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element, but without a percentage, so it would look something like this:

```xml
<openag:tag vocabulary="99" vocabulary-uri="http://aims.fao.org/aos/agrovoc/" code="c_4397">
    <narrative @xml:lang="en">Livestock</narrative>
</openag:tag>
```

> NB: in IATI 2.03 there wouldn't be the 'openag:' at the start

**Values**:
* the `@code` attribute will change use by use, but must always be included.
* the `@vocabulary` attribute is '99' to specify that it's a custom vocabulary (as opposed to one of IATI's embedded ones).
* the `@vocabulary-uri` should always be "http://aims.fao.org/aos/agrovoc/" for OpenAg early adopters, as they will be using the AGROVOC vocabulary, but in principle this can be used with any codelist.
* the `<narrative>` should be included to show users what the code means, but will changed depending on the `@code` attribute.

### How to include it?

Either at the top of the `<iati-activities>` if usuing throughout a file, or at the top of any `<iati-activity>` element which uses the extension, a user should add a `@xmlns:openag` attribute which equals the URL of this extension page.

Furthermore, the element mentioned above should appear at the **bottom** of an IATI activity file with `openag:tag` as the element name.

Here is a worked example

```xml
<iati-activities xmlns:openag = "http://openagfunding.readthedocs.io/en/latest/extensions/#iati-classification-tag" version="2.02">
  <!-- .................. -->
  <!-- the rest of the    -->
  <!-- activity: sectors, -->
  <!-- transactions, etc  -->
  <!-- .................. -->
  <openag:tag vocabulary="99" vocabulary-uri="http://aims.fao.org/aos/agrovoc/" code="c_4397">
      <narrative @xml:lang="en">Livestock</narrative>
  </openag:tag>
</iati-activites>
```

> NB: there can be more than one `<openag:tag>` element per activity!
