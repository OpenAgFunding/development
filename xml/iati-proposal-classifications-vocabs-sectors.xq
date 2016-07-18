import module namespace iati = "iatime:lib"
  at "lib/iati.xqm";
import module namespace agdata = "openag:agdata"
  at "agdata.xqm";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "csv";
declare option output:csv "header=yes, separator=semicolon";

element csv {
  for $sector in //sector[
    @vocabulary
    and not(@vocabulary=("","1","2","DAC","DAC-3","OECD-DAC"))
  ]
  group by 
    $vv := $sector/@vocabulary,
    $vu := $sector/@vocabulary-uri,
    $vc := $sector/@code
  order by $vv, $vu, $vc
  return
    for $s in distinct-values($sector)
(:    return string-join(($vv, $vu, $vc, $s), ";") :)
      return element record {
        element vocabulary {$vv},
        element uri {$vu},
        element code {$vc},
        element narrative {$s}
      }  
}