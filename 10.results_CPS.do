* SAVE A FILE CONTAINING RESULTS FROM CPS DATA

clear all
set more off
cd "/Users/yasenov/Dropbox (IPL)/wfh/data/"

***************
***************
***************

use "cps_00032.dta"

/* set sample */
drop if inlist(schlcoll, 1, 2, 3, 4)
drop if occ == 0 // | occsoc == "999920"

merge m:1 occ using "xwalk_telework_cps.dta", keep(1 3)
*assert _merge == 3
tab occ if _merge == 1
drop _merge

tab teleworkable, m
keep if teleworkable != .

***************
***************
***************

merge m:1 statefip using "cpi.dta", keep(1 3)
assert _merge == 3
drop _merge

replace incwage = incwage / cpi

gen wage_w = incwage / wksw
gen wage_h = incwage / (wksw * uhrsworkt)
replace wage_h = . if uhrsworkt >= 997
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

keep asecwt tele* bin* wage_y inctot
compress

tab teleworkable_tercile, gen(telew_tercile)

***************
***************
***************

preserve
drop if bin_y == .
collapse teleworkable [pw=asecwt], by(bin_y)
rename (bin tele) (bin teleworkable_y)
tempfile file_y
save `file_y', replace
restore

preserve
drop if bin_w == .
collapse teleworkable [pw=asecwt], by(bin_w)
rename (bin tele) (bin teleworkable_w)
tempfile file_w
save `file_w', replace
restore

preserve
drop if bin_h == .
collapse teleworkable [pw=asecwt], by(bin_h)
rename (bin tele) (bin teleworkable_h)
tempfile file_h
save `file_h', replace
restore

preserve
drop if bin_inc == .
collapse teleworkable [pw=asecwt], by(bin_inc)
rename (bin tele) (bin teleworkable_inc)
tempfile file_inc
save `file_inc', replace
restore

preserve
drop if bin_w == .
collapse telew_ter* [pw=asecwt], by(bin_w)
rename (bin) (bin)
tempfile file_tercile
save `file_tercile', replace
restore

preserve
drop if bin_w == .
collapse teleworkable_cont [pw=asecwt], by(bin_w)
rename (bin) (bin)
tempfile file_cont
save `file_cont', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile1 == 1
collapse (sum) asecwt, by(bin_w)
rename bin bin
sum asecwt
gen share_t1 = asecwt / r(sum)
keep bin share
tempfile file_sharet1
save `file_sharet1', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile2 == 1
collapse (sum) asecwt, by(bin_w)
rename bin bin
sum asecwt
gen share_t2 = asecwt / r(sum)
keep bin share
tempfile file_sharet2
save `file_sharet2', replace
restore

preserve
drop if bin_w == .
keep if telew_tercile3 == 1
collapse (sum) asecwt, by(bin_w)
rename bin bin
sum asecwt
gen share_t3 = asecwt / r(sum)
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
	(teleworkable_w_cps teleworkable_y_cps teleworkable_h_cps teleworkable_inc_cps)
	
rename (telew_tercile1 telew_tercile2 telew_tercile3) ///
	(telew_tercile1_cps telew_tercile2_cps telew_tercile3_cps)
 
rename teleworkable_cont teleworkable_cont_cps

rename (share_t1 share_t2 share_t3) (share_t1_cps share_t2_cps share_t3_cps)
sum
save "../results/results_cps.dta", replace
