xquery version "3.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

for $lemma in collection("../dlys")/tei:TEI/tei:text/tei:body/tei:entry
    let $href := concat(substring-before($lemma/@xml:id,'-ys'),'-ys.html')
    let $greek-lemmata :=  $lemma/tei:sense/tei:cit[@type = 'translationEquivalent']/tei:quote/text()
    order by $greek-lemmata[1]
    where not(empty($greek-lemmata))
    return
        for $greek-lemma in $greek-lemmata
            return <div class="list-of-lemmata-lemma-greek"><a href="{$href}">{$greek-lemma}</a> (Yalq)</div>