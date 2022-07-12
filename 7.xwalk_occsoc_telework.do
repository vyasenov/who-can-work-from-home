* MERGE ONET SOC TELEWORKABILITY MEASURE TO ACS SOC OCCUPATION CODES

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

collapse year, by(occsoc)
drop year

list in 1/20

gen occsoc_match_quality = .

***************
***************
***************

/* step 1 - match 6 digits */
rename occsoc soc

merge m:1 soc using "teleworkable_soc.dta", keep(1 3) gen(m1)

replace occsoc_match_quality = 6 if m1 == 3
tab teleworkable, m
list in 1/20

/* step 2 - match 5 digits */
gen soc5 = substr(soc, 1, 5)
replace soc5 = "" if m1 == 3 
replace soc5 = "" if strpos(soc5, "X") > 0 | strpos(soc5, "Y") > 0

merge m:1 soc5 using "teleworkable_soc5.dta", keep(1 3) gen(m2)

replace occsoc_match_quality = 5 if  m1 == 1 & m2 == 3
replace teleworkable = teleworkable2 if m1 == 1 & m2 == 3
replace teleworkable_tercile = teleworkable_tercile2 if m1 == 1 & m2 == 3
replace teleworkable_cont = teleworkable_cont2 if m1 == 1 & m2 == 3

list soc soc5 tele* in 1/20
tab teleworkable, m
drop teleworkable2 teleworkable_tercile2 teleworkable_cont2 soc5

/* step 3 - match 4 digits */
gen soc4 = substr(soc, 1, 4)
replace soc4 = "" if m1 == 3 | m2 == 3 
replace soc4 = "" if strpos(soc4, "X") > 0 | strpos(soc4, "Y") > 0

merge m:1 soc4 using "teleworkable_soc4.dta", keep(1 3) gen(m3)

replace occsoc_match_quality = 4 					 if m1 == 1 & m2 == 1 & m3 == 3
replace teleworkable = teleworkable2 				 if m1 == 1 & m2 == 1 & m3 == 3
replace teleworkable_tercile = teleworkable_tercile2 if m1 == 1 & m2 == 1 & m3 == 3
replace teleworkable_cont = teleworkable_cont2       if m1 == 1 & m2 == 1 & m3 == 3

tab teleworkable, m
drop teleworkable2 teleworkable_tercile2 teleworkable_cont2 soc4

/* step 4 - match 3 digits */
gen soc3 = substr(soc, 1, 3)
replace soc3 = "" if m1 == 3 | m2 == 3 | m3 == 3
replace soc3 = "" if strpos(soc3, "X") > 0 | strpos(soc3, "Y") > 0

merge m:1 soc3 using "teleworkable_soc3.dta", keep(1 3) gen(m4)

replace occsoc_match_quality = 3 if  m1 == 1 & m2 == 1 & m3 == 1 & m4 == 3
replace teleworkable = teleworkable2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 3
replace teleworkable_tercile = teleworkable_tercile2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 3
replace teleworkable_cont = teleworkable_cont2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 3

tab teleworkable, m
drop teleworkable2 teleworkable_tercile2 teleworkable_cont2 soc3

/* step 5 - match 2 digits */
gen soc2 = substr(soc, 1, 2)
replace soc2 = "" if m1 == 3 | m2 == 3 | m3 == 3 | m4 == 3
replace soc2 = "" if strpos(soc2, "X") > 0 | strpos(soc2, "Y") > 0

merge m:1 soc2 using "teleworkable_soc2.dta", keep(1 3) gen(m5)

replace occsoc_match_quality = 2 if  m1 == 1 & m2 == 1 & m3 == 1 & m4 == 1 & m5 == 3
replace teleworkable = teleworkable2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 1 & m5 == 3
replace teleworkable_tercile = teleworkable_tercile2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 1 & m5 == 3
replace teleworkable_cont = teleworkable_cont2 if m1 == 1 & m2 == 1 & m3 == 1 & m4 == 1 & m5 == 3

tab teleworkable, m
drop teleworkable2 teleworkable_tercile2 teleworkable_cont2 soc2

/* step 6 - match the rest */
tab occsoc_match_quality, sort

list soc if teleworkable == .

replace teleworkable = 0 if soc == "553010"  // Military Enlisted Tactical Operations and Air/Weapons Specialists and Crew Members
replace teleworkable = 0 if soc == "551010"  // Military Officer Special and Tactical Operations Leaders
replace teleworkable = 0 if soc == "552010"  // First-Line Enlisted Military Supervisors
replace teleworkable = 0 if soc == "559830"  // Military, Rank Not Specified

replace occsoc_match_quality = 6 if inlist(soc, "551010", "552010" , "553010", "559830")

***************
***************
***************

keep soc teleworkable teleworkable_tercile teleworkable_cont occsoc_match_quality
rename soc occsoc

sum

tab teleworkable, m
tab teleworkable_tercile, m
tab teleworkable teleworkable_tercile, m

list in 1/20
save "xwalk_occsoc_telework.dta", replace
