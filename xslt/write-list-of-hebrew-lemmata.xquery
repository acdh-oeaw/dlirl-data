xquery version "3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $lemma in collection("../dlgenr")/tei:TEI/tei:text/tei:body/tei:entry
    let $href := concat($lemma/@xml:id,'.html')
    let $hebrew-lemma :=  $lemma/tei:form[@type = 'lemma']/tei:orth[@type = 'lemma']/text()
    order by $hebrew-lemma
    return <div class="list-of-lemmata-lemma"><a href="{$href}">{$hebrew-lemma}</a></div>