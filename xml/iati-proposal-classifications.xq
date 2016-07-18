import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

"# Open Ag activities: ", 
count($agdata:activities),
"",

"# Open Ag activities without an identifier: ", 
count($agdata:activities[count(iati-identifier)=0]),
"",

"# distinct IATI activity identifiers",
iati:count-activities(
  $agdata:activities
),
"",

"# activities with a single Ag <sector>",
iati:count-activities(
  $agdata:activities[
    count(sector[@code=$agdata:dac-codes])=1
    and count(sector)=1
  ]
),
"",

"# activities with multiple <sector>s",
iati:count-activities(
  $agdata:activities[
    count(sector)>1
  ]
),
"",

"# activities with a single Ag <sector> and one or more other <sector>s",
iati:count-activities(
  $agdata:activities[
    count(sector[@code=$agdata:dac-codes])=1
    and count(sector[not(@code=$agdata:dac-codes)])>0
  ]
),
"",

"# activities with multiple Ag <sector>s but no other sectors",
iati:count-activities(
  $agdata:activities[
    count(sector[@code=$agdata:dac-codes])>1
    and count(sector[not(@code=$agdata:dac-codes)])=0
  ]
),
"",

"# activities with multiple Ag <sector>s and other <sector>s",
iati:count-activities(
  $agdata:activities[
    count(sector[@code=$agdata:dac-codes])>1
    and count(sector[not(@code=$agdata:dac-codes)])>0
  ]
),
"",

"# activities with multiple <sector>s and missing percentages or not adding up to 100% (non-unique identifier)",
for $v in distinct-values($agdata:activities/sector/@vocabulary)
return concat("vocabulary: ", $v, ": ",
  iati:count-activities(
    $agdata:activities[
      count(sector[@vocabulary=$v])>1
      and (
        count(sector[@vocabulary=$v]/@percentage) != count(sector[@vocabulary=$v])
        or sum(sector[@vocabulary=$v]/@percentage) != 100
      )
    ]
  )
),
concat("no vocabulary specified: ",
  iati:count-activities(
    $agdata:activities[
      count(sector[not(@vocabulary)])>1
      and (
        count(sector[not(@vocabulary)]/@percentage) != count(sector[not(@vocabulary)])
        or sum(sector[not(@vocabulary)]/@percentage) != 100
      )
    ]
  )
),
"",

"# activities with multiple <sector> @vocabularies",
iati:count-activities(
  $agdata:activities[
    count(distinct-values(sector/@vocabulary))>1
  ]
),
"",

"# activities with <sector> at both <activity> and <transaction> level",
iati:count-activities(
  $agdata:activities[
    sector and transaction/sector
  ]
),
"",

"Publishers using sector codes at both activity and transaction level",
sort(distinct-values($agdata:activities[sector and transaction/sector]/reporting-org/@ref)),
""
