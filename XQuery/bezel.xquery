xquery version "1.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $docs := collection('file:/Users/yangxiao/Desktop/SIGN-IT-Data/?select=SIGIT*.xml;recurse=yes')

let $total := count($docs)

let $noBezel :=
  for $doc in $docs
  where not($doc//tei:decoNote[@ana="bezel"])
  return $doc

let $bezelEmpty :=
  for $doc in $docs
  let $note := $doc//tei:decoNote[@ana="bezel"]
  where exists($note) and not(normalize-space(string($note)))
  return $doc

let $bezelExecution :=
  for $doc in $docs
  let $note := $doc//tei:decoNote[@ana="bezel"]
  where $note//tei:rs[@type="execution" and contains(@ref, "lod/3.html")]
  return $doc

let $bezelOther :=
  for $doc in $docs
  let $note := $doc//tei:decoNote[@ana="bezel"]
  where exists($note)
    and normalize-space(string($note)) != ""
    and not($note//tei:rs[@type="execution" and contains(@ref, "lod/3.html")])
  return $doc

return
  <overview>
    <total>{$total}</total>
    <noBezel>{count($noBezel)}</noBezel>
    <bezelEmpty>{count($bezelEmpty)}</bezelEmpty>
    <bezelExecutionOnly>{count($bezelExecution)}</bezelExecutionOnly>
    <bezelOtherFilled>{count($bezelOther)}</bezelOtherFilled>
  </overview>
