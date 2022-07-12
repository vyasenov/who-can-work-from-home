* SAVE TELEWORKABILITY MEASURES FOR ONET SOC OCCUPATIONS

clear all
set more off
cd "/Users/yasenov/Dropbox (IPL)/wfh/data"

**************************
**** ONETSOC 8-DIGIT *****
**************************

use "onet/onet.dta"

keep onetsoccode title teleworkable teleworkable_tercile teleworkable_cont

rename onetsoccode onetsoc
rename titl onetsoc_title

desc
sum
tab teleworkable, m
assert teleworkable != .

isid onetsoc

list in 1/20
save "teleworkable_onetsoc.dta", replace

*******************
*** SOC 6-DIGIT ***
*******************

rename onetsoc ONETSOC2010Code

merge 1:1 ONETSOC2010Code using "xwalks/onet_soc_2010_xwalk.dta", keep(1 3)
assert _merge == 3
drop _merge

assert onetsoc_title == ONETSOC2010Title
drop onetsoc_title

rename ONETSOC2010Code onetsoc
rename SOCCode soc
rename ONETSOC2010Title onetsoc_title
rename SOCT soc_title

order onetsoc soc *itle teleworkable

assert teleworkable != .
tab teleworkable, m

unique onetsoc
unique soc

isid onetsoc
isid onetsoc_title

desc
sum

collapse teleworkable teleworkable_tercile teleworkable_cont, by(soc soc_title)
tab teleworkable, m

replace teleworkable = round(teleworkable)
replace teleworkable_tercile = round(teleworkable_tercile)
tab teleworkable, m
tab teleworkable_tercile, m

replace soc = substr(soc, 1,2) + substr(soc, 4,4)
isid soc

assert teleworkable != .

sum
desc

list in 1/20
save "teleworkable_soc.dta", replace

*******************
*** SOC 5-DIGIT ***
*******************

preserve
gen soc5 = substr(soc, 1, 5)
unique soc
unique soc5

collapse teleworkable teleworkable_tercile teleworkable_cont, by(soc5)

tab teleworkable, m
tab teleworkable_tercile, m

replace teleworkable = round(teleworkable)
replace teleworkable_tercile = round(teleworkable_tercile)

tab teleworkable, m
tab teleworkable_tercile, m

rename teleworkable teleworkable2
rename teleworkable_tercile teleworkable_tercile2
rename teleworkable_cont teleworkable_cont2

list in 1/20
isid soc5
save "teleworkable_soc5.dta", replace
restore

*******************
*** SOC 4-DIGIT ***
*******************

preserve
gen soc4 = substr(soc, 1, 4)
unique soc
unique soc4

collapse teleworkable teleworkable_tercile teleworkable_cont, by(soc4)

tab teleworkable, m
tab teleworkable_tercile, m

replace teleworkable = round(teleworkable)
replace teleworkable_tercile = round(teleworkable_tercile)

tab teleworkable, m
tab teleworkable_tercile, m

rename teleworkable teleworkable2
rename teleworkable_tercile teleworkable_tercile2
rename teleworkable_cont teleworkable_cont2

isid soc4

list in 1/20
save "teleworkable_soc4.dta", replace
restore

*******************
*** SOC 3-DIGIT ***
*******************

preserve
gen soc3 = substr(soc, 1, 3)
unique soc
unique soc3

collapse teleworkable teleworkable_tercile teleworkable_cont, by(soc3)

tab teleworkable
tab teleworkable_tercile, m

replace teleworkable = round(teleworkable)
replace teleworkable_tercile = round(teleworkable_tercile)

tab teleworkable
tab teleworkable_tercile, m

rename teleworkable teleworkable2
rename teleworkable_tercile teleworkable_tercile2
rename teleworkable_cont teleworkable_cont2

isid soc3

list in 1/20
save "teleworkable_soc3.dta", replace
restore

*******************
*** SOC 2-DIGIT ***
*******************

preserve
gen soc2 = substr(soc, 1, 2)
unique soc
unique soc2

collapse teleworkable teleworkable_tercile teleworkable_cont, by(soc2)

tab teleworkable, m
tab teleworkable_tercile, m

replace teleworkable = round(teleworkable)
replace teleworkable_tercile = round(teleworkable_tercile)

tab teleworkable, m
tab teleworkable_tercile, m

rename teleworkable teleworkable2
rename teleworkable_tercile teleworkable_tercile2
rename teleworkable_cont teleworkable_cont2

isid soc2

list in 1/20
save "teleworkable_soc2.dta", replace
restore
