xquery version "3.1";
module namespace agdata = "openag:agdata";

(:~
: DAC 5-digit codes for Ag from https://docs.google.com/spreadsheets/d/1IstAeB8YGFKdjYp-i81Fg-Rz26yUHvU86Sxl7JvwgZo/edit#gid=1928198369
:)
declare variable $agdata:dac5-codes := (
  "12240","14040",
  "23070","23270",
  "31110","31120","31130","31140","31150","31161","31162","31163","31164","31165","31166","31181","31182","31191","31192","31193","31194","31195",
  "31210","31220","31261","31281","31282","31291",
  "31310","31320","31330","31381","31382","31391",
  "32161","32162","32165",
  "43040",
  "52010",
  "72040"
  );

(:~
: DAC 3-digit codes for Ag
:)
declare variable $agdata:dac3-codes := (
  "311", "312", "313"
  );

(:~
: DAC 3-digit codes that include some Ag subcategories
:)
declare variable $agdata:dac3-extra-codes := (
  "321", (: covers Industry, more than just agro/forest industry :)
  "430", (: covers Other multisector, more than just agro/forest/fishery :)
  "520", (: currently only contains 52010 :)
  "720"  (: covers Emergency response, more than food aid :)
  );

declare variable $agdata:dac-codes := (
  $agdata:dac5-codes,
  $agdata:dac3-codes,
  $agdata:dac3-extra-codes
);

(:~
All Ag-related activities with a sector code at activity or transaction level.
:)
declare variable $agdata:activities := //iati-activity
[sector/@code=$agdata:dac-codes
or transaction/sector/@code=$agdata:dac-codes
(: or data(sector)=$agdata:dac-codes :)(: disabled for perfomance reasons :)
];
