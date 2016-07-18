import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

"# activities with a DAC sector code in an activity",
iati:count-activities(
  //iati-activity[sector/@code=$agdata:dac-codes]
),
"",

"# activities with a DAC sector code in an transaction",
iati:count-activities(
  //iati-activity[transaction/sector/@code=$agdata:dac-codes]
),
"",

"# activities with a DAC sector code as value",
"(These are ignored in the reseaech for now for performance reasons)",
iati:count-activities(
  //iati-activity[data(sector)=$agdata:dac-codes]
),
"",

"# activities added to the set by using the wider-ranging 3-digit codes",
for $c in $agdata:dac3-extra-codes
return concat("DAC-code: ", $c, " adds: ",
  iati:count-activities(
    $agdata:activities[
      sector/@code=$c and
      count(sector[@code=($agdata:dac5-codes, $agdata:dac3-codes)])=0
    ]
  )
),
"",

"Sector vocabularies used (other than OECD DAC):",
sort(distinct-values(
  //sector/@vocabulary[
    not(.=("","1","2","DAC","DAC-3","OECD-DAC"))
  ]
)),
""
