import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

"Reporting organisations with results",
for $o in $agdata:activities[result]
group by $ro := $o/reporting-org/@ref
order by $ro
return concat(
  $ro,
  ": ",
  data(($o/reporting-org)[1])
)
