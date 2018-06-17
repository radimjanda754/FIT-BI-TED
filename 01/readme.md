Zadání
Výrobce přenosných počítačů potřebuje analyzovat výsledky měření zatížení a teploty procesoru a rychlost ventilátoru. Důvodem je zjištění, zda automatické řízení otáček ventilátoru dostatečně reaguje na změny zátěže, aby bylo vyloučeno přehřívání. Pro zjednodušení analýzy měření si výrobce vyžádal generátor grafů ze získaných dat. Vaším úkolem je implementovat tuto vizualizaci tak, aby bylo možné ji kdykoli po opakovaném měření vygenerovat znovu. Není nutné vizualizovat všechny datové položky, výrobce si vyžádal pouze část (viz specifikace níže). Vytvořte skript (obyčejný textový soubor obsahující posloupnost příkazů) pro předzpracování získaných záznamů měření a dále skript pro vygenerování grafu z těchto Vámi předzpracovaných dat tak, aby byly splněny všechny níže uvedené požadavky. Podmínkou je, aby data byla předzpracována skriptem pro bash (s využitím standardních unixových textových filtrů) a aby byl graf generován skriptem pro Gnuplot.

Poznámka: data použitá v této úloze nemají žádnou souvislost se skutečným výrobcem počítačů. Jakákoli podobnost se skutečností je čistě náhodná a neúmyslná.

Specifikace
Vstupní data
Úkolem je zpracovat konkrétně vzorová data, která si z této stránky můžete stáhnout (je nutné je nejprve extrahovat z archivu)

Vstupem je sada textových souborů uložených v kódování UTF-8 s unixovými konci řádků. Všechny vznikly jako záznamy stejného měření, tedy je dané, že ukládání záznamů do všech souborů začalo i skončilo ve stejný okamžik a probíhalo se stejným krokem (časovým rozestupem) a ve shodném pořadí. Každý soubor (s výjimkou jednoho) obsahuje pro každý záznam čas měření. Čas má následující formát (standardní výstup linuxového příkazu date v českém prostředí): zkratka_dne_v_týdnu_česky zkratka_měsíce_česky den_v_měsíci hodina:minuta:sekunda časová_zóna rok. Obsah souborů je následující:

data_temp
každý řádek obsahuje čas měření ve výše uvedeném formátu
data_temp.txt
každý řádek obsahuje naměřenou teplotu ve stupních Celsia v čase uvedeném v souboru data_temp na řádku stejného pořadí; každý řádek je ve formátu: temperatures: tabulátor teplota_CPU 0 0 0 0 0 0 0
data_load.txt
obsahuje 2 vždy po sobě následující typy řádků:
čas měření ve výše uvedeném formátu
průměrná zátěž systému (load average) v následujícím formátu (standardní výstup linuxového příkazu uptime v českém prostředí – desetinná čísla jsou uvedena s desetinnou čárkou, nikoli s tečkou; zároveň jsou tato čísla oddělená čárkou a mezerou): mezera čas_měření up  čas_běhu_počítače,  počet_uživatelů users,  load average: průměrná_zátěž_za_minutu, průměrná_zátěž_za_5_minut, průměrná_zátěž_za_15_minut
data_fan.txt
obsahuje 4 vždy po sobě následující typy řádků:
čas měření ve výše uvedeném formátu
stav ventilátoru (enabled nebo disabled) ve formátu: status: tabulátor tabulátor stav
počet otáček ventilátoru za minutu (celé číslo) ve formátu: speed: tabulátor tabulátor počet
level: tabulátor tabulátor auto
Výstup
Předzpracování dat
Výše uvedené soubory je možné předzpracovat tak, aby bylo možné je snadněji využít v programu Gnuplot. To je možné výhradně skriptem volajícím standardní unixové textové filtry. Skript musí být intepretovatelný pomocí linuxového GNU bash verze 4.2.45, textové filtry se předpokládají linuxové ze sady GNU coreutils verze 8.21 (a starší), případně GNU Awk verze 4.0.2 (a starší).

Vytvořený skript musí být pojmenovaný parser.sh a smí vytvářet a číst soubory výhradně v aktuálním adresáři. Předzpracovaná data, tedy vstup pro Gnuplot, bude skript ukládat do souboru (souborů) v aktuálním adresáři; pojmenování souborů je libovolné s tím, že jakýkoli soubor, který tento bashový skript vytvoří (včetně výsledného s předzpracovanými daty), se nesmí jmenovat parser.sh ani data.txt. Skript by neměl generovat nic na standardní ani chybový výstup.

Výsledný obrázek
Graf bude vygenerovaný na základě skriptu interpretovaného programem Gnuplot verze 4.6. Soubor se skriptem musí být pojmenovaný gnuplot.gp. Tento skript bude načítat data průběhů ze souboru, který odevzdáte a zároveň který je generovaný bashovým skriptem pro předzpracování dat (viz výše) – jeho pojmenování je tedy na Vás (a musí souhlasit s tím, co odevzdáte a co generuje Váš bashový skript).

Je nutné přesně dodržet všechny pokyny a požadavky. Jakákoli odlišnost, byť malá, může mít za následek odmítnutí odevzdaného řešení. Obrázek vygenerovaný odevzdaným skriptem musí být naprosto shodný s příkladovým při zpracování vzorových dat (až na vynechání některých výsledků měření – viz níže). Nenastavujte písmo, žádnou velikost, rozměr, zvětšení, posun, barvu ani rotaci, pokud nebude v pokynech uvedeno jinak. Vzorový obrázek byl vygenerován s tímto nastavením:

set terminal png nocrop medium butt size 640,480
Toto nastavení je pouze pro Váš náhled, hodnocení je na něm nezávislé. Vezměte tedy v potaz, že s odlišným nastavením výstupu (také v závislosti na Vaší instalaci) můžete získat odlišný obrázek. Takovéto případné odlišnosti (způsobené čistě tímto nastavením) jsou pro hodnocení nepodstatné, tedy pokud jste správně dodrželi všechny pokyny.
Důležité: stejně jako písmo a další implicitní vizuální atributy, nenastavujte ani terminal (formát výstupu), ani výstupní soubor (volání set output) – žádná z těchto nastavení nesmí být ve skriptu, který odevzdáváte na Progtest. Rovněž ve skriptu pro Gnuplot nepřistupujte k voláním shellu nebo spouštění externích programů. Uděláte-li cokoli z předchozího, způsobí to neúspěch odevzdání Vašeho skriptu na Progtest.

Vizualizace sestává ze dvou grafů umístěných vedle sebe. Levý graf zobrazuje celkový přehled: průběh teploty, průměrné zátěže systému a rychlosti ventilátoru v čase. Pravý graf pak zobrazuje průběh zátěže a teploty. Pro přehlednost oba grafy zobrazují pouze každé 3. měření (jako první bude uvažováno právě 3. měření). Příklad: řekněme, že měření začíná v 00:00:01 a je prováděno v sekundových intervalech. Pak jako první zahrňte měření konané v sekundě 3 (nikoli v sekundě 1).

Přehled
Tento graf má počátek nastavený na relativní pozici 0; 0, jeho relativní šířka je 50 % a výška 100 %. Jeho označení Overview je umístěno nahoře. Osa y je neoznačená, bez značek i popisků hodnot. Osa x je označena řetězcem Timestamp of measurement (dole). Pod grafem je umístěná legenda, která je nadepsaná Legend a v souladu se vzorovým obrázkem orámovaná s okrajem (odsazením) 1.

Hodnoty pro osu x jsou definované časem měření. Značky pro tuto osu jsou zrcadlené (na spodní i horní ose x na stejných pozicích), hodnoty jsou zobrazené pouze pod spodní osou a rotované o 90 stupňů. Popisky hodnot jsou ve formátu hodina:minuta:sekunda a odpovídají těm načteným ze vstupních dat (nápověda: tyto popisky lze nastavit příkazem set xtics format, příklad nastavení načítání data a času ze vstupu najdete na EDUXu). Rozsah hodnot na ose x nenastavujte (určí se automaticky).

Rozsahy pro osu y nijak nenastavujte (ponechte jejich automatické určení).

V grafu jsou zobrazené 3 průběhy, kterým odpovídají položky v legendě – se stejnými názvy, jako jsou uvedené níže. Průběhy jsou zobrazené jako úsečky o automaticky přiřazených barvách a implicitní tloušťce čáry. Průběhy a odpovídající položky legendy by měly být z dat vykreslovány v tomto pořadí:

teplota v Kelvinech (ve vstupních datech je ve stupních Celsia, rozdíl je 273,15), implicitní tloušťka a barva; název temperature
průměrná zátěž systému za minutu, implicitní tloušťka a barva; název load average per minute
počet otáček ventilátoru, implicitní tloušťka a barva; název CPU fan speed
Zátěž a teplota
Počátek je nastavený na relativní souřadnice 0,5; 0. Výška a šířka jsou shodné s přehledovým grafem. Osu x a legendu má nastavené shodně s přehledovým grafem. Levá osa y má zobrazené značky a popisky hodnot (nezrcadlené na pravou osu a s automatickým rozsahem) a popisek temperature [K]. Pravá osa y má zobrazené značky a popisky hodnot (nezrcadlené na levou osu a s automatickým rozsahem) a popisek load.

Graf sestává z dvou průběhů, kterým odpovídají položky v legendě – se stejnými názvy, jako jsou uvedené níže. Využívají dvou souřadných systémů (viz níže). Průběhy jsou zobrazené jako úsečky zakončené body o automaticky přiřazených barvách a tvarech a implicitní tloušťce čáry. Průběhy a odpovídající položky legendy by měly být z dat vykreslovány v tomto pořadí:

teplota v Kelvinech (ve vstupních datech je ve stupních Celsia), implicitní tloušťka a barva, levá osa y; název temperature
průměrná zátěž systému za minutu, implicitní tloušťka a barva, pravá osa y; název load average per minute
Nemažte plochu použitou pro graf, tedy nevolejte příkaz clear.
Odevzdání
Na Progtest odevzdejte archiv ve formátu ZIP (respektujte formát a nepokoušejte se odevzdávat např. RAR) pojmenovaný váš_ČVUT_login.zip (tedy pro uživate guthondr to bude guthondr.zip) bez jakýchkoli adresářů obsahující vše, co je potřeba pro vygenerování vizualizace ze zadaných dat, tedy skript pro předzpracování dat, výsledná předzpracovaná data a skript pro Gnuplot, který z odevzdaných předzpracovaných dat vygeneruje vizualizaci. Neodevzdávejte zde stažené vstupní datové soubory. Archiv musí mít následující obsah:

skript pro bash pro předzpracování dat pojmenovaný parser.sh (musí mít konce řádků v unixovém formátu)
skript pro Gnuplot pro vygenerování grafu pojmenovaný gnuplot.gp (musí mít konce řádků v unixovém formátu)
soubor(y) s daty, které budou přímo využity skriptem pro Gnuplot jako zdrojová data; tyto soubory mohou být pojmenované libovolně (pozor na velikost písmen), avšak nesmí se jmenovat data.txt; zároveň jde o soubory, které jsou přímo generované Vaším parser.sh (bez nutnosti přesměrování výstupu)
Upozornění: grafický nástroj na tvorbu ZIP archivů na systému Mac OS přidává adresář __MACOSX (v tomto nástroji neviditelný), který způsobuje odmítnutí Vašeho řešení na Progtestu. Vytvářejte proto archiv jiným způsobem, např. na příkazové řádce.

Hodnocení
Bonus (tj. 50 % bodů navíc) lze získat při odevzdání do 2 týdnů od otevření úlohy, tj. do 02.05.2014. Pozdní odevzdání je penalizováno zpočátku ztrátou 30 % bodů, tato penalizace se však postupně zvyšuje s přibližujícím se koncem období pro pozdní odevzdání.

Pro vzorová data vypadá správný obrázek vygenerovaný programem Gnuplot:

Vzorový graf