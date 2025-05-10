xquery version "3.1";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $docs := collection('file:/Users/yangxiao/Desktop/SIGN-IT-Data/?select=*.xml;recurse=yes')

let $terms := 
  for $doc in $docs
  return $doc//tei:term[matches(@key, '#textType_\d+')]

let $grouped := 
  for $k in distinct-values($terms/@key)
  let $count := count($terms[@key = $k])
  order by $count descending
  return <type key="{$k}" count="{$count}"/>

return <result>{$grouped}</result>
