xquery version "3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $lemmata-yalqut := collection("../dlys")/tei:TEI/tei:text/tei:body/tei:entry
let $lemmata-genr := collection("../dlgenr")/tei:TEI/tei:text/tei:body/tei:entry
for $lemma in $lemmata-yalqut union $lemmata-genr
    let $href := if (contains($lemma/@xml:id,'dlgenr')) then concat(substring-before($lemma/@xml:id,'-dlgenr'),'.html')
                 else concat($lemma/@xml:id,'.html')
    let $hebrew-lemma := if ($lemma/@source = 'Yalkut Shimoni') then concat($lemma/tei:form[@type = 'lemma']/tei:orth[@type = 'lemma']/text(),' (Yalq)')
                         else $lemma/tei:form[@type = 'lemma']/tei:orth[@type = 'lemma']/text()
    order by $hebrew-lemma
    return <div class="list-of-lemmata-lemma"><a href="{$href}">{$hebrew-lemma}</a></div>