import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

"# activities with <policy-marker>s",
iati:count-activities(
  $agdata:activities[
    policy-marker
  ]
),
"",

"# activities with <policy-marker>s and no Ag sector codes",
iati:count-activities(
  $agdata:activities[
    policy-marker
    and count(sector[@code=$agdata:dac-codes])=0
  ]
),
"",

"# Activities per policy marker without an Ag sector code",
let $a := $agdata:activities[
  policy-marker
  and count(sector[@code=$agdata:dac-codes])=0
]

for $p in distinct-values($a/policy-marker/@code)
return concat("policy marker ", $p, ": ",
  iati:count-activities(
    $a[
      policy-marker[@code=$p]
    ]
  )
),
"",

"# activities with <country-budget-items>",
iati:count-activities(
  $agdata:activities[
    country-budget-items
  ]
),
"",

"# activities with <country-budget-items> and no Ag sector codes",
iati:count-activities(
  $agdata:activities[
    country-budget-items
    and count(sector[@code=$agdata:dac-codes])=0
    and count(transaction/sector[@code=$agdata:dac-codes])=0
  ]
),
""
