* MERGE TELEWORKABILITY MEASURE (FROM ACS) TO CPS SOC OCCUPATION CODES

clear all
set more off
cd "/Users/yasenov/Dropbox (IPL)/wfh/data/"

***************
***************
***************

use "usa_00145.dta"

/* set sample */
drop if school == 2
drop if occsoc == "0" | occsoc == "999920"

merge m:1 occsoc using "xwalk_occsoc_telework", keep(1 3)
assert _merge == 3
drop _merge

tab teleworkable, m
keep if teleworkable != .

collapse teleworkable*, by(occ)

tab teleworkable teleworkable_tercile, m

sum

save "xwalk_telework_cps.dta", replace
