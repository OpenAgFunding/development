import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=semicolon";

element csv {
  for $a in $agdata:activities[result]
  group by
    $ro := $a/reporting-org/@ref
  order by $ro
  return 
    for $r in $a/result
    group by 
      $rt := $r/title
    return 
      for $i in $r/indicator
      group by $ri := $i/title
      return element record {
        element reporting-org {$ro},
        element result {$rt},
        element indicator {$ri}
      }
}
