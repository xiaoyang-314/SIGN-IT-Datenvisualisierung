xquery version "3.1";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $uris := uri-collection('file:/Users/yangxiao/Desktop/SIGN-IT-Data/?select=SIGIT*.xml;recurse=yes')

let $allWidths :=
  for $uri in $uris
  let $doc := doc($uri)
  let $file := tokenize($uri, "/")[last()]
  let $nodes := $doc//tei:dimensions[@type="lamina"][@subtype="profile_external"]/tei:width[@unit="cm"]
  return
    for $w in $nodes
    return
      if (string-length(normalize-space(string($w))) > 0)
      then <row><file>{$file}</file><width>{xs:decimal($w)}</width></row>
      else <row><file>{$file}</file><width/></row>

let $nonEmpty := $allWidths[width != ""]
let $empty := $allWidths[string-length(normalize-space(string(width))) = 0]

let $values := for $r in $nonEmpty return xs:decimal($r/width)

let $max := max($values)
let $min := min($values)
let $avg := avg($values)

let $modes :=
  for $v in distinct-values($values)
  let $count := count($values[. = $v])
  order by $count descending
  return <mode value="{$v}" count="{$count}"/>

let $topMode := $modes[1]

let $sorted := for $r in $nonEmpty order by xs:decimal($r/width) return $r

return
  <result>
    <summary>
      <total>{count($allWidths)}</total>
      <leer>{count($empty)}</leer>
      <gefüllt>{count($nonEmpty)}</gefüllt>
      <min>{$min}</min>
      <max>{$max}</max>
      <avg>{$avg}</avg>
      <mode>{$topMode/@value/string()}</mode>
    </summary>
    <rows>
      {$sorted}
    </rows>
  </result>
