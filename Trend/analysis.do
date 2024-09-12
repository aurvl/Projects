********************************************************************************
clear
insheet using an_trend_eco90s.csv, clear
*browse
describe

drop sectoral dyads dateymd typedepth typememb wtolisted

rename nombredenormes envprovs

gen lco2e = log(co2e)
gen lgdp_pcap = log(gdp_pcap)
gen lmerch = log(merch)
gen lexport = log(export)
gen lgdp = log(gdp)

label variable numberms "Nb de membres signataires"
label variable envprovs "Nb de normes"
label define nrst 1 "Nord-Nord" 2 "Nord-Sud" 3 "Sud-Sud"
label values northsouth nrst

label variable nea "Négociation environnement"
label define neal 0 "oui" 1 "non"
label values nea neal

label variable gdp "PIB moyen (million $)"
label variable lgdp "log du PIB moyen"
label variable gdp_pcap "PIP par hab moyen ($)"
label variable lgdp_pcap "log du PIB par hab"
label variable lmerch "exportations moyennes de marchandises (million $)"
label variable lmerch "log des exports de marchandises"
label variable pop "Population moyenne"
label variable co2e "emissions totales de CO2"
label variable lco2e "log des emissions de CO2"
label variable ide "IDE en % du PIB"
label variable democ "Democracy index (0 - 10)"
label variable export "exports de B&S ($)"
label variable vcc "Indice de vulnérabilité au changmt climatique"

summarize epi2020, detail
scalar med = r(p50)
di med
gen greenness = (epi2020 > med)
tabulate greenness
label variable greenness "Indicatrice de performance environ."
label define greennessl 1 "green" 0 "brown"
label values greenness greennessl

label variable iae "Indicateur d'attention environmtal"
describe
*asdoc describe, save(describe.doc) replace

tabulate iae
*asdoc tabulate iae, save(tabulate_iae.doc) replace

*asdoc su northsouth numberms democ envprovs iae lco2e lgdp_pcap lmerch, save(summarize.doc) replace
sort northsouth
*asdoc by northsouth: su numberms democ envprovs iae lco2e lgdp_pcap lmerch, save(summarizebyNS.doc) replace

*asdoc tabulate nea, save(tab_nea) replace
*asdoc tabulate greenness, save(tab_greenness) replace

			 
* Eco et devp
*asdoc ologit iae numberms lgdp_pcap lmerch, save(ecoreg.doc) replace
est store tot1
	* nord-sud
	by northsouth: ologit iae numberms lgdp_pcap lmerch if northsouth == 2
	est store ns1
	* Régression pour sud-sud
	by northsouth: ologit iae numberms lgdp_pcap lmerch if northsouth == 3
	est store ss1

	*asdoc esttab tot1 ns1 ss1, save(r3.doc) replace

*esttab tot ns ss using results.rtf, wide label

* Environ
asdoc ologit iae lco2e greenness vcc, save(envreg.doc) replace
est store tot1
	* nord-sud
	asdoc by northsouth: ologit iae lco2e greenness vcc if northsouth == 2, save(r4.doc) replace
	est store ns1
	* Régression pour sud-sud
	asdoc by northsouth: ologit iae lco2e greenness vcc if northsouth == 3, save(r5.doc) replace
	est store ss1

	asdoc esttab tot1 ns1 ss1, save(r6.doc) replace

* Democ
asdoc ologit iae democ, save(democreg.doc) replace
