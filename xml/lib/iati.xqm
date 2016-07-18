xquery version "3.1";
module namespace iati = "iatime:lib";

declare function iati:count-activities($activities as node()*) as xs:integer
{
  count(distinct-values(data($activities/iati-identifier)))
};

declare function iati:selected-activity-info($activities as node()*, $fields as xs:string*) as node()*
{
  let $f := if (count($fields)>0)
    then $fields
    else ("iati-identifier","reporting-org")
    
  for $a in $activities
  return element {name($a)} {
    $a/@*,
    $a/*[name(.)=$f]
  }
};