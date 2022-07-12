* CALCULATE CONSUMER PRICE INDEXES FOR EACH STATE

clear all
set more off
cd "~/Dropbox (IPL)/wfh/data"

use "usa_00144"

keep if inlist(bedroom,2,3)
keep if rent > 0

sum rent

collapse (mean) rentgrs [pw=hhwt], by(statefip)
sum

sum rent, d

gen cpi = rent / r(p50)

keep statefip cpi
sum

sort cpi
list in 1/10

gsort - cpi
list in 1/10

isid statefip
save "cpi.dta", replace
