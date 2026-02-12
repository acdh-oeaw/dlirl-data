xquery version "3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $lemmata-yalqut := collection("../dlys")/tei:TEI/tei:text/tei:body/tei:entry
let $lemmata-genr := collection("../dlgenr")/tei:TEI/tei:text/tei:body/tei:entry
for $lemma in $lemmata-yalqut union $lemmata-genr
    let $href := if (contains($lemma/@xml:id,'dlgenr')) then concat(substring-before($lemma/@xml:id,'-dlgenr'),'.html')
                 else concat($lemma/@xml:id,'.html')
    let $greek-lemma := if (($lemma/@source = 'Yalkut Shimoni') and exists($lemma/tei:sense[1]/tei:cit[@type = 'translationEquivalent'][1])) then concat($lemma/tei:sense[1]/tei:cit[@type = 'translationEquivalent'][1]/tei:quote/text(),' (Yalq)')
                         else $lemma/tei:sense[1]/tei:cit[@type = 'translationEquivalent'][1]/tei:quote/text()
    where not(empty($greek-lemma))
    order by $greek-lemma
    return <div class="list-of-lemmata-lemma"><a href="{$href}">{$greek-lemma}</a></div>