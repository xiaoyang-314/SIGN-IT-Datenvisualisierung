xquery version "3.1";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $docs := collection('file:/Users/yangxiao/Desktop/SIGN-IT-Data/?select=SIGIT*.xml')

let $docs := 
  for $d in collection('file:/Users/yangxiao/Desktop/SIGN-IT-Data/?select=SIGIT*.xml')
  order by tokenize(base-uri($d), "/")[last()]
  return $d

for $doc in $docs
let $fileName := tokenize(base-uri($doc), "/")[last()]

let $settlement := $doc//tei:msIdentifier/tei:settlement
let $repository := $doc//tei:msIdentifier/tei:repository
let $locationGeo := $settlement/tei:geo

let $findspot := $doc//tei:history//tei:provenance[@type="found"]/tei:placeName[1]
let $findspotGeo := $findspot/tei:geo

return
  <entry>
    <file>{$fileName}</file>
    <currentLocation>
      <name>{normalize-space(replace(string-join(($settlement, $repository), ", "), '[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+', ''))}</name>
      <geo>{normalize-space($locationGeo)}</geo>
    </currentLocation>
    <findspot>
      <name>{normalize-space(replace(string($findspot), '[0-9]+\.[0-9]+\s+[0-9]+\.[0-9]+', ''))}</name>
      <geo>{normalize-space($findspotGeo)}</geo>
    </findspot>
  </entry>
