* SAVE A FILE CONTAINING RESULTS FROM ACS DATA

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

************************
************************
************************

merge m:1 statefip using "cpi.dta", keep(1 3)
assert _merge == 3
drop _merge

replace incwage = incwage / cpi

tab wksw, m	
recode wksw (1 = 8) (2 = 20.8) (3 = 33.1) (4 = 42.4) (5 = 48.3) (6 = 51.9)
tab wksw, m

gen wage_w = incwage / wksw
gen wage_h = incwage / (wksw * uhrs)
rename incwage wage_y 

corr wage_*

xtile bin_w if wage_y > 0 = wage_w, n(50)
xtile bin_y if wage_y > 0 = wage_y, n(50)
xtile bin_h if wage_y > 0 = wage_h, n(50)
xtile bin_inc = inctot, n(50)

replace bin_w = bin_w * 2 - 1
replace bin_y = bin_y * 2 - 1
replace bin_h = bin_h * 2 - 1
replace bin_inc = bin_inc * 2 - 1

corr bin*
sum year wage_y bin*

keep perwt tele* bin* wage_y inctot
compress

tab teleworkable_tercile, gen(telew_tercile)

************************
************************
************************

preserve
drop if bin_y == .
collapse teleworkable [pw=perwt], by(bin_y)
rename (bin tele) (bin teleworkable_y)
tempfile file_y
save `file_y', replace
restore

preserve
drop if bin_w == .
collapse teleworkable [pw=perwt], by(bin_w)
rename (bin tele) (bin teleworkable_w)
tempfile file_w
save `file_w', replace
restore

preserve
drop if bin_h == .
collapse teleworkable [pw=perwt], by(bin_h)
rename (bin tele) (bin teleworkable_h)
tempfile file_h
save `file_h', replace
restore

preserve
drop if bin_inc == .
collapse teleworkable [pw=perwt], by(bin_inc)
rename (bin tele) (bin teleworkable_inc)
tempfile file_inc
save `file_inc', replace
restore

preserve
drop if bin_w == .
collapse telew_ter* [pw=perwt], by(bin_w)
rename (bin) (bin)
tempfile file_tercile
save `file_tercile', replace
restore

preserve
drop if bin_w == .
collapse teleworkable_cont [pw=perwt], by(bin_w)
rename (bin) (bin)
tempfile file_cont
save `file_cont', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile1 == 1
collapse (sum) perwt, by(bin_w)
rename bin bin
sum perwt
gen share_t1 = perwt / r(sum)
keep bin share
tempfile file_sharet1
save `file_sharet1', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile2 == 1
collapse (sum) perwt, by(bin_w)
rename bin bin
sum perwt
gen share_t2 = perwt / r(sum)
keep bin share
tempfile file_sharet2
save `file_sharet2', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile3 == 1
collapse (sum) perwt, by(bin_w)
rename bin bin
sum perwt
gen share_t3 = perwt / r(sum)
keep bin share
tempfile file_sharet3
save `file_sharet3', replace
restore

************************
************************
************************

clear
use `file_w'
merge 1:1 bin using `file_y', nogen
merge 1:1 bin using `file_h', nogen
merge 1:1 bin using `file_inc', nogen
merge 1:1 bin using `file_tercile', nogen
merge 1:1 bin using `file_cont', nogen
merge 1:1 bin using `file_sharet1', nogen
merge 1:1 bin using `file_sharet2', nogen
merge 1:1 bin using `file_sharet3', nogen

sum

list
corr tele*

replace teleworkable_y = teleworkable_y * 100
replace teleworkable_w = teleworkable_w * 100
replace teleworkable_h = teleworkable_h * 100
replace teleworkable_inc = teleworkable_inc * 100

replace telew_tercile1 = telew_tercile1 * 100
replace telew_tercile2 = telew_tercile2 * 100
replace telew_tercile3 = telew_tercile3 * 100

replace share_t1 = share_t1 * 100
replace share_t2 = share_t2 * 100
replace share_t3 = share_t3 * 100

rename (teleworkable_w teleworkable_y teleworkable_h teleworkable_inc) ///
	(teleworkable_w_acs teleworkable_y_acs teleworkable_h_acs teleworkable_inc_acs)

rename (telew_tercile1 telew_tercile2 telew_tercile3) ///
	(telew_tercile1_acs telew_tercile2_acs telew_tercile3_acs)
	
rename teleworkable_cont teleworkable_cont_acs

rename (share_t1 share_t2 share_t3) (share_t1_acs share_t2_acs share_t3_acs)

sum
save "../results/results_acs.dta", replace


************************
************************
************************

************************
************************
************************

/*
/*			*/
* LIST LARGEST TELEWORKABLE AND NON-TELEWORKABLE OCCUPATIONS
preserve
collapse (sum) perwt, by(occsoc telework)

rename occsoc soc
merge 1:1 soc using "teleworkable_soc.dta", keepusing(soc_title) nogen

replace perwt = perwt / 1e6

gsort - tele - perwt 
list in 1/20

gsort + tele - perwt
list in 1/20
restore
/*			*/
*/
