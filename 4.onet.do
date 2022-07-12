* CREATE TELEWORKABILITY MEASURE FOR EACH ONET OCCUPATION


* Note: This code builds on the replication package provided by Dingel and Neiman
* I changed the scales on some entries - rounded up 3.5s and rounded down 4.5s
* "majority of time" entries is 4.5-5 scale

clear all
set more off
cd "~/Dropbox (IPL)/wfh/data/onet"

**************
**************
**************

//JOB TITLES
import excel "Occupation Data", sheet("Occupation Data") firstrow clear
rename *, lower

tempfile tf_occtitles
save `tf_occtitles'

**************
**************
**************

//JOB CHARACTERISTICS: WORK ACTIVITIES
import excel "Work Activities.xlsx", sheet("Work Activities") firstrow clear
rename *, lower

keep if inlist(elementid,"4.A.3.a.1","4.A.3.a.2","4.A.3.a.3","4.A.3.a.4","4.A.4.a.8","4.A.3.b.4","4.A.3.b.5","4.A.1.b.2")

**** A1 ****

* USED
bys onetsoccode: egen byte inspect_equip = max(elementid=="4.A.1.b.2" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable inspect_equip "Inspecting Equipment, Structures, or Materials is very important (4.0+ of 5)"

**** A3 ****

* USED
bys onetsoccode: egen byte physical_activities = max(elementid=="4.A.3.a.1" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable physical_activities "Performing General Physical Activities is very important (4.0+ of 5)"

* USED
bys onetsoccode: egen byte handlingobjects = max(elementid=="4.A.3.a.2" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable handlingobjects "Handling and Moving Objects is very important (4.0+ of 5)"

* USED
bys onetsoccode: egen byte control_machines = max(elementid=="4.A.3.a.3" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable control_machines "Controlling Machines and Processes [not computers nor vehicles] is very important (4.0+ of 5)"

* USED
bys onetsoccode: egen byte operate_equipment = max(elementid=="4.A.3.a.4" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable operate_equipment "Operating Vehicles, Mechanized Devices, or Equipment is very important (4.0+ of 5)"

* USED
bys onetsoccode: egen byte repair_mechequip = max(elementid=="4.A.3.b.4" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable repair_mechequip "Repairing and Maintaining Mechanical Equipment is very important (4.0+ of 5)"

* USED
bys onetsoccode: egen byte repair_elecequip = max(elementid=="4.A.3.b.5" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable repair_elecequip "Repairing and Maintaining Electronic Equipment is very important (4.0+ of 5)"

**** A4 ****

* USED
* ROTHWELL SUGGESTED
bys onetsoccode: egen byte dealwithpublic = max(elementid=="4.A.4.a.8" & scaleid=="IM" & inrange(datavalue,4.0,5.0)==1)
label variable dealwithpublic "Performing for or Working Directly with the Public is very important (4.0+ of 5)"

************

destring n, force replace
collapse (firstnm) physical_activities handlingobjects control_machines operate_equipment dealwithpublic repair_mechequip repair_elecequip inspect_equip (mean) n, by(onetsoccode)

tempfile tf_workactivities
save `tf_workactivities'

**************
**************
**************

//JOB CHARACTERISTICS: WORK CONTEXT
import excel "Work Context.xlsx", sheet("Work Context") firstrow clear
rename *, lower

keep if scaleid=="CX"

****** C1 ******

* ORIGINAL
bys onetsoccode: egen byte email_lessthanmonthly = max(elementid=="4.C.1.a.2.h" & inrange(datavalue,1.0,2.0)==1)
label variable email_lessthanmonthly "Average respondent says they use email less than once per month"

bys onetsoccode: egen byte telephone_lessthanmonthly = max(elementid=="4.C.1.a.2.f" & inrange(datavalue,1.0,2.0)==1)
label variable telephone_lessthanmonthly "Average respondent says they use telephone less than once per month"

bys onetsoccode: egen byte contactothers_majority = max(elementid=="4.C.1.a.4" & inrange(datavalue,4,5.0)==1)
label variable contactothers_majority "Average respondent says they spent majority of time contact with others"

bys onetsoccode: egen byte externalcustomer_veryimportant = max(elementid=="4.C.1.b.1.f" & inrange(datavalue,4.0,5.0)==1)
label variable externalcustomer_veryimportant "Average respondent says it is very important for them to deal with external customers"

bys onetsoccode: egen byte coordothers_veryimportant = max(elementid=="4.C.1.b.1.g" & inrange(datavalue,4.0,5.0)==1)
label variable coordothers_veryimportant "Average respondent says it is very important for them to coordinate or lead others"

* VAS
bys onetsoccode: egen byte othershealth_veryimportant = max(elementid=="4.C.1.c.1" & inrange(datavalue,4.0,5.0)==1)
label variable othershealth_veryimportant "Average respondent says it is very important for them to responsible for others' health and safety"

* VAS; ORIGINAL
bys onetsoccode: egen byte violentpeople_atleastweekly = max(elementid=="4.C.1.d.3" & inrange(datavalue,4.0,5.0)==1)
label variable violentpeople_atleastweekly "Average respondent says they deal with violent people at least once a week"

****** C2 ******

bys onetsoccode: egen byte sitting_continually = max(elementid=="4.C.2.d.1.a" & inrange(datavalue,4,5.0)==1)
label variable sitting_continually "Average respondent says they are sitting almost continually"

bys onetsoccode: egen byte standing_continually = max(elementid=="4.C.2.d.1.b" & inrange(datavalue,4,5.0)==1)
label variable standing_continually "Average respondent says they are standing almost continually"

* VAS
bys onetsoccode: egen byte handsontools = max(elementid=="4.C.2.d.1.g" & inrange(datavalue,4,5.0)==1)
label variable handsontools "Majority of time is spent using your hands to handle, control, or feel objects, tools, or controls"

* VAS; ORIGINAL
bys onetsoccode: egen byte outdoors_everyday = max(inlist(elementid,"4.C.2.a.1.c","4.C.2.a.1.d") & inrange(datavalue,4,5.0)==1)
label variable outdoors_everyday "Majority of respondents say outdoors every day"

* VAS
bys onetsoccode: egen byte climbing_majority = max(elementid=="4.C.2.d.1.c" & inrange(datavalue,4,5.0)==1)
label variable climbing_majority "Average respondent says they spent majority of time climbing ladders, scaffolds, or poles"

* VAS; ORIGINAL
bys onetsoccode: egen byte walking_majority = max(elementid=="4.C.2.d.1.d" & inrange(datavalue,4,5.0)==1)
label variable walking_majority "Average respondent says they spent majority of time walking or running"

* VAS
bys onetsoccode: egen byte crouching_majority = max(elementid=="4.C.2.d.1.e" & inrange(datavalue,4,5.0)==1)
label variable crouching_majority "Average respondent says they spent majority of time kneeling, crouching, stooping, or crawling"

bys onetsoccode: egen byte keepingbalance_majority = max(elementid=="4.C.2.d.1.f" & inrange(datavalue,4,5.0)==1)
label variable keepingbalance_majority "Average respondent says they spent majority of time keeping or regaining your balance"

bys onetsoccode: egen byte bendingbody_majority = max(elementid=="4.C.2.d.1.h" & inrange(datavalue,4,5.0)==1)
label variable bendingbody_majority "Average respondent says they spent majority of time bending or twisting your body"

bys onetsoccode: egen byte repetitivemotion_majority = max(elementid=="4.C.2.d.1.i" & inrange(datavalue,4,5.0)==1)
label variable repetitivemotion_majority "Average respondent says they spent majority of time making repetitive motions"

* VAS; ORIGINAL
bys onetsoccode: egen byte safetyequip_majority = max(inlist(elementid,"4.C.2.e.1.d","4.C.2.e.1.e") & inrange(datavalue,4,5.0)==1)
label variable safetyequip_majority "Average respondent says they spent majority of time wearing common or specialized protective or safety equipment"

bys onetsoccode: egen byte noac_everyday = max(elementid=="4.C.2.a.1.b" & inrange(datavalue,4,5.0)==1)
label variable noac_everyday "Average respondent says they work in an environment that is not environmentally controlled every day"

* ROTHWELL SUGGESTED
bys onetsoccode: egen byte physicalclose_atleastmoderate = max(elementid=="4.C.2.a.3" & inrange(datavalue,4.0,5.0)==1)
label variable physicalclose_atleastmoderate "Average respondent says they are physically close (at least moderately close) to others"

* VAS
bys onetsoccode: egen byte extremetemp_everyday = max(elementid=="4.C.2.b.1.b" & inrange(datavalue,4.0,5.0)==1)
label variable extremetemp_everyday "Average respondent says extreme temperatures every day"

* VAS
bys onetsoccode: egen byte contaminant_atleastweekly = max(elementid=="4.C.2.b.1.d" & inrange(datavalue,4.0,5.0)==1)
label variable contaminant_atleastweekly "Average respondent says they are exposed to contaminants at least once a week"

* VAS
bys onetsoccode: egen byte crampedspace_everyday = max(elementid=="4.C.2.b.1.e" & inrange(datavalue,4,5.0)==1)
label variable crampedspace_everyday "Average respondent says they are exposed to cramped work space every day"

bys onetsoccode: egen byte bodyvibration_atleastweekly = max(elementid=="4.C.2.b.1.f" & inrange(datavalue,4.0,5.0)==1)
label variable bodyvibration_atleastweekly "Average respondent says they are exposed to whole body vibration at least once a week"

* VAS
bys onetsoccode: egen byte radiation_atleastweekly = max(elementid=="4.C.2.c.1.a" & inrange(datavalue,4.0,5.0)==1)
label variable radiation_atleastweekly "Average respondent says they are exposed to radiation at least once a week"

* VAS; ORIGINAL
bys onetsoccode: egen byte disease_atleastweekly = max(elementid=="4.C.2.c.1.b" & inrange(datavalue,4.0,5.0)==1)
label variable disease_atleastweekly "Average respondent says they are exposed to diseases or infection at least once a week"

* VAS
bys onetsoccode: egen byte highplace_atleastweekly = max(elementid=="4.C.2.c.1.c" & inrange(datavalue,4.0,5.0)==1)
label variable highplace_atleastweekly "Average respondent says they are exposed to high places at least once a week"

* VAS
bys onetsoccode: egen byte hazardcond_atleastweekly = max(elementid=="4.C.2.c.1.d" & inrange(datavalue,4.0,5.0)==1)
label variable hazardcond_atleastweekly "Average respondent says they are exposed to hazardous conditions at least once a week"

* VAS
bys onetsoccode: egen byte hazardequip_atleastweekly = max(elementid=="4.C.2.c.1.e" & inrange(datavalue,4.0,5.0)==1)
label variable hazardequip_atleastweekly "Average respondent says they are exposed to hazardous equipment at least once a week"

* VAS; ORIGINAL
bys onetsoccode: egen byte minorhurt_atleastweekly = max(elementid=="4.C.2.c.1.f" & inrange(datavalue,4.0,5.0)==1)
label variable minorhurt_atleastweekly "Average respondent says they are exposed to minor burns, cuts, bites, or stings at least once a week"

keep onetsoccode sitting_continually standing_continually handsontools outdoors_everyday email_lessthanmonthly telephone_lessthanmonthly climbing_majority walking_majority crouching_majority keepingbalance_majority bendingbody_majority repetitivemotion_majority safetyequip_majority contactothers_majority externalcustomer_veryimportant coordothers_veryimportant othershealth_veryimportant violentpeople_atleastweekly noac_everyday physicalclose_atleastmoderate extremetemp_everyday contaminant_atleastweekly crampedspace_everyday bodyvibration_atleastweekly radiation_atleastweekly disease_atleastweekly highplace_atleastweekly hazardcond_atleastweekly hazardequip_atleastweekly minorhurt_atleastweekly
duplicates drop

tempfile tf_workcontext
save `tf_workcontext'

//Merge three files
use `tf_workcontext', clear
merge 1:1 onetsoccode using `tf_workactivities', assert(match) nogen
merge m:1 onetsoccode using `tf_occtitles', assert(using match) keep(match) nogen keepusing(title)

**************
**************
**************

* TELEWORKABILITY from the ACTIVITY dataset
gen byte teleworkable_activity = ///
	inspect_equip==0 & ///
	physical_activities==0 & ///
	handlingobjects==0 & ///
	control_machines==0 & ///
	operate_equipment==0 & ///
	repair_mechequip==0 & ///
	repair_elecequip==0 & ///
	dealwithpublic==0
	
* TELEWORKABILITY from the CONTEXT dataset	
gen byte teleworkable_context = ///
	email_lessthanmonthly==0 & ///
	violentpeople_atleastweekly==0 & ///
	outdoors_everyday==0 & ///
	walking_majority==0 & ///
	safetyequip_majority == 0 & ///
	disease_atleastweekly==0 & ///
	minorhurt_atleastweekly==0

* TELEWORKABILITY from CONTEXT dataset - additional 
gen byte teleworkable_context_plus =  ///
	climbing_majority == 0 &  ///
	crouching_majority == 0 &  ///
	extremetemp_everyday == 0 &  ///
	contaminant_atleastweekly == 0 &  ///
	crampedspace_everyday == 0 &  ///
	radiation_atleastweekly == 0 &  ///
	highplace_atleastweekly == 0 &  ///
	hazardcond_atleastweekly == 0 &  ///
	hazardequip_atleastweekly == 0

* TELEWORKABILITY from CONTEXT dataset - robustness	
gen teleworkable_robustness = ///
	handsontools == 0 & ///
	othershealth_veryimportant == 0
	
tab teleworkable_activity teleworkable_context

**************
**************
**************
	
* ORIGINAL, DINGEL AND NEIMAN (2020)	
gen byte teleworkable_orig = teleworkable_activity == 1 & teleworkable_context == 1

* ROBUSTNESS
gen byte teleworkable2 = teleworkable_activity == 1 & teleworkable_context == 1 & teleworkable_context_plus == 1

* VAS, PREFERRED
gen byte teleworkable = teleworkable_activity == 1 & teleworkable_context == 1 & teleworkable_context_plus == 1 & teleworkable_robustness == 1

* CONTINUOUS
gen teleworkable_cont = ///
	inspect_equip + ///
	physical_activities + ///
	handlingobjects + ///
	control_machines + ///
	operate_equipment + ///
	repair_mechequip + ///
	repair_elecequip + ///
	dealwithpublic + ///
	email_lessthanmonthly + ///
	violentpeople_atleastweekly + ///
	outdoors_everyday + ///
	walking_majority + ///
	safetyequip_majority + ///
	disease_atleastweekly + ///
	minorhurt_atleastweekly + ///
	climbing_majority +  ///
	crouching_majority +  ///
	extremetemp_everyday +  ///
	contaminant_atleastweekly +  ///
	crampedspace_everyday +  ///
	radiation_atleastweekly +  ///
	highplace_atleastweekly +  ///
	hazardcond_atleastweekly +  ///
	hazardequip_atleastweekly	

replace teleworkable_cont = -teleworkable_cont + 14
tab	teleworkable_cont

xtile teleworkable_tercile = teleworkable_cont, n(4)
bysort teleworkable_tercile: sum teleworkable_cont teleworkable

**************
**************
**************

tab teleworkable teleworkable_orig
corr teleworkable teleworkable_orig

tab teleworkable teleworkable2
corr teleworkable teleworkable2

sum teleworkable_cont if teleworkable == 1
sum teleworkable_cont if teleworkable == 0

list title if teleworkable == 1 & physicalclose == 1

**************
**************
**************
	
keep onet title teleworkable teleworkable_tercile teleworkable_cont
sum

save "onet.dta", replace
