# Extensions

## IATI Classification Tag

In order to allow for the most useful agricultural investment data, the Open Ag Funding Partnership has consulted with the IATI community about additions which could me bade to the next version of the IATI standard (version 2.03).

The primary addition is a place to declare classifications which _aren't_ statistical. For instance, if a donor is sure that their project concerns both irrigation and livestock, but doesn't want to split the transactions based on those groups.

This addition has been accepted and taken forward by the IATI secretariat for inclusion in the next version. Discussion and subsequent consensus can be found [here](discuss_link).

In sort, this new element looks a lot like the existing [sector](http://iatistandard.org/202/activity-standard/iati-activities/iati-activity/sector/) element, but without a percentage, so it would look something like this:

```eval_rst
  .. code-block:: xml

    <tag vocabulary="99" vocabulary-uri="http://aims.fao.org/standards/agrovoc/functionalities/search" code="c_4397">
        <narrative @xml:lang="en">Livestock</narrative>
    </tag>


```

This is excellent news for prospective users of this is excellent news for prospective users of the [Auto Classifier](http://pndblog.typepad.com/pndblog/2017/08/two-new-data-tools-for-the-open-ag-sector.html) currently under development, but there's an issue for early adopters: the new version of IATI might not be released for a while, but tool makers want to get going!

This is where extensions come in. IATI XML based standard allows publishers to declare their own extensions using a [namespace extension](http://iatistandard.org/202/namespaces-extensions/).
