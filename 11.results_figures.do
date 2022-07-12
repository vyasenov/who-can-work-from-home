* PLOT FINAL FIGURES

clear all
set more off
cd "/Users/yasenov/Dropbox (IPL)/wfh/data/"

************************
************************
************************

use "../results/results_acs"

merge 1:1 bin using "../results/results_cps.dta"
assert _merge == 3
drop _merge

sum

corr tele*
corr *_y*
corr *_w*
corr *_h*
corr *_inc*
corr *_cont*

************************
************************
************************

sum teleworkable_w_acs teleworkable_w_cps

twoway (connected teleworkable_w_acs bin) ///
	(connected teleworkable_w_cps bin, msymbol(diamond)), ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile") ///
	legend(label(1 "ACS") label(2 "CPS") ring(0)) ///
	ylabel(20(10)80)
	
graph export "../results/w.pdf", replace  

**********
**********

twoway (connected teleworkable_y_acs bin) ///
	(connected teleworkable_y_cps bin, msymbol(diamond)), ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile") ///
	title("Panel A: Yearly Wages") ///
	legend(label(1 "ACS") label(2 "CPS") ring(0)) ///
	name(g1, replace) ///
	ylabel(20(10)80)
	
twoway (connected teleworkable_inc_acs bin) ///
	(connected teleworkable_inc_cps bin, msymbol(diamond)), ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile") ///
	title("Panel B: Income") ///
	legend(label(1 "ACS") label(2 "CPS") ring(0)) ///
	name(g2, replace) ///
	ylabel(20(10)80)
	
graph combine g1 g2, imargin(vsmall) ycommon	
graph export "../results/add.pdf", replace  

**********
**********

sum share_t1*
sum share_t3*

twoway (connected share_t1_acs bin) ///
	(connected share_t1_cps bin, msymbol(s)) ///
	(connected share_t3_acs bin, msymbol(t)) ///
	(connected share_t3_cps bin, msymbol(d)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(1 "ACS, Low Teleworkable Occ") label(2 "CPS, Low Teleworkable Occ") label(3 "ACS, High Teleworkable Occ") label(4 "CPS, High Teleworkable Occ") ring(0) pos(8)) 
	
graph export "../results/share.pdf", replace  

**********
**********

twoway (connected telew_tercile3_acs bin) ///
	(connected telew_tercile3_cps bin, msymbol(s)) ///
	(connected telew_tercile1_acs bin, msymbol(t)) ///
	(connected telew_tercile1_cps bin, msymbol(d)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(3 "ACS, Bottom Tercile") label(4 "CPS, Bottom Tercile")  label(1 "ACS, Top Tercile") label(2 "CPS, Top Tercile") ring(0) pos(11)) ///
	name(g3, replace) ///
	ylabel(0(20)80)

graph export "../results/terc.pdf", replace  

**********
**********

twoway (connected teleworkable_cont_acs bin) ///
	(connected teleworkable_cont_cps bin, msymbol(diamond)), ///
	ytitle("Average Teleworkability Score") ///
	xtitle("Percentile") ///
	legend(label(1 "ACS") label(2 "CPS") ring(0)) 
	
graph export "../results/cont.pdf", replace  


/*


twoway (connected telew_tercile1_acs bin) ///
	(connected telew_tercile3_acs bin, msymbol(square)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(1 "Bottom Tercile") label(2 "Top Tercile")  ring(0) pos(11)) ///
	name(g3, replace) ///
	title("Panel A: ACS")  ///
	ylabel(0(20)80)
	
twoway (connected telew_tercile1_cps bin) ///
	(connected telew_tercile3_cps bin, msymbol(square)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(1 "Bottom Tercile") label(2 "Top Tercile")  ring(0) pos(11))	 ///
	name(g4, replace) ///
	title("Panel B: CPS") ///
	ylabel(0(20)80)
	
graph combine g3 g4, imargin(vsmall) ycommon
graph export "../results/terc.pdf", replace  


twoway (connected telew_tercile1_acs bin) ///
	(connected telew_tercile2_acs bin, msymbol(diamond)) ///
	(connected telew_tercile3_acs bin, msymbol(square)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(1 "Bottom Tercile") label(2 "Middle Tercile") label(3 "Top Tercile")  ring(0) pos(11)) ///
	name(g3, replace) ///
	title("Panel A: ACS")  ///
	ylabel(0(20)80)
	
twoway (connected telew_tercile1_cps bin) ///
	(connected telew_tercile2_cps bin, msymbol(diamond)) ///
	(connected telew_tercile3_cps bin, msymbol(square)), ///
	ytitle("Share of Workers") ///
	xtitle("Percentile") ///
	legend(label(1 "Bottom Tercile") label(2 "Middle Tercile") label(3 "Top Tercile")  ring(0) pos(11))	 ///
	name(g4, replace) ///
	title("Panel B: CPS") ///
	ylabel(0(20)80)
	
graph combine g3 g4, imargin(vsmall) ycommon
graph export "../results/terc.pdf", replace  


twoway connected teleworkable_y bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile")
graph export "../results/bin_y_acs.pdf", replace   // 	title("Yearly Wages")

twoway connected teleworkable_w bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile") 
graph export "../results/bin_w_acs.pdf", replace    // 	title("Weekly Wages")

twoway connected teleworkable_h bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile")  
graph export "../results/bin_h_acs.pdf", replace   // 	title("Hourly Wages")

************************
************************
************************

twoway connected teleworkable_y bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile")
graph export "../results/bin_y_cps.pdf", replace   // 	title("Yearly Wages")

twoway connected teleworkable_w bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile") 
graph export "../results/bin_w_cps.pdf", replace    // 	title("Weekly Wages")

twoway connected teleworkable_h bin, ///
	ytitle("Share Who Can Work at Home") ///
	xtitle("Percentile")  
graph export "../results/bin_h_cps.pdf", replace   // 	title("Hourly Wages")
