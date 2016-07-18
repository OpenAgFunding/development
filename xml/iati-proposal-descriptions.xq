import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

for $dt in ("2","3","4")
return (
  concat("#activities with description type ", $dt, ":"),
  
  for $a in $agdata:activities[description/@type=$dt]
  group by $ro := $a/reporting-org/@ref
  order by count($a) descending
  return concat(
    $ro,
    ": ",
    iati:count-activities($a)
  ),
  ""
)
