* SAVE CROSSWALK ONET SOC 2010 TO SOC OCCUPATION CODES


clear all
set more off
cd "~/Dropbox (IPL)/wfh/data/xwalks"

********
********

import excel "2010_to_SOC_Crosswalk.xls", sheet("O-NET-SOC 2010 Occupation Listi") cellrange(A4:D1114) firstrow clear
sum

isid ONETSOC2010Code

list in 1/10

save "onet_soc_2010_xwalk.dta", replace
