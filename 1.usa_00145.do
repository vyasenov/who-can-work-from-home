* LOAD AND SAVE IPUMS AMERICAN COMMUNITY SURVEY (ACS) DATA

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                ///
  int     year      1-4      ///
  int     multyear  5-8      ///
  long    sample    9-14     ///
  double  serial    15-22    ///
  double  cbserial  23-35    ///
  double  hhwt      36-45    ///
  double  cluster   46-58    ///
  byte    statefip  59-60    ///
  long    met2013   61-65    ///
  long    puma      66-70    ///
  double  strata    71-82    ///
  byte    gq        83-83    ///
  int     rentgrs   84-87    ///
  byte    bedrooms  88-89    ///
  int     pernum    90-93    ///
  double  perwt     94-103   ///
  byte    sex       104-104  ///
  int     age       105-107  ///
  byte    race      108-108  ///
  int     raced     109-111  ///
  byte    hispan    112-112  ///
  int     hispand   113-115  ///
  int     bpl       116-118  ///
  long    bpld      119-123  ///
  byte    citizen   124-124  ///
  byte    school    125-125  ///
  byte    educ      126-127  ///
  int     educd     128-130  ///
  byte    empstat   131-131  ///
  byte    empstatd  132-133  ///
  byte    labforce  134-134  ///
  int     occ       135-138  ///
  str     occsoc    139-144  ///
  byte    wkswork2  145-145  ///
  byte    uhrswork  146-147  ///
  long    inctot    148-154  ///
  long    incwage   155-160  ///
  long    incwelfr  161-165  ///
  int     poverty   166-168  ///
  byte    tranwork  169-170  ///
  byte    carpool   171-171  ///
  using `"usa_00145.dat"'

replace hhwt     = hhwt     / 100
replace perwt    = perwt    / 100

format serial   %8.0f
format cbserial %13.0f
format hhwt     %10.2f
format cluster  %13.0f
format strata   %12.0f
format perwt    %10.2f

label var year     `"Census year"'
label var multyear `"Actual year of survey, multi-year ACS/PRCS"'
label var sample   `"IPUMS sample identifier"'
label var serial   `"Household serial number"'
label var cbserial `"Original Census Bureau household serial number"'
label var hhwt     `"Household weight"'
label var cluster  `"Household cluster for variance estimation"'
label var statefip `"State (FIPS code)"'
label var met2013  `"Metropolitan area (2013 OMB delineations)"'
label var puma     `"Public Use Microdata Area"'
label var strata   `"Household strata for variance estimation"'
label var gq       `"Group quarters status"'
label var rentgrs  `"Monthly gross rent"'
label var bedrooms `"Number of bedrooms"'
label var pernum   `"Person number in sample unit"'
label var perwt    `"Person weight"'
label var sex      `"Sex"'
label var age      `"Age"'
label var race     `"Race [general version]"'
label var raced    `"Race [detailed version]"'
label var hispan   `"Hispanic origin [general version]"'
label var hispand  `"Hispanic origin [detailed version]"'
label var bpl      `"Birthplace [general version]"'
label var bpld     `"Birthplace [detailed version]"'
label var citizen  `"Citizenship status"'
label var school   `"School attendance"'
label var educ     `"Educational attainment [general version]"'
label var educd    `"Educational attainment [detailed version]"'
label var empstat  `"Employment status [general version]"'
label var empstatd `"Employment status [detailed version]"'
label var labforce `"Labor force status"'
label var occ      `"Occupation"'
label var occsoc   `"Occupation, SOC classification"'
label var wkswork2 `"Weeks worked last year, intervalled"'
label var uhrswork `"Usual hours worked per week"'
label var inctot   `"Total personal income"'
label var incwage  `"Wage and salary income"'
label var incwelfr `"Welfare (public assistance) income"'
label var poverty  `"Poverty status"'
label var tranwork `"Means of transportation to work"'
label var carpool  `"Carpooling"'

label define year_lbl 1850 `"1850"'
label define year_lbl 1860 `"1860"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1920 `"1920"', add
label define year_lbl 1930 `"1930"', add
label define year_lbl 1940 `"1940"', add
label define year_lbl 1950 `"1950"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label values year year_lbl

label define sample_lbl 201804 `"2014-2018, PRCS 5-year"'
label define sample_lbl 201803 `"2014-2018, ACS 5-year"', add
label define sample_lbl 201802 `"2018 PRCS"', add
label define sample_lbl 201801 `"2018 ACS"', add
label define sample_lbl 201704 `"2013-2017, PRCS 5-year"', add
label define sample_lbl 201703 `"2013-2017, ACS 5-year"', add
label define sample_lbl 201702 `"2017 PRCS"', add
label define sample_lbl 201701 `"2017 ACS"', add
label define sample_lbl 201604 `"2012-2016, PRCS 5-year"', add
label define sample_lbl 201603 `"2012-2016, ACS 5-year"', add
label define sample_lbl 201602 `"2016 PRCS"', add
label define sample_lbl 201601 `"2016 ACS"', add
label define sample_lbl 201504 `"2011-2015, PRCS 5-year"', add
label define sample_lbl 201503 `"2011-2015, ACS 5-year"', add
label define sample_lbl 201502 `"2015 PRCS"', add
label define sample_lbl 201501 `"2015 ACS"', add
label define sample_lbl 201404 `"2010-2014, PRCS 5-year"', add
label define sample_lbl 201403 `"2010-2014, ACS 5-year"', add
label define sample_lbl 201402 `"2014 PRCS"', add
label define sample_lbl 201401 `"2014 ACS"', add
label define sample_lbl 201306 `"2009-2013, PRCS 5-year"', add
label define sample_lbl 201305 `"2009-2013, ACS 5-year"', add
label define sample_lbl 201304 `"2011-2013, PRCS 3-year"', add
label define sample_lbl 201303 `"2011-2013, ACS 3-year"', add
label define sample_lbl 201302 `"2013 PRCS"', add
label define sample_lbl 201301 `"2013 ACS"', add
label define sample_lbl 201206 `"2008-2012, PRCS 5-year"', add
label define sample_lbl 201205 `"2008-2012, ACS 5-year"', add
label define sample_lbl 201204 `"2010-2012, PRCS 3-year"', add
label define sample_lbl 201203 `"2010-2012, ACS 3-year"', add
label define sample_lbl 201202 `"2012 PRCS"', add
label define sample_lbl 201201 `"2012 ACS"', add
label define sample_lbl 201106 `"2007-2011, PRCS 5-year"', add
label define sample_lbl 201105 `"2007-2011, ACS 5-year"', add
label define sample_lbl 201104 `"2009-2011, PRCS 3-year"', add
label define sample_lbl 201103 `"2009-2011, ACS 3-year"', add
label define sample_lbl 201102 `"2011 PRCS"', add
label define sample_lbl 201101 `"2011 ACS"', add
label define sample_lbl 201008 `"2010 Puerto Rico 10%"', add
label define sample_lbl 201007 `"2010 10%"', add
label define sample_lbl 201006 `"2006-2010, PRCS 5-year"', add
label define sample_lbl 201005 `"2006-2010, ACS 5-year"', add
label define sample_lbl 201004 `"2008-2010, PRCS 3-year"', add
label define sample_lbl 201003 `"2008-2010, ACS 3-year"', add
label define sample_lbl 201002 `"2010 PRCS"', add
label define sample_lbl 201001 `"2010 ACS"', add
label define sample_lbl 200906 `"2005-2009, PRCS 5-year"', add
label define sample_lbl 200905 `"2005-2009, ACS 5-year"', add
label define sample_lbl 200904 `"2007-2009, PRCS 3-year"', add
label define sample_lbl 200903 `"2007-2009, ACS 3-year"', add
label define sample_lbl 200902 `"2009 PRCS"', add
label define sample_lbl 200901 `"2009 ACS"', add
label define sample_lbl 200804 `"2006-2008, PRCS 3-year"', add
label define sample_lbl 200803 `"2006-2008, ACS 3-year"', add
label define sample_lbl 200802 `"2008 PRCS"', add
label define sample_lbl 200801 `"2008 ACS"', add
label define sample_lbl 200704 `"2005-2007, PRCS 3-year"', add
label define sample_lbl 200703 `"2005-2007, ACS 3-year"', add
label define sample_lbl 200702 `"2007 PRCS"', add
label define sample_lbl 200701 `"2007 ACS"', add
label define sample_lbl 200602 `"2006 PRCS"', add
label define sample_lbl 200601 `"2006 ACS"', add
label define sample_lbl 200502 `"2005 PRCS"', add
label define sample_lbl 200501 `"2005 ACS"', add
label define sample_lbl 200401 `"2004 ACS"', add
label define sample_lbl 200301 `"2003 ACS"', add
label define sample_lbl 200201 `"2002 ACS"', add
label define sample_lbl 200101 `"2001 ACS"', add
label define sample_lbl 200008 `"2000 Puerto Rico 1%"', add
label define sample_lbl 200007 `"2000 1%"', add
label define sample_lbl 200006 `"2000 Puerto Rico 1% sample (old version)"', add
label define sample_lbl 200005 `"2000 Puerto Rico 5%"', add
label define sample_lbl 200004 `"2000 ACS"', add
label define sample_lbl 200003 `"2000 Unweighted 1%"', add
label define sample_lbl 200002 `"2000 1% sample (old version)"', add
label define sample_lbl 200001 `"2000 5%"', add
label define sample_lbl 199007 `"1990 Puerto Rico 1%"', add
label define sample_lbl 199006 `"1990 Puerto Rico 5%"', add
label define sample_lbl 199005 `"1990 Labor Market Area"', add
label define sample_lbl 199004 `"1990 Elderly"', add
label define sample_lbl 199003 `"1990 Unweighted 1%"', add
label define sample_lbl 199002 `"1990 1%"', add
label define sample_lbl 199001 `"1990 5%"', add
label define sample_lbl 198007 `"1980 Puerto Rico 1%"', add
label define sample_lbl 198006 `"1980 Puerto Rico 5%"', add
label define sample_lbl 198005 `"1980 Detailed metro/non-metro"', add
label define sample_lbl 198004 `"1980 Labor Market Area"', add
label define sample_lbl 198003 `"1980 Urban/Rural"', add
label define sample_lbl 198002 `"1980 1%"', add
label define sample_lbl 198001 `"1980 5%"', add
label define sample_lbl 197009 `"1970 Puerto Rico Neighborhood"', add
label define sample_lbl 197008 `"1970 Puerto Rico Municipio"', add
label define sample_lbl 197007 `"1970 Puerto Rico State"', add
label define sample_lbl 197006 `"1970 Form 2 Neighborhood"', add
label define sample_lbl 197005 `"1970 Form 1 Neighborhood"', add
label define sample_lbl 197004 `"1970 Form 2 Metro"', add
label define sample_lbl 197003 `"1970 Form 1 Metro"', add
label define sample_lbl 197002 `"1970 Form 2 State"', add
label define sample_lbl 197001 `"1970 Form 1 State"', add
label define sample_lbl 196002 `"1960 5%"', add
label define sample_lbl 196001 `"1960 1%"', add
label define sample_lbl 195001 `"1950 1%"', add
label define sample_lbl 194002 `"1940 100% database"', add
label define sample_lbl 194001 `"1940 1%"', add
label define sample_lbl 193004 `"1930 100% database"', add
label define sample_lbl 193003 `"1930 Puerto Rico"', add
label define sample_lbl 193002 `"1930 5%"', add
label define sample_lbl 193001 `"1930 1%"', add
label define sample_lbl 192003 `"1920 100% database"', add
label define sample_lbl 192002 `"1920 Puerto Rico sample"', add
label define sample_lbl 192001 `"1920 1%"', add
label define sample_lbl 191004 `"1910 100% database"', add
label define sample_lbl 191003 `"1910 1.4% sample with oversamples"', add
label define sample_lbl 191002 `"1910 1%"', add
label define sample_lbl 191001 `"1910 Puerto Rico"', add
label define sample_lbl 190004 `"1900 100% database"', add
label define sample_lbl 190003 `"1900 1% sample with oversamples"', add
label define sample_lbl 190002 `"1900 1%"', add
label define sample_lbl 190001 `"1900 5%"', add
label define sample_lbl 188003 `"1880 100% database"', add
label define sample_lbl 188002 `"1880 10%"', add
label define sample_lbl 188001 `"1880 1%"', add
label define sample_lbl 187003 `"1870 100% database"', add
label define sample_lbl 187002 `"1870 1% sample with black oversample"', add
label define sample_lbl 187001 `"1870 1%"', add
label define sample_lbl 186003 `"1860 100% database"', add
label define sample_lbl 186002 `"1860 1% sample with black oversample"', add
label define sample_lbl 186001 `"1860 1%"', add
label define sample_lbl 185002 `"1850 100% database"', add
label define sample_lbl 185001 `"1850 1%"', add
label values sample sample_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 62 `"Massachusetts-Rhode Island"', add
label define statefip_lbl 63 `"Minnesota-Iowa-Missouri-Kansas-Nebraska-S.Dakota-N.Dakota"', add
label define statefip_lbl 64 `"Maryland-Delaware"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 66 `"Utah-Nevada"', add
label define statefip_lbl 67 `"Arizona-New Mexico"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 72 `"Puerto Rico"', add
label define statefip_lbl 97 `"Military/Mil. Reservation"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define met2013_lbl 00000 `"Not in identifiable area"'
label define met2013_lbl 10420 `"Akron, OH"', add
label define met2013_lbl 10580 `"Albany-Schenectady-Troy, NY"', add
label define met2013_lbl 10740 `"Albuquerque, NM"', add
label define met2013_lbl 10780 `"Alexandria, LA"', add
label define met2013_lbl 10900 `"Allentown-Bethlehem-Easton, PA-NJ"', add
label define met2013_lbl 11020 `"Altoona, PA"', add
label define met2013_lbl 11100 `"Amarillo, TX"', add
label define met2013_lbl 11260 `"Anchorage, AK"', add
label define met2013_lbl 11460 `"Ann Arbor, MI"', add
label define met2013_lbl 11500 `"Anniston-Oxford-Jacksonville, AL"', add
label define met2013_lbl 11700 `"Asheville, NC"', add
label define met2013_lbl 12020 `"Athens-Clarke County, GA"', add
label define met2013_lbl 12060 `"Atlanta-Sandy Springs-Roswell, GA"', add
label define met2013_lbl 12100 `"Atlantic City-Hammonton, NJ"', add
label define met2013_lbl 12220 `"Auburn-Opelika, AL"', add
label define met2013_lbl 12260 `"Augusta-Richmond County, GA-SC"', add
label define met2013_lbl 12420 `"Austin-Round Rock, TX"', add
label define met2013_lbl 12540 `"Bakersfield, CA"', add
label define met2013_lbl 12580 `"Baltimore-Columbia-Towson, MD"', add
label define met2013_lbl 12620 `"Bangor, ME"', add
label define met2013_lbl 12700 `"Barnstable Town, MA"', add
label define met2013_lbl 12940 `"Baton Rouge, LA"', add
label define met2013_lbl 12980 `"Battle Creek, MI"', add
label define met2013_lbl 13140 `"Beaumont-Port Arthur, TX"', add
label define met2013_lbl 13380 `"Bellingham, WA"', add
label define met2013_lbl 13460 `"Bend-Redmond, OR"', add
label define met2013_lbl 13740 `"Billings, MT"', add
label define met2013_lbl 13780 `"Binghamton, NY"', add
label define met2013_lbl 13820 `"Birmingham-Hoover, AL"', add
label define met2013_lbl 13900 `"Bismarck, ND"', add
label define met2013_lbl 13980 `"Blacksburg-Christiansburg-Radford, VA"', add
label define met2013_lbl 14010 `"Bloomington, IL"', add
label define met2013_lbl 14020 `"Bloomington, IN"', add
label define met2013_lbl 14260 `"Boise City, ID"', add
label define met2013_lbl 14460 `"Boston-Cambridge-Newton, MA-NH"', add
label define met2013_lbl 14740 `"Bremerton-Silverdale, WA"', add
label define met2013_lbl 14860 `"Bridgeport-Stamford-Norwalk, CT"', add
label define met2013_lbl 15180 `"Brownsville-Harlingen, TX"', add
label define met2013_lbl 15380 `"Buffalo-Cheektowaga-Niagara Falls, NY"', add
label define met2013_lbl 15500 `"Burlington, NC"', add
label define met2013_lbl 15540 `"Burlington-South Burlington, VT"', add
label define met2013_lbl 15940 `"Canton-Massillon, OH"', add
label define met2013_lbl 15980 `"Cape Coral-Fort Myers, FL"', add
label define met2013_lbl 16580 `"Champaign-Urbana, IL"', add
label define met2013_lbl 16620 `"Charleston, WV"', add
label define met2013_lbl 16700 `"Charleston-North Charleston, SC"', add
label define met2013_lbl 16740 `"Charlotte-Concord-Gastonia, NC-SC"', add
label define met2013_lbl 16820 `"Charlottesville, VA"', add
label define met2013_lbl 16860 `"Chattanooga, TN-GA"', add
label define met2013_lbl 16980 `"Chicago-Naperville-Elgin, IL-IN-WI"', add
label define met2013_lbl 17020 `"Chico, CA"', add
label define met2013_lbl 17140 `"Cincinnati, OH-KY-IN"', add
label define met2013_lbl 17300 `"Clarksville, TN-KY"', add
label define met2013_lbl 17460 `"Cleveland-Elyria, OH"', add
label define met2013_lbl 17660 `"Coeur d'Alene, ID"', add
label define met2013_lbl 17780 `"College Station-Bryan, TX"', add
label define met2013_lbl 17820 `"Colorado Springs, CO"', add
label define met2013_lbl 17860 `"Columbia, MO"', add
label define met2013_lbl 17900 `"Columbia, SC"', add
label define met2013_lbl 18140 `"Columbus, OH"', add
label define met2013_lbl 18580 `"Corpus Christi, TX"', add
label define met2013_lbl 19100 `"Dallas-Fort Worth-Arlington, TX"', add
label define met2013_lbl 19300 `"Daphne-Fairhope-Foley, AL"', add
label define met2013_lbl 19340 `"Davenport-Moline-Rock Island, IA-IL"', add
label define met2013_lbl 19380 `"Dayton, OH"', add
label define met2013_lbl 19460 `"Decatur, AL"', add
label define met2013_lbl 19500 `"Decatur, IL"', add
label define met2013_lbl 19660 `"Deltona-Daytona Beach-Ormond Beach, FL"', add
label define met2013_lbl 19740 `"Denver-Aurora-Lakewood, CO"', add
label define met2013_lbl 19780 `"Des Moines-West Des Moines, IA"', add
label define met2013_lbl 19820 `"Detroit-Warren-Dearborn, MI"', add
label define met2013_lbl 20100 `"Dover, DE"', add
label define met2013_lbl 20500 `"Durham-Chapel Hill, NC"', add
label define met2013_lbl 20700 `"East Stroudsburg, PA"', add
label define met2013_lbl 20740 `"Eau Claire, WI"', add
label define met2013_lbl 20940 `"El Centro, CA"', add
label define met2013_lbl 21060 `"Elizabethtown-Fort Knox, KY"', add
label define met2013_lbl 21140 `"Elkhart-Goshen, IN"', add
label define met2013_lbl 21340 `"El Paso, TX"', add
label define met2013_lbl 21500 `"Erie, PA"', add
label define met2013_lbl 21660 `"Eugene, OR"', add
label define met2013_lbl 21780 `"Evansville, IN-KY"', add
label define met2013_lbl 22140 `"Farmington, NM"', add
label define met2013_lbl 22180 `"Fayetteville, NC"', add
label define met2013_lbl 22220 `"Fayetteville-Springdale-Rogers, AR-MO"', add
label define met2013_lbl 22380 `"Flagstaff, AZ"', add
label define met2013_lbl 22420 `"Flint, MI"', add
label define met2013_lbl 22500 `"Florence, SC"', add
label define met2013_lbl 22520 `"Florence-Muscle Shoals, AL"', add
label define met2013_lbl 22660 `"Fort Collins, CO"', add
label define met2013_lbl 23060 `"Fort Wayne, IN"', add
label define met2013_lbl 23420 `"Fresno, CA"', add
label define met2013_lbl 23460 `"Gadsden, AL"', add
label define met2013_lbl 23540 `"Gainesville, FL"', add
label define met2013_lbl 23580 `"Gainesville, GA"', add
label define met2013_lbl 24020 `"Glens Falls, NY"', add
label define met2013_lbl 24140 `"Goldsboro, NC"', add
label define met2013_lbl 24300 `"Grand Junction, CO"', add
label define met2013_lbl 24340 `"Grand Rapids-Wyoming, MI"', add
label define met2013_lbl 24540 `"Greeley, CO"', add
label define met2013_lbl 24660 `"Greensboro-High Point, NC"', add
label define met2013_lbl 24780 `"Greenville, NC"', add
label define met2013_lbl 24860 `"Greenville-Anderson-Mauldin, SC"', add
label define met2013_lbl 25060 `"Gulfport-Biloxi-Pascagoula, MS"', add
label define met2013_lbl 25220 `"Hammond, LA"', add
label define met2013_lbl 25260 `"Hanford-Corcoran, CA"', add
label define met2013_lbl 25420 `"Harrisburg-Carlisle, PA"', add
label define met2013_lbl 25500 `"Harrisonburg, VA"', add
label define met2013_lbl 25540 `"Hartford-West Hartford-East Hartford, CT"', add
label define met2013_lbl 25620 `"Hattiesburg, MS"', add
label define met2013_lbl 25860 `"Hickory-Lenoir-Morganton, NC"', add
label define met2013_lbl 25940 `"Hilton Head Island-Bluffton-Beaufort, SC"', add
label define met2013_lbl 26140 `"Homosassa Springs, FL"', add
label define met2013_lbl 26380 `"Houma-Thibodaux, LA"', add
label define met2013_lbl 26420 `"Houston-The Woodlands-Sugar Land, TX"', add
label define met2013_lbl 26620 `"Huntsville, AL"', add
label define met2013_lbl 26900 `"Indianapolis-Carmel-Anderson, IN"', add
label define met2013_lbl 26980 `"Iowa City, IA"', add
label define met2013_lbl 27060 `"Ithaca, NY"', add
label define met2013_lbl 27100 `"Jackson, MI"', add
label define met2013_lbl 27140 `"Jackson, MS"', add
label define met2013_lbl 27180 `"Jackson, TN"', add
label define met2013_lbl 27260 `"Jacksonville, FL"', add
label define met2013_lbl 27340 `"Jacksonville, NC"', add
label define met2013_lbl 27500 `"Janesville-Beloit, WI"', add
label define met2013_lbl 27620 `"Jefferson City, MO"', add
label define met2013_lbl 27780 `"Johnstown, PA"', add
label define met2013_lbl 27900 `"Joplin, MO"', add
label define met2013_lbl 28020 `"Kalamazoo-Portage, MI"', add
label define met2013_lbl 28100 `"Kankakee, IL"', add
label define met2013_lbl 28140 `"Kansas City, MO-KS"', add
label define met2013_lbl 28420 `"Kennewick-Richland, WA"', add
label define met2013_lbl 28660 `"Killeen-Temple, TX"', add
label define met2013_lbl 28700 `"Kingsport-Bristol-Bristol, TN-VA"', add
label define met2013_lbl 28940 `"Knoxville, TN"', add
label define met2013_lbl 29100 `"La Crosse-Onalaska, WI-MN"', add
label define met2013_lbl 29180 `"Lafayette, LA"', add
label define met2013_lbl 29200 `"Lafayette-West Lafayette, IN"', add
label define met2013_lbl 29340 `"Lake Charles, LA"', add
label define met2013_lbl 29420 `"Lake Havasu City-Kingman, AZ"', add
label define met2013_lbl 29460 `"Lakeland-Winter Haven, FL"', add
label define met2013_lbl 29540 `"Lancaster, PA"', add
label define met2013_lbl 29620 `"Lansing-East Lansing, MI"', add
label define met2013_lbl 29700 `"Laredo, TX"', add
label define met2013_lbl 29740 `"Las Cruces, NM"', add
label define met2013_lbl 29820 `"Las Vegas-Henderson-Paradise, NV"', add
label define met2013_lbl 29940 `"Lawrence, KS"', add
label define met2013_lbl 30140 `"Lebanon, PA"', add
label define met2013_lbl 30340 `"Lewiston-Auburn, ME"', add
label define met2013_lbl 30620 `"Lima, OH"', add
label define met2013_lbl 30700 `"Lincoln, NE"', add
label define met2013_lbl 30780 `"Little Rock-North Little Rock-Conway, AR"', add
label define met2013_lbl 31080 `"Los Angeles-Long Beach-Anaheim, CA"', add
label define met2013_lbl 31140 `"Louisville/Jefferson County, KY-IN"', add
label define met2013_lbl 31180 `"Lubbock, TX"', add
label define met2013_lbl 31340 `"Lynchburg, VA"', add
label define met2013_lbl 31460 `"Madera, CA"', add
label define met2013_lbl 31700 `"Manchester-Nashua, NH"', add
label define met2013_lbl 31900 `"Mansfield, OH"', add
label define met2013_lbl 32420 `"Mayagüez, PR"', add
label define met2013_lbl 32580 `"McAllen-Edinburg-Mission, TX"', add
label define met2013_lbl 32780 `"Medford, OR"', add
label define met2013_lbl 32820 `"Memphis, TN-MS-AR"', add
label define met2013_lbl 32900 `"Merced, CA"', add
label define met2013_lbl 33100 `"Miami-Fort Lauderdale-West Palm Beach, FL"', add
label define met2013_lbl 33140 `"Michigan City-La Porte, IN"', add
label define met2013_lbl 33260 `"Midland, TX"', add
label define met2013_lbl 33340 `"Milwaukee-Waukesha-West Allis, WI"', add
label define met2013_lbl 33460 `"Minneapolis-St. Paul-Bloomington, MN-WI"', add
label define met2013_lbl 33660 `"Mobile, AL"', add
label define met2013_lbl 33700 `"Modesto, CA"', add
label define met2013_lbl 33740 `"Monroe, LA"', add
label define met2013_lbl 33780 `"Monroe, MI"', add
label define met2013_lbl 33860 `"Montgomery, AL"', add
label define met2013_lbl 34060 `"Morgantown, WV"', add
label define met2013_lbl 34620 `"Muncie, IN"', add
label define met2013_lbl 34740 `"Muskegon, MI"', add
label define met2013_lbl 34820 `"Myrtle Beach-Conway-North Myrtle Beach, SC-NC"', add
label define met2013_lbl 34900 `"Napa, CA"', add
label define met2013_lbl 34940 `"Naples-Immokalee-Marco Island, FL"', add
label define met2013_lbl 34980 `"Nashville-Davidson--Murfreesboro--Franklin, TN"', add
label define met2013_lbl 35300 `"New Haven-Milford, CT"', add
label define met2013_lbl 35380 `"New Orleans-Metairie, LA"', add
label define met2013_lbl 35620 `"New York-Newark-Jersey City, NY-NJ-PA"', add
label define met2013_lbl 35660 `"Niles-Benton Harbor, MI"', add
label define met2013_lbl 35840 `"North Port-Sarasota-Bradenton, FL"', add
label define met2013_lbl 35980 `"Norwich-New London, CT"', add
label define met2013_lbl 36100 `"Ocala, FL"', add
label define met2013_lbl 36140 `"Ocean City, NJ"', add
label define met2013_lbl 36220 `"Odessa, TX"', add
label define met2013_lbl 36260 `"Ogden-Clearfield, UT"', add
label define met2013_lbl 36420 `"Oklahoma City, OK"', add
label define met2013_lbl 36500 `"Olympia-Tumwater, WA"', add
label define met2013_lbl 36540 `"Omaha-Council Bluffs, NE-IA"', add
label define met2013_lbl 36740 `"Orlando-Kissimmee-Sanford, FL"', add
label define met2013_lbl 36780 `"Oshkosh-Neenah, WI"', add
label define met2013_lbl 36980 `"Owensboro, KY"', add
label define met2013_lbl 37100 `"Oxnard-Thousand Oaks-Ventura, CA"', add
label define met2013_lbl 37340 `"Palm Bay-Melbourne-Titusville, FL"', add
label define met2013_lbl 37460 `"Panama City, FL"', add
label define met2013_lbl 37620 `"Parkersburg-Vienna, WV"', add
label define met2013_lbl 37860 `"Pensacola-Ferry Pass-Brent, FL"', add
label define met2013_lbl 37900 `"Peoria, IL"', add
label define met2013_lbl 37980 `"Philadelphia-Camden-Wilmington, PA-NJ-DE-MD"', add
label define met2013_lbl 38060 `"Phoenix-Mesa-Scottsdale, AZ"', add
label define met2013_lbl 38300 `"Pittsburgh, PA"', add
label define met2013_lbl 38340 `"Pittsfield, MA"', add
label define met2013_lbl 38660 `"Ponce, PR"', add
label define met2013_lbl 38860 `"Portland-South Portland, ME"', add
label define met2013_lbl 38900 `"Portland-Vancouver-Hillsboro, OR-WA"', add
label define met2013_lbl 38940 `"Port St. Lucie, FL"', add
label define met2013_lbl 39140 `"Prescott, AZ"', add
label define met2013_lbl 39300 `"Providence-Warwick, RI-MA"', add
label define met2013_lbl 39340 `"Provo-Orem, UT"', add
label define met2013_lbl 39380 `"Pueblo, CO"', add
label define met2013_lbl 39460 `"Punta Gorda, FL"', add
label define met2013_lbl 39540 `"Racine, WI"', add
label define met2013_lbl 39580 `"Raleigh, NC"', add
label define met2013_lbl 39740 `"Reading, PA"', add
label define met2013_lbl 39820 `"Redding, CA"', add
label define met2013_lbl 39900 `"Reno, NV"', add
label define met2013_lbl 40060 `"Richmond, VA"', add
label define met2013_lbl 40140 `"Riverside-San Bernardino-Ontario, CA"', add
label define met2013_lbl 40220 `"Roanoke, VA"', add
label define met2013_lbl 40380 `"Rochester, NY"', add
label define met2013_lbl 40420 `"Rockford, IL"', add
label define met2013_lbl 40580 `"Rocky Mount, NC"', add
label define met2013_lbl 40900 `"Sacramento--Roseville--Arden-Arcade, CA"', add
label define met2013_lbl 40980 `"Saginaw, MI"', add
label define met2013_lbl 41060 `"St. Cloud, MN"', add
label define met2013_lbl 41100 `"St. George, UT"', add
label define met2013_lbl 41140 `"St. Joseph, MO-KS"', add
label define met2013_lbl 41180 `"St. Louis, MO-IL"', add
label define met2013_lbl 41500 `"Salinas, CA"', add
label define met2013_lbl 41540 `"Salisbury, MD-DE"', add
label define met2013_lbl 41620 `"Salt Lake City, UT"', add
label define met2013_lbl 41660 `"San Angelo, TX"', add
label define met2013_lbl 41700 `"San Antonio-New Braunfels, TX"', add
label define met2013_lbl 41740 `"San Diego-Carlsbad, CA"', add
label define met2013_lbl 41860 `"San Francisco-Oakland-Hayward, CA"', add
label define met2013_lbl 41900 `"San Germán, PR"', add
label define met2013_lbl 41940 `"San Jose-Sunnyvale-Santa Clara, CA"', add
label define met2013_lbl 41980 `"San Juan-Carolina-Caguas, PR"', add
label define met2013_lbl 42020 `"San Luis Obispo-Paso Robles-Arroyo Grande, CA"', add
label define met2013_lbl 42100 `"Santa Cruz-Watsonville, CA"', add
label define met2013_lbl 42140 `"Santa Fe, NM"', add
label define met2013_lbl 42200 `"Santa Maria-Santa Barbara, CA"', add
label define met2013_lbl 42220 `"Santa Rosa, CA"', add
label define met2013_lbl 42540 `"Scranton--Wilkes-Barre--Hazleton, PA"', add
label define met2013_lbl 42660 `"Seattle-Tacoma-Bellevue, WA"', add
label define met2013_lbl 42680 `"Sebastian-Vero Beach, FL"', add
label define met2013_lbl 43100 `"Sheboygan, WI"', add
label define met2013_lbl 43340 `"Shreveport-Bossier City, LA"', add
label define met2013_lbl 43900 `"Spartanburg, SC"', add
label define met2013_lbl 44060 `"Spokane-Spokane Valley, WA"', add
label define met2013_lbl 44100 `"Springfield, IL"', add
label define met2013_lbl 44140 `"Springfield, MA"', add
label define met2013_lbl 44180 `"Springfield, MO"', add
label define met2013_lbl 44220 `"Springfield, OH"', add
label define met2013_lbl 44300 `"State College, PA"', add
label define met2013_lbl 44700 `"Stockton-Lodi, CA"', add
label define met2013_lbl 44940 `"Sumter, SC"', add
label define met2013_lbl 45060 `"Syracuse, NY"', add
label define met2013_lbl 45220 `"Tallahassee, FL"', add
label define met2013_lbl 45300 `"Tampa-St. Petersburg-Clearwater, FL"', add
label define met2013_lbl 45460 `"Terre Haute, IN"', add
label define met2013_lbl 45780 `"Toledo, OH"', add
label define met2013_lbl 45820 `"Topeka, KS"', add
label define met2013_lbl 45940 `"Trenton, NJ"', add
label define met2013_lbl 46060 `"Tucson, AZ"', add
label define met2013_lbl 46220 `"Tuscaloosa, AL"', add
label define met2013_lbl 46340 `"Tyler, TX"', add
label define met2013_lbl 46520 `"Urban Honolulu, HI"', add
label define met2013_lbl 46540 `"Utica-Rome, NY"', add
label define met2013_lbl 46660 `"Valdosta, GA"', add
label define met2013_lbl 46700 `"Vallejo-Fairfield, CA"', add
label define met2013_lbl 47220 `"Vineland-Bridgeton, NJ"', add
label define met2013_lbl 47260 `"Virginia Beach-Norfolk-Newport News, VA-NC"', add
label define met2013_lbl 47300 `"Visalia-Porterville, CA"', add
label define met2013_lbl 47380 `"Waco, TX"', add
label define met2013_lbl 47900 `"Washington-Arlington-Alexandria, DC-VA-MD-WV"', add
label define met2013_lbl 48140 `"Wausau, WI"', add
label define met2013_lbl 48300 `"Wenatchee, WA"', add
label define met2013_lbl 48620 `"Wichita, KS"', add
label define met2013_lbl 48660 `"Wichita Falls, TX"', add
label define met2013_lbl 48700 `"Williamsport, PA"', add
label define met2013_lbl 48900 `"Wilmington, NC"', add
label define met2013_lbl 49180 `"Winston-Salem, NC"', add
label define met2013_lbl 49340 `"Worcester, MA-CT"', add
label define met2013_lbl 49420 `"Yakima, WA"', add
label define met2013_lbl 49620 `"York-Hanover, PA"', add
label define met2013_lbl 49660 `"Youngstown-Warren-Boardman, OH-PA"', add
label define met2013_lbl 49700 `"Yuba City, CA"', add
label define met2013_lbl 49740 `"Yuma, AZ"', add
label values met2013 met2013_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define bedrooms_lbl 00 `"N/A"'
label define bedrooms_lbl 01 `"No bedrooms"', add
label define bedrooms_lbl 02 `"1"', add
label define bedrooms_lbl 03 `"2"', add
label define bedrooms_lbl 04 `"3"', add
label define bedrooms_lbl 05 `"4 (1970-2000, 2000-2007 ACS/PRCS)"', add
label define bedrooms_lbl 06 `"5+ (1970-2000, 2000-2007 ACS/PRCS)"', add
label define bedrooms_lbl 07 `"6"', add
label define bedrooms_lbl 08 `"7"', add
label define bedrooms_lbl 09 `"8"', add
label define bedrooms_lbl 10 `"9"', add
label define bedrooms_lbl 11 `"10"', add
label define bedrooms_lbl 12 `"11"', add
label define bedrooms_lbl 13 `"12"', add
label define bedrooms_lbl 14 `"13"', add
label define bedrooms_lbl 15 `"14"', add
label define bedrooms_lbl 16 `"15"', add
label define bedrooms_lbl 17 `"16"', add
label define bedrooms_lbl 18 `"17"', add
label define bedrooms_lbl 19 `"18"', add
label define bedrooms_lbl 20 `"19"', add
label define bedrooms_lbl 21 `"20"', add
label define bedrooms_lbl 22 `"21"', add
label values bedrooms bedrooms_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define age_lbl 000 `"Less than 1 year old"'
label define age_lbl 001 `"1"', add
label define age_lbl 002 `"2"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90 (90+ in 1980 and 1990)"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100 (100+ in 1960-1970)"', add
label define age_lbl 101 `"101"', add
label define age_lbl 102 `"102"', add
label define age_lbl 103 `"103"', add
label define age_lbl 104 `"104"', add
label define age_lbl 105 `"105"', add
label define age_lbl 106 `"106"', add
label define age_lbl 107 `"107"', add
label define age_lbl 108 `"108"', add
label define age_lbl 109 `"109"', add
label define age_lbl 110 `"110"', add
label define age_lbl 111 `"111"', add
label define age_lbl 112 `"112 (112+ in the 1980 internal data)"', add
label define age_lbl 113 `"113"', add
label define age_lbl 114 `"114"', add
label define age_lbl 115 `"115 (115+ in the 1990 internal data)"', add
label define age_lbl 116 `"116"', add
label define age_lbl 117 `"117"', add
label define age_lbl 118 `"118"', add
label define age_lbl 119 `"119"', add
label define age_lbl 120 `"120"', add
label define age_lbl 121 `"121"', add
label define age_lbl 122 `"122"', add
label define age_lbl 123 `"123"', add
label define age_lbl 124 `"124"', add
label define age_lbl 125 `"125"', add
label define age_lbl 126 `"126"', add
label define age_lbl 129 `"129"', add
label define age_lbl 130 `"130"', add
label define age_lbl 135 `"135"', add
label values age age_lbl

label define race_lbl 1 `"White"'
label define race_lbl 2 `"Black/African American/Negro"', add
label define race_lbl 3 `"American Indian or Alaska Native"', add
label define race_lbl 4 `"Chinese"', add
label define race_lbl 5 `"Japanese"', add
label define race_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_lbl 7 `"Other race, nec"', add
label define race_lbl 8 `"Two major races"', add
label define race_lbl 9 `"Three or more major races"', add
label values race race_lbl

label define raced_lbl 100 `"White"'
label define raced_lbl 110 `"Spanish write_in"', add
label define raced_lbl 120 `"Blank (white) (1850)"', add
label define raced_lbl 130 `"Portuguese"', add
label define raced_lbl 140 `"Mexican (1930)"', add
label define raced_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_lbl 200 `"Black/African American/Negro"', add
label define raced_lbl 210 `"Mulatto"', add
label define raced_lbl 300 `"American Indian/Alaska Native"', add
label define raced_lbl 302 `"Apache"', add
label define raced_lbl 303 `"Blackfoot"', add
label define raced_lbl 304 `"Cherokee"', add
label define raced_lbl 305 `"Cheyenne"', add
label define raced_lbl 306 `"Chickasaw"', add
label define raced_lbl 307 `"Chippewa"', add
label define raced_lbl 308 `"Choctaw"', add
label define raced_lbl 309 `"Comanche"', add
label define raced_lbl 310 `"Creek"', add
label define raced_lbl 311 `"Crow"', add
label define raced_lbl 312 `"Iroquois"', add
label define raced_lbl 313 `"Kiowa"', add
label define raced_lbl 314 `"Lumbee"', add
label define raced_lbl 315 `"Navajo"', add
label define raced_lbl 316 `"Osage"', add
label define raced_lbl 317 `"Paiute"', add
label define raced_lbl 318 `"Pima"', add
label define raced_lbl 319 `"Potawatomi"', add
label define raced_lbl 320 `"Pueblo"', add
label define raced_lbl 321 `"Seminole"', add
label define raced_lbl 322 `"Shoshone"', add
label define raced_lbl 323 `"Sioux"', add
label define raced_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_lbl 325 `"Tohono O Odham"', add
label define raced_lbl 326 `"All other tribes (1990)"', add
label define raced_lbl 328 `"Hopi"', add
label define raced_lbl 329 `"Central American Indian"', add
label define raced_lbl 330 `"Spanish American Indian"', add
label define raced_lbl 350 `"Delaware"', add
label define raced_lbl 351 `"Latin American Indian"', add
label define raced_lbl 352 `"Puget Sound Salish"', add
label define raced_lbl 353 `"Yakama"', add
label define raced_lbl 354 `"Yaqui"', add
label define raced_lbl 355 `"Colville"', add
label define raced_lbl 356 `"Houma"', add
label define raced_lbl 357 `"Menominee"', add
label define raced_lbl 358 `"Yuman"', add
label define raced_lbl 359 `"South American Indian"', add
label define raced_lbl 360 `"Mexican American Indian"', add
label define raced_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_lbl 370 `"Alaskan Athabaskan"', add
label define raced_lbl 371 `"Aleut"', add
label define raced_lbl 372 `"Eskimo"', add
label define raced_lbl 373 `"Alaskan mixed"', add
label define raced_lbl 374 `"Inupiat"', add
label define raced_lbl 375 `"Yup'ik"', add
label define raced_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_lbl 399 `"Tribe not specified"', add
label define raced_lbl 400 `"Chinese"', add
label define raced_lbl 410 `"Taiwanese"', add
label define raced_lbl 420 `"Chinese and Taiwanese"', add
label define raced_lbl 500 `"Japanese"', add
label define raced_lbl 600 `"Filipino"', add
label define raced_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_lbl 620 `"Korean"', add
label define raced_lbl 630 `"Hawaiian"', add
label define raced_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_lbl 634 `"Hawaiian mixed"', add
label define raced_lbl 640 `"Vietnamese"', add
label define raced_lbl 641 `"Bhutanese"', add
label define raced_lbl 642 `"Mongolian"', add
label define raced_lbl 643 `"Nepalese"', add
label define raced_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_lbl 651 `"Asian only (CPS)"', add
label define raced_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_lbl 660 `"Cambodian"', add
label define raced_lbl 661 `"Hmong"', add
label define raced_lbl 662 `"Laotian"', add
label define raced_lbl 663 `"Thai"', add
label define raced_lbl 664 `"Bangladeshi"', add
label define raced_lbl 665 `"Burmese"', add
label define raced_lbl 666 `"Indonesian"', add
label define raced_lbl 667 `"Malaysian"', add
label define raced_lbl 668 `"Okinawan"', add
label define raced_lbl 669 `"Pakistani"', add
label define raced_lbl 670 `"Sri Lankan"', add
label define raced_lbl 671 `"Other Asian, n.e.c."', add
label define raced_lbl 672 `"Asian, not specified"', add
label define raced_lbl 673 `"Chinese and Japanese"', add
label define raced_lbl 674 `"Chinese and Filipino"', add
label define raced_lbl 675 `"Chinese and Vietnamese"', add
label define raced_lbl 676 `"Chinese and Asian write_in"', add
label define raced_lbl 677 `"Japanese and Filipino"', add
label define raced_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_lbl 679 `"Other Asian race combinations"', add
label define raced_lbl 680 `"Samoan"', add
label define raced_lbl 681 `"Tahitian"', add
label define raced_lbl 682 `"Tongan"', add
label define raced_lbl 683 `"Other Polynesian (1990)"', add
label define raced_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_lbl 685 `"Guamanian/Chamorro"', add
label define raced_lbl 686 `"Northern Mariana Islander"', add
label define raced_lbl 687 `"Palauan"', add
label define raced_lbl 688 `"Other Micronesian (1990)"', add
label define raced_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_lbl 690 `"Fijian"', add
label define raced_lbl 691 `"Other Melanesian (1990)"', add
label define raced_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_lbl 699 `"Pacific Islander, n.s."', add
label define raced_lbl 700 `"Other race, n.e.c."', add
label define raced_lbl 801 `"White and Black"', add
label define raced_lbl 802 `"White and AIAN"', add
label define raced_lbl 810 `"White and Asian"', add
label define raced_lbl 811 `"White and Chinese"', add
label define raced_lbl 812 `"White and Japanese"', add
label define raced_lbl 813 `"White and Filipino"', add
label define raced_lbl 814 `"White and Asian Indian"', add
label define raced_lbl 815 `"White and Korean"', add
label define raced_lbl 816 `"White and Vietnamese"', add
label define raced_lbl 817 `"White and Asian write_in"', add
label define raced_lbl 818 `"White and other Asian race(s)"', add
label define raced_lbl 819 `"White and two or more Asian groups"', add
label define raced_lbl 820 `"White and PI"', add
label define raced_lbl 821 `"White and Native Hawaiian"', add
label define raced_lbl 822 `"White and Samoan"', add
label define raced_lbl 823 `"White and Guamanian"', add
label define raced_lbl 824 `"White and PI write_in"', add
label define raced_lbl 825 `"White and other PI race(s)"', add
label define raced_lbl 826 `"White and other race write_in"', add
label define raced_lbl 827 `"White and other race, n.e.c."', add
label define raced_lbl 830 `"Black and AIAN"', add
label define raced_lbl 831 `"Black and Asian"', add
label define raced_lbl 832 `"Black and Chinese"', add
label define raced_lbl 833 `"Black and Japanese"', add
label define raced_lbl 834 `"Black and Filipino"', add
label define raced_lbl 835 `"Black and Asian Indian"', add
label define raced_lbl 836 `"Black and Korean"', add
label define raced_lbl 837 `"Black and Asian write_in"', add
label define raced_lbl 838 `"Black and other Asian race(s)"', add
label define raced_lbl 840 `"Black and PI"', add
label define raced_lbl 841 `"Black and PI write_in"', add
label define raced_lbl 842 `"Black and other PI race(s)"', add
label define raced_lbl 845 `"Black and other race write_in"', add
label define raced_lbl 850 `"AIAN and Asian"', add
label define raced_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_lbl 852 `"AIAN and Asian Indian"', add
label define raced_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_lbl 855 `"AIAN and PI"', add
label define raced_lbl 856 `"AIAN and other race write_in"', add
label define raced_lbl 860 `"Asian and PI"', add
label define raced_lbl 861 `"Chinese and Hawaiian"', add
label define raced_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_lbl 864 `"Filipino and Hawaiian"', add
label define raced_lbl 865 `"Filipino and PI write_in"', add
label define raced_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_lbl 880 `"Asian and other race write_in"', add
label define raced_lbl 881 `"Chinese and other race write_in"', add
label define raced_lbl 882 `"Japanese and other race write_in"', add
label define raced_lbl 883 `"Filipino and other race write_in"', add
label define raced_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_lbl 887 `"Chinese and Korean"', add
label define raced_lbl 890 `"PI and other race write_in:"', add
label define raced_lbl 891 `"PI write_in and other race write_in"', add
label define raced_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_lbl 893 `"Native Hawaiian or PI other race(s)"', add
label define raced_lbl 899 `"API and other race write_in"', add
label define raced_lbl 901 `"White, Black, AIAN"', add
label define raced_lbl 902 `"White, Black, Asian"', add
label define raced_lbl 903 `"White, Black, PI"', add
label define raced_lbl 904 `"White, Black, other race write_in"', add
label define raced_lbl 905 `"White, AIAN, Asian"', add
label define raced_lbl 906 `"White, AIAN, PI"', add
label define raced_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_lbl 910 `"White, Asian, PI"', add
label define raced_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_lbl 916 `"White, AIAN and Filipino"', add
label define raced_lbl 917 `"White, Black, and Filipino"', add
label define raced_lbl 920 `"White, Asian, other race write_in"', add
label define raced_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_lbl 925 `"White, PI, other race write_in"', add
label define raced_lbl 930 `"Black, AIAN, Asian"', add
label define raced_lbl 931 `"Black, AIAN, PI"', add
label define raced_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_lbl 933 `"Black, Asian, PI"', add
label define raced_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_lbl 935 `"Black, PI, other race write_in"', add
label define raced_lbl 940 `"AIAN, Asian, PI"', add
label define raced_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_lbl 953 `"White, Black, Asian, PI"', add
label define raced_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced raced_lbl

label define hispan_lbl 0 `"Not Hispanic"'
label define hispan_lbl 1 `"Mexican"', add
label define hispan_lbl 2 `"Puerto Rican"', add
label define hispan_lbl 3 `"Cuban"', add
label define hispan_lbl 4 `"Other"', add
label define hispan_lbl 9 `"Not Reported"', add
label values hispan hispan_lbl

label define hispand_lbl 000 `"Not Hispanic"'
label define hispand_lbl 100 `"Mexican"', add
label define hispand_lbl 102 `"Mexican American"', add
label define hispand_lbl 103 `"Mexicano/Mexicana"', add
label define hispand_lbl 104 `"Chicano/Chicana"', add
label define hispand_lbl 105 `"La Raza"', add
label define hispand_lbl 106 `"Mexican American Indian"', add
label define hispand_lbl 107 `"Mexico"', add
label define hispand_lbl 200 `"Puerto Rican"', add
label define hispand_lbl 300 `"Cuban"', add
label define hispand_lbl 401 `"Central American Indian"', add
label define hispand_lbl 402 `"Canal Zone"', add
label define hispand_lbl 411 `"Costa Rican"', add
label define hispand_lbl 412 `"Guatemalan"', add
label define hispand_lbl 413 `"Honduran"', add
label define hispand_lbl 414 `"Nicaraguan"', add
label define hispand_lbl 415 `"Panamanian"', add
label define hispand_lbl 416 `"Salvadoran"', add
label define hispand_lbl 417 `"Central American, n.e.c."', add
label define hispand_lbl 420 `"Argentinean"', add
label define hispand_lbl 421 `"Bolivian"', add
label define hispand_lbl 422 `"Chilean"', add
label define hispand_lbl 423 `"Colombian"', add
label define hispand_lbl 424 `"Ecuadorian"', add
label define hispand_lbl 425 `"Paraguayan"', add
label define hispand_lbl 426 `"Peruvian"', add
label define hispand_lbl 427 `"Uruguayan"', add
label define hispand_lbl 428 `"Venezuelan"', add
label define hispand_lbl 429 `"South American Indian"', add
label define hispand_lbl 430 `"Criollo"', add
label define hispand_lbl 431 `"South American, n.e.c."', add
label define hispand_lbl 450 `"Spaniard"', add
label define hispand_lbl 451 `"Andalusian"', add
label define hispand_lbl 452 `"Asturian"', add
label define hispand_lbl 453 `"Castillian"', add
label define hispand_lbl 454 `"Catalonian"', add
label define hispand_lbl 455 `"Balearic Islander"', add
label define hispand_lbl 456 `"Gallego"', add
label define hispand_lbl 457 `"Valencian"', add
label define hispand_lbl 458 `"Canarian"', add
label define hispand_lbl 459 `"Spanish Basque"', add
label define hispand_lbl 460 `"Dominican"', add
label define hispand_lbl 465 `"Latin American"', add
label define hispand_lbl 470 `"Hispanic"', add
label define hispand_lbl 480 `"Spanish"', add
label define hispand_lbl 490 `"Californio"', add
label define hispand_lbl 491 `"Tejano"', add
label define hispand_lbl 492 `"Nuevo Mexicano"', add
label define hispand_lbl 493 `"Spanish American"', add
label define hispand_lbl 494 `"Spanish American Indian"', add
label define hispand_lbl 495 `"Meso American Indian"', add
label define hispand_lbl 496 `"Mestizo"', add
label define hispand_lbl 498 `"Other, n.s."', add
label define hispand_lbl 499 `"Other, n.e.c."', add
label define hispand_lbl 900 `"Not Reported"', add
label values hispand hispand_lbl

label define bpl_lbl 001 `"Alabama"'
label define bpl_lbl 002 `"Alaska"', add
label define bpl_lbl 004 `"Arizona"', add
label define bpl_lbl 005 `"Arkansas"', add
label define bpl_lbl 006 `"California"', add
label define bpl_lbl 008 `"Colorado"', add
label define bpl_lbl 009 `"Connecticut"', add
label define bpl_lbl 010 `"Delaware"', add
label define bpl_lbl 011 `"District of Columbia"', add
label define bpl_lbl 012 `"Florida"', add
label define bpl_lbl 013 `"Georgia"', add
label define bpl_lbl 015 `"Hawaii"', add
label define bpl_lbl 016 `"Idaho"', add
label define bpl_lbl 017 `"Illinois"', add
label define bpl_lbl 018 `"Indiana"', add
label define bpl_lbl 019 `"Iowa"', add
label define bpl_lbl 020 `"Kansas"', add
label define bpl_lbl 021 `"Kentucky"', add
label define bpl_lbl 022 `"Louisiana"', add
label define bpl_lbl 023 `"Maine"', add
label define bpl_lbl 024 `"Maryland"', add
label define bpl_lbl 025 `"Massachusetts"', add
label define bpl_lbl 026 `"Michigan"', add
label define bpl_lbl 027 `"Minnesota"', add
label define bpl_lbl 028 `"Mississippi"', add
label define bpl_lbl 029 `"Missouri"', add
label define bpl_lbl 030 `"Montana"', add
label define bpl_lbl 031 `"Nebraska"', add
label define bpl_lbl 032 `"Nevada"', add
label define bpl_lbl 033 `"New Hampshire"', add
label define bpl_lbl 034 `"New Jersey"', add
label define bpl_lbl 035 `"New Mexico"', add
label define bpl_lbl 036 `"New York"', add
label define bpl_lbl 037 `"North Carolina"', add
label define bpl_lbl 038 `"North Dakota"', add
label define bpl_lbl 039 `"Ohio"', add
label define bpl_lbl 040 `"Oklahoma"', add
label define bpl_lbl 041 `"Oregon"', add
label define bpl_lbl 042 `"Pennsylvania"', add
label define bpl_lbl 044 `"Rhode Island"', add
label define bpl_lbl 045 `"South Carolina"', add
label define bpl_lbl 046 `"South Dakota"', add
label define bpl_lbl 047 `"Tennessee"', add
label define bpl_lbl 048 `"Texas"', add
label define bpl_lbl 049 `"Utah"', add
label define bpl_lbl 050 `"Vermont"', add
label define bpl_lbl 051 `"Virginia"', add
label define bpl_lbl 053 `"Washington"', add
label define bpl_lbl 054 `"West Virginia"', add
label define bpl_lbl 055 `"Wisconsin"', add
label define bpl_lbl 056 `"Wyoming"', add
label define bpl_lbl 090 `"Native American"', add
label define bpl_lbl 099 `"United States, ns"', add
label define bpl_lbl 100 `"American Samoa"', add
label define bpl_lbl 105 `"Guam"', add
label define bpl_lbl 110 `"Puerto Rico"', add
label define bpl_lbl 115 `"U.S. Virgin Islands"', add
label define bpl_lbl 120 `"Other US Possessions"', add
label define bpl_lbl 150 `"Canada"', add
label define bpl_lbl 155 `"St. Pierre and Miquelon"', add
label define bpl_lbl 160 `"Atlantic Islands"', add
label define bpl_lbl 199 `"North America, ns"', add
label define bpl_lbl 200 `"Mexico"', add
label define bpl_lbl 210 `"Central America"', add
label define bpl_lbl 250 `"Cuba"', add
label define bpl_lbl 260 `"West Indies"', add
label define bpl_lbl 299 `"Americas, n.s."', add
label define bpl_lbl 300 `"SOUTH AMERICA"', add
label define bpl_lbl 400 `"Denmark"', add
label define bpl_lbl 401 `"Finland"', add
label define bpl_lbl 402 `"Iceland"', add
label define bpl_lbl 403 `"Lapland, n.s."', add
label define bpl_lbl 404 `"Norway"', add
label define bpl_lbl 405 `"Sweden"', add
label define bpl_lbl 410 `"England"', add
label define bpl_lbl 411 `"Scotland"', add
label define bpl_lbl 412 `"Wales"', add
label define bpl_lbl 413 `"United Kingdom, ns"', add
label define bpl_lbl 414 `"Ireland"', add
label define bpl_lbl 419 `"Northern Europe, ns"', add
label define bpl_lbl 420 `"Belgium"', add
label define bpl_lbl 421 `"France"', add
label define bpl_lbl 422 `"Liechtenstein"', add
label define bpl_lbl 423 `"Luxembourg"', add
label define bpl_lbl 424 `"Monaco"', add
label define bpl_lbl 425 `"Netherlands"', add
label define bpl_lbl 426 `"Switzerland"', add
label define bpl_lbl 429 `"Western Europe, ns"', add
label define bpl_lbl 430 `"Albania"', add
label define bpl_lbl 431 `"Andorra"', add
label define bpl_lbl 432 `"Gibraltar"', add
label define bpl_lbl 433 `"Greece"', add
label define bpl_lbl 434 `"Italy"', add
label define bpl_lbl 435 `"Malta"', add
label define bpl_lbl 436 `"Portugal"', add
label define bpl_lbl 437 `"San Marino"', add
label define bpl_lbl 438 `"Spain"', add
label define bpl_lbl 439 `"Vatican City"', add
label define bpl_lbl 440 `"Southern Europe, ns"', add
label define bpl_lbl 450 `"Austria"', add
label define bpl_lbl 451 `"Bulgaria"', add
label define bpl_lbl 452 `"Czechoslovakia"', add
label define bpl_lbl 453 `"Germany"', add
label define bpl_lbl 454 `"Hungary"', add
label define bpl_lbl 455 `"Poland"', add
label define bpl_lbl 456 `"Romania"', add
label define bpl_lbl 457 `"Yugoslavia"', add
label define bpl_lbl 458 `"Central Europe, ns"', add
label define bpl_lbl 459 `"Eastern Europe, ns"', add
label define bpl_lbl 460 `"Estonia"', add
label define bpl_lbl 461 `"Latvia"', add
label define bpl_lbl 462 `"Lithuania"', add
label define bpl_lbl 463 `"Baltic States, ns"', add
label define bpl_lbl 465 `"Other USSR/Russia"', add
label define bpl_lbl 499 `"Europe, ns"', add
label define bpl_lbl 500 `"China"', add
label define bpl_lbl 501 `"Japan"', add
label define bpl_lbl 502 `"Korea"', add
label define bpl_lbl 509 `"East Asia, ns"', add
label define bpl_lbl 510 `"Brunei"', add
label define bpl_lbl 511 `"Cambodia (Kampuchea)"', add
label define bpl_lbl 512 `"Indonesia"', add
label define bpl_lbl 513 `"Laos"', add
label define bpl_lbl 514 `"Malaysia"', add
label define bpl_lbl 515 `"Philippines"', add
label define bpl_lbl 516 `"Singapore"', add
label define bpl_lbl 517 `"Thailand"', add
label define bpl_lbl 518 `"Vietnam"', add
label define bpl_lbl 519 `"Southeast Asia, ns"', add
label define bpl_lbl 520 `"Afghanistan"', add
label define bpl_lbl 521 `"India"', add
label define bpl_lbl 522 `"Iran"', add
label define bpl_lbl 523 `"Maldives"', add
label define bpl_lbl 524 `"Nepal"', add
label define bpl_lbl 530 `"Bahrain"', add
label define bpl_lbl 531 `"Cyprus"', add
label define bpl_lbl 532 `"Iraq"', add
label define bpl_lbl 533 `"Iraq/Saudi Arabia"', add
label define bpl_lbl 534 `"Israel/Palestine"', add
label define bpl_lbl 535 `"Jordan"', add
label define bpl_lbl 536 `"Kuwait"', add
label define bpl_lbl 537 `"Lebanon"', add
label define bpl_lbl 538 `"Oman"', add
label define bpl_lbl 539 `"Qatar"', add
label define bpl_lbl 540 `"Saudi Arabia"', add
label define bpl_lbl 541 `"Syria"', add
label define bpl_lbl 542 `"Turkey"', add
label define bpl_lbl 543 `"United Arab Emirates"', add
label define bpl_lbl 544 `"Yemen Arab Republic (North)"', add
label define bpl_lbl 545 `"Yemen, PDR (South)"', add
label define bpl_lbl 546 `"Persian Gulf States, n.s."', add
label define bpl_lbl 547 `"Middle East, ns"', add
label define bpl_lbl 548 `"Southwest Asia, nec/ns"', add
label define bpl_lbl 549 `"Asia Minor, ns"', add
label define bpl_lbl 550 `"South Asia, nec"', add
label define bpl_lbl 599 `"Asia, nec/ns"', add
label define bpl_lbl 600 `"AFRICA"', add
label define bpl_lbl 700 `"Australia and New Zealand"', add
label define bpl_lbl 710 `"Pacific Islands"', add
label define bpl_lbl 800 `"Antarctica, ns/nec"', add
label define bpl_lbl 900 `"Abroad (unknown) or at sea"', add
label define bpl_lbl 950 `"Other n.e.c."', add
label define bpl_lbl 999 `"Missing/blank"', add
label values bpl bpl_lbl

label define bpld_lbl 00100 `"Alabama"'
label define bpld_lbl 00200 `"Alaska"', add
label define bpld_lbl 00400 `"Arizona"', add
label define bpld_lbl 00500 `"Arkansas"', add
label define bpld_lbl 00600 `"California"', add
label define bpld_lbl 00800 `"Colorado"', add
label define bpld_lbl 00900 `"Connecticut"', add
label define bpld_lbl 01000 `"Delaware"', add
label define bpld_lbl 01100 `"District of Columbia"', add
label define bpld_lbl 01200 `"Florida"', add
label define bpld_lbl 01300 `"Georgia"', add
label define bpld_lbl 01500 `"Hawaii"', add
label define bpld_lbl 01600 `"Idaho"', add
label define bpld_lbl 01610 `"Idaho Territory"', add
label define bpld_lbl 01700 `"Illinois"', add
label define bpld_lbl 01800 `"Indiana"', add
label define bpld_lbl 01900 `"Iowa"', add
label define bpld_lbl 02000 `"Kansas"', add
label define bpld_lbl 02100 `"Kentucky"', add
label define bpld_lbl 02200 `"Louisiana"', add
label define bpld_lbl 02300 `"Maine"', add
label define bpld_lbl 02400 `"Maryland"', add
label define bpld_lbl 02500 `"Massachusetts"', add
label define bpld_lbl 02600 `"Michigan"', add
label define bpld_lbl 02700 `"Minnesota"', add
label define bpld_lbl 02800 `"Mississippi"', add
label define bpld_lbl 02900 `"Missouri"', add
label define bpld_lbl 03000 `"Montana"', add
label define bpld_lbl 03100 `"Nebraska"', add
label define bpld_lbl 03200 `"Nevada"', add
label define bpld_lbl 03300 `"New Hampshire"', add
label define bpld_lbl 03400 `"New Jersey"', add
label define bpld_lbl 03500 `"New Mexico"', add
label define bpld_lbl 03510 `"New Mexico Territory"', add
label define bpld_lbl 03600 `"New York"', add
label define bpld_lbl 03700 `"North Carolina"', add
label define bpld_lbl 03800 `"North Dakota"', add
label define bpld_lbl 03900 `"Ohio"', add
label define bpld_lbl 04000 `"Oklahoma"', add
label define bpld_lbl 04010 `"Indian Territory"', add
label define bpld_lbl 04100 `"Oregon"', add
label define bpld_lbl 04200 `"Pennsylvania"', add
label define bpld_lbl 04400 `"Rhode Island"', add
label define bpld_lbl 04500 `"South Carolina"', add
label define bpld_lbl 04600 `"South Dakota"', add
label define bpld_lbl 04610 `"Dakota Territory"', add
label define bpld_lbl 04700 `"Tennessee"', add
label define bpld_lbl 04800 `"Texas"', add
label define bpld_lbl 04900 `"Utah"', add
label define bpld_lbl 04910 `"Utah Territory"', add
label define bpld_lbl 05000 `"Vermont"', add
label define bpld_lbl 05100 `"Virginia"', add
label define bpld_lbl 05300 `"Washington"', add
label define bpld_lbl 05400 `"West Virginia"', add
label define bpld_lbl 05500 `"Wisconsin"', add
label define bpld_lbl 05600 `"Wyoming"', add
label define bpld_lbl 05610 `"Wyoming Territory"', add
label define bpld_lbl 09000 `"Native American"', add
label define bpld_lbl 09900 `"United States, ns"', add
label define bpld_lbl 10000 `"American Samoa"', add
label define bpld_lbl 10010 `"Samoa, 1940-1950"', add
label define bpld_lbl 10500 `"Guam"', add
label define bpld_lbl 11000 `"Puerto Rico"', add
label define bpld_lbl 11500 `"U.S. Virgin Islands"', add
label define bpld_lbl 11510 `"St. Croix"', add
label define bpld_lbl 11520 `"St. John"', add
label define bpld_lbl 11530 `"St. Thomas"', add
label define bpld_lbl 12000 `"Other US Possessions:"', add
label define bpld_lbl 12010 `"Johnston Atoll"', add
label define bpld_lbl 12020 `"Midway Islands"', add
label define bpld_lbl 12030 `"Wake Island"', add
label define bpld_lbl 12040 `"Other US Caribbean Islands"', add
label define bpld_lbl 12041 `"Navassa Island"', add
label define bpld_lbl 12050 `"Other US Pacific Islands"', add
label define bpld_lbl 12051 `"Baker Island"', add
label define bpld_lbl 12052 `"Howland Island"', add
label define bpld_lbl 12053 `"Jarvis Island"', add
label define bpld_lbl 12054 `"Kingman Reef"', add
label define bpld_lbl 12055 `"Palmyra Atoll"', add
label define bpld_lbl 12056 `"Canton and Enderbury Island"', add
label define bpld_lbl 12090 `"US outlying areas, ns"', add
label define bpld_lbl 12091 `"US possessions, ns"', add
label define bpld_lbl 12092 `"US territory, ns"', add
label define bpld_lbl 15000 `"Canada"', add
label define bpld_lbl 15010 `"English Canada"', add
label define bpld_lbl 15011 `"British Columbia"', add
label define bpld_lbl 15013 `"Alberta"', add
label define bpld_lbl 15015 `"Saskatchewan"', add
label define bpld_lbl 15017 `"Northwest"', add
label define bpld_lbl 15019 `"Ruperts Land"', add
label define bpld_lbl 15020 `"Manitoba"', add
label define bpld_lbl 15021 `"Red River"', add
label define bpld_lbl 15030 `"Ontario/Upper Canada"', add
label define bpld_lbl 15031 `"Upper Canada"', add
label define bpld_lbl 15032 `"Canada West"', add
label define bpld_lbl 15040 `"New Brunswick"', add
label define bpld_lbl 15050 `"Nova Scotia"', add
label define bpld_lbl 15051 `"Cape Breton"', add
label define bpld_lbl 15052 `"Halifax"', add
label define bpld_lbl 15060 `"Prince Edward Island"', add
label define bpld_lbl 15070 `"Newfoundland"', add
label define bpld_lbl 15080 `"French Canada"', add
label define bpld_lbl 15081 `"Quebec"', add
label define bpld_lbl 15082 `"Lower Canada"', add
label define bpld_lbl 15083 `"Canada East"', add
label define bpld_lbl 15500 `"St. Pierre and Miquelon"', add
label define bpld_lbl 16000 `"Atlantic Islands"', add
label define bpld_lbl 16010 `"Bermuda"', add
label define bpld_lbl 16020 `"Cape Verde"', add
label define bpld_lbl 16030 `"Falkland Islands"', add
label define bpld_lbl 16040 `"Greenland"', add
label define bpld_lbl 16050 `"St. Helena and Ascension"', add
label define bpld_lbl 16060 `"Canary Islands"', add
label define bpld_lbl 19900 `"North America, ns"', add
label define bpld_lbl 20000 `"Mexico"', add
label define bpld_lbl 21000 `"Central America"', add
label define bpld_lbl 21010 `"Belize/British Honduras"', add
label define bpld_lbl 21020 `"Costa Rica"', add
label define bpld_lbl 21030 `"El Salvador"', add
label define bpld_lbl 21040 `"Guatemala"', add
label define bpld_lbl 21050 `"Honduras"', add
label define bpld_lbl 21060 `"Nicaragua"', add
label define bpld_lbl 21070 `"Panama"', add
label define bpld_lbl 21071 `"Canal Zone"', add
label define bpld_lbl 21090 `"Central America, ns"', add
label define bpld_lbl 25000 `"Cuba"', add
label define bpld_lbl 26000 `"West Indies"', add
label define bpld_lbl 26010 `"Dominican Republic"', add
label define bpld_lbl 26020 `"Haiti"', add
label define bpld_lbl 26030 `"Jamaica"', add
label define bpld_lbl 26040 `"British West Indies"', add
label define bpld_lbl 26041 `"Anguilla"', add
label define bpld_lbl 26042 `"Antigua-Barbuda"', add
label define bpld_lbl 26043 `"Bahamas"', add
label define bpld_lbl 26044 `"Barbados"', add
label define bpld_lbl 26045 `"British Virgin Islands"', add
label define bpld_lbl 26046 `"Anegada"', add
label define bpld_lbl 26047 `"Cooper"', add
label define bpld_lbl 26048 `"Jost Van Dyke"', add
label define bpld_lbl 26049 `"Peter"', add
label define bpld_lbl 26050 `"Tortola"', add
label define bpld_lbl 26051 `"Virgin Gorda"', add
label define bpld_lbl 26052 `"Br. Virgin Islands, ns"', add
label define bpld_lbl 26053 `"Cayman Islands"', add
label define bpld_lbl 26054 `"Dominica"', add
label define bpld_lbl 26055 `"Grenada"', add
label define bpld_lbl 26056 `"Montserrat"', add
label define bpld_lbl 26057 `"St. Kitts-Nevis"', add
label define bpld_lbl 26058 `"St. Lucia"', add
label define bpld_lbl 26059 `"St. Vincent"', add
label define bpld_lbl 26060 `"Trinidad and Tobago"', add
label define bpld_lbl 26061 `"Turks and Caicos"', add
label define bpld_lbl 26069 `"Br. Virgin Islands, ns"', add
label define bpld_lbl 26070 `"Other West Indies"', add
label define bpld_lbl 26071 `"Aruba"', add
label define bpld_lbl 26072 `"Netherlands Antilles"', add
label define bpld_lbl 26073 `"Bonaire"', add
label define bpld_lbl 26074 `"Curacao"', add
label define bpld_lbl 26075 `"Dutch St. Maarten"', add
label define bpld_lbl 26076 `"Saba"', add
label define bpld_lbl 26077 `"St. Eustatius"', add
label define bpld_lbl 26079 `"Dutch Caribbean, ns"', add
label define bpld_lbl 26080 `"French St. Maarten"', add
label define bpld_lbl 26081 `"Guadeloupe"', add
label define bpld_lbl 26082 `"Martinique"', add
label define bpld_lbl 26083 `"St. Barthelemy"', add
label define bpld_lbl 26089 `"French Caribbean, ns"', add
label define bpld_lbl 26090 `"Antilles, ns"', add
label define bpld_lbl 26091 `"Caribbean, ns"', add
label define bpld_lbl 26092 `"Latin America, ns"', add
label define bpld_lbl 26093 `"Leeward Islands, ns"', add
label define bpld_lbl 26094 `"West Indies, ns"', add
label define bpld_lbl 26095 `"Windward Islands, ns"', add
label define bpld_lbl 29900 `"Americas, ns"', add
label define bpld_lbl 30000 `"South America"', add
label define bpld_lbl 30005 `"Argentina"', add
label define bpld_lbl 30010 `"Bolivia"', add
label define bpld_lbl 30015 `"Brazil"', add
label define bpld_lbl 30020 `"Chile"', add
label define bpld_lbl 30025 `"Colombia"', add
label define bpld_lbl 30030 `"Ecuador"', add
label define bpld_lbl 30035 `"French Guiana"', add
label define bpld_lbl 30040 `"Guyana/British Guiana"', add
label define bpld_lbl 30045 `"Paraguay"', add
label define bpld_lbl 30050 `"Peru"', add
label define bpld_lbl 30055 `"Suriname"', add
label define bpld_lbl 30060 `"Uruguay"', add
label define bpld_lbl 30065 `"Venezuela"', add
label define bpld_lbl 30090 `"South America, ns"', add
label define bpld_lbl 30091 `"South and Central America, n.s."', add
label define bpld_lbl 40000 `"Denmark"', add
label define bpld_lbl 40010 `"Faeroe Islands"', add
label define bpld_lbl 40100 `"Finland"', add
label define bpld_lbl 40200 `"Iceland"', add
label define bpld_lbl 40300 `"Lapland, ns"', add
label define bpld_lbl 40400 `"Norway"', add
label define bpld_lbl 40410 `"Svalbard and Jan Meyen"', add
label define bpld_lbl 40411 `"Svalbard"', add
label define bpld_lbl 40412 `"Jan Meyen"', add
label define bpld_lbl 40500 `"Sweden"', add
label define bpld_lbl 41000 `"England"', add
label define bpld_lbl 41010 `"Channel Islands"', add
label define bpld_lbl 41011 `"Guernsey"', add
label define bpld_lbl 41012 `"Jersey"', add
label define bpld_lbl 41020 `"Isle of Man"', add
label define bpld_lbl 41100 `"Scotland"', add
label define bpld_lbl 41200 `"Wales"', add
label define bpld_lbl 41300 `"United Kingdom, ns"', add
label define bpld_lbl 41400 `"Ireland"', add
label define bpld_lbl 41410 `"Northern Ireland"', add
label define bpld_lbl 41900 `"Northern Europe, ns"', add
label define bpld_lbl 42000 `"Belgium"', add
label define bpld_lbl 42100 `"France"', add
label define bpld_lbl 42110 `"Alsace-Lorraine"', add
label define bpld_lbl 42111 `"Alsace"', add
label define bpld_lbl 42112 `"Lorraine"', add
label define bpld_lbl 42200 `"Liechtenstein"', add
label define bpld_lbl 42300 `"Luxembourg"', add
label define bpld_lbl 42400 `"Monaco"', add
label define bpld_lbl 42500 `"Netherlands"', add
label define bpld_lbl 42600 `"Switzerland"', add
label define bpld_lbl 42900 `"Western Europe, ns"', add
label define bpld_lbl 43000 `"Albania"', add
label define bpld_lbl 43100 `"Andorra"', add
label define bpld_lbl 43200 `"Gibraltar"', add
label define bpld_lbl 43300 `"Greece"', add
label define bpld_lbl 43310 `"Dodecanese Islands"', add
label define bpld_lbl 43320 `"Turkey Greece"', add
label define bpld_lbl 43330 `"Macedonia"', add
label define bpld_lbl 43400 `"Italy"', add
label define bpld_lbl 43500 `"Malta"', add
label define bpld_lbl 43600 `"Portugal"', add
label define bpld_lbl 43610 `"Azores"', add
label define bpld_lbl 43620 `"Madeira Islands"', add
label define bpld_lbl 43630 `"Cape Verde Islands"', add
label define bpld_lbl 43640 `"St. Miguel"', add
label define bpld_lbl 43700 `"San Marino"', add
label define bpld_lbl 43800 `"Spain"', add
label define bpld_lbl 43900 `"Vatican City"', add
label define bpld_lbl 44000 `"Southern Europe, ns"', add
label define bpld_lbl 45000 `"Austria"', add
label define bpld_lbl 45010 `"Austria-Hungary"', add
label define bpld_lbl 45020 `"Austria-Graz"', add
label define bpld_lbl 45030 `"Austria-Linz"', add
label define bpld_lbl 45040 `"Austria-Salzburg"', add
label define bpld_lbl 45050 `"Austria-Tyrol"', add
label define bpld_lbl 45060 `"Austria-Vienna"', add
label define bpld_lbl 45070 `"Austria-Kaernsten"', add
label define bpld_lbl 45080 `"Austria-Neustadt"', add
label define bpld_lbl 45100 `"Bulgaria"', add
label define bpld_lbl 45200 `"Czechoslovakia"', add
label define bpld_lbl 45210 `"Bohemia"', add
label define bpld_lbl 45211 `"Bohemia-Moravia"', add
label define bpld_lbl 45212 `"Slovakia"', add
label define bpld_lbl 45213 `"Czech Republic"', add
label define bpld_lbl 45300 `"Germany"', add
label define bpld_lbl 45301 `"Berlin"', add
label define bpld_lbl 45302 `"West Berlin"', add
label define bpld_lbl 45303 `"East Berlin"', add
label define bpld_lbl 45310 `"West Germany"', add
label define bpld_lbl 45311 `"Baden"', add
label define bpld_lbl 45312 `"Bavaria"', add
label define bpld_lbl 45313 `"Braunschweig"', add
label define bpld_lbl 45314 `"Bremen"', add
label define bpld_lbl 45315 `"Hamburg"', add
label define bpld_lbl 45316 `"Hanover"', add
label define bpld_lbl 45317 `"Hessen"', add
label define bpld_lbl 45318 `"Hesse-Nassau"', add
label define bpld_lbl 45319 `"Lippe"', add
label define bpld_lbl 45320 `"Lubeck"', add
label define bpld_lbl 45321 `"Oldenburg"', add
label define bpld_lbl 45322 `"Rheinland"', add
label define bpld_lbl 45323 `"Schaumburg-Lippe"', add
label define bpld_lbl 45324 `"Schleswig"', add
label define bpld_lbl 45325 `"Sigmaringen"', add
label define bpld_lbl 45326 `"Schwarzburg"', add
label define bpld_lbl 45327 `"Westphalia"', add
label define bpld_lbl 45328 `"Wurttemberg"', add
label define bpld_lbl 45329 `"Waldeck"', add
label define bpld_lbl 45330 `"Wittenberg"', add
label define bpld_lbl 45331 `"Frankfurt"', add
label define bpld_lbl 45332 `"Saarland"', add
label define bpld_lbl 45333 `"Nordrhein-Westfalen"', add
label define bpld_lbl 45340 `"East Germany"', add
label define bpld_lbl 45341 `"Anhalt"', add
label define bpld_lbl 45342 `"Brandenburg"', add
label define bpld_lbl 45344 `"Kingdom of Saxony"', add
label define bpld_lbl 45345 `"Mecklenburg"', add
label define bpld_lbl 45346 `"Saxony"', add
label define bpld_lbl 45347 `"Thuringian States"', add
label define bpld_lbl 45348 `"Sachsen-Meiningen"', add
label define bpld_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define bpld_lbl 45350 `"Probable Saxony"', add
label define bpld_lbl 45351 `"Schwerin"', add
label define bpld_lbl 45352 `"Strelitz"', add
label define bpld_lbl 45353 `"Probably Thuringian States"', add
label define bpld_lbl 45360 `"Prussia, nec"', add
label define bpld_lbl 45361 `"Hohenzollern"', add
label define bpld_lbl 45362 `"Niedersachsen"', add
label define bpld_lbl 45400 `"Hungary"', add
label define bpld_lbl 45500 `"Poland"', add
label define bpld_lbl 45510 `"Austrian Poland"', add
label define bpld_lbl 45511 `"Galicia"', add
label define bpld_lbl 45520 `"German Poland"', add
label define bpld_lbl 45521 `"East Prussia"', add
label define bpld_lbl 45522 `"Pomerania"', add
label define bpld_lbl 45523 `"Posen"', add
label define bpld_lbl 45524 `"Prussian Poland"', add
label define bpld_lbl 45525 `"Silesia"', add
label define bpld_lbl 45526 `"West Prussia"', add
label define bpld_lbl 45530 `"Russian Poland"', add
label define bpld_lbl 45600 `"Romania"', add
label define bpld_lbl 45610 `"Transylvania"', add
label define bpld_lbl 45700 `"Yugoslavia"', add
label define bpld_lbl 45710 `"Croatia"', add
label define bpld_lbl 45720 `"Montenegro"', add
label define bpld_lbl 45730 `"Serbia"', add
label define bpld_lbl 45740 `"Bosnia"', add
label define bpld_lbl 45750 `"Dalmatia"', add
label define bpld_lbl 45760 `"Slovonia"', add
label define bpld_lbl 45770 `"Carniola"', add
label define bpld_lbl 45780 `"Slovenia"', add
label define bpld_lbl 45790 `"Kosovo"', add
label define bpld_lbl 45800 `"Central Europe, ns"', add
label define bpld_lbl 45900 `"Eastern Europe, ns"', add
label define bpld_lbl 46000 `"Estonia"', add
label define bpld_lbl 46100 `"Latvia"', add
label define bpld_lbl 46200 `"Lithuania"', add
label define bpld_lbl 46300 `"Baltic States, ns"', add
label define bpld_lbl 46500 `"Other USSR/Russia"', add
label define bpld_lbl 46510 `"Byelorussia"', add
label define bpld_lbl 46520 `"Moldavia"', add
label define bpld_lbl 46521 `"Bessarabia"', add
label define bpld_lbl 46530 `"Ukraine"', add
label define bpld_lbl 46540 `"Armenia"', add
label define bpld_lbl 46541 `"Azerbaijan"', add
label define bpld_lbl 46542 `"Republic of Georgia"', add
label define bpld_lbl 46543 `"Kazakhstan"', add
label define bpld_lbl 46544 `"Kirghizia"', add
label define bpld_lbl 46545 `"Tadzhik"', add
label define bpld_lbl 46546 `"Turkmenistan"', add
label define bpld_lbl 46547 `"Uzbekistan"', add
label define bpld_lbl 46548 `"Siberia"', add
label define bpld_lbl 46590 `"USSR, ns"', add
label define bpld_lbl 49900 `"Europe, ns."', add
label define bpld_lbl 50000 `"China"', add
label define bpld_lbl 50010 `"Hong Kong"', add
label define bpld_lbl 50020 `"Macau"', add
label define bpld_lbl 50030 `"Mongolia"', add
label define bpld_lbl 50040 `"Taiwan"', add
label define bpld_lbl 50100 `"Japan"', add
label define bpld_lbl 50200 `"Korea"', add
label define bpld_lbl 50210 `"North Korea"', add
label define bpld_lbl 50220 `"South Korea"', add
label define bpld_lbl 50900 `"East Asia, ns"', add
label define bpld_lbl 51000 `"Brunei"', add
label define bpld_lbl 51100 `"Cambodia (Kampuchea)"', add
label define bpld_lbl 51200 `"Indonesia"', add
label define bpld_lbl 51210 `"East Indies"', add
label define bpld_lbl 51220 `"East Timor"', add
label define bpld_lbl 51300 `"Laos"', add
label define bpld_lbl 51400 `"Malaysia"', add
label define bpld_lbl 51500 `"Philippines"', add
label define bpld_lbl 51600 `"Singapore"', add
label define bpld_lbl 51700 `"Thailand"', add
label define bpld_lbl 51800 `"Vietnam"', add
label define bpld_lbl 51900 `"Southeast Asia, ns"', add
label define bpld_lbl 51910 `"Indochina, ns"', add
label define bpld_lbl 52000 `"Afghanistan"', add
label define bpld_lbl 52100 `"India"', add
label define bpld_lbl 52110 `"Bangladesh"', add
label define bpld_lbl 52120 `"Bhutan"', add
label define bpld_lbl 52130 `"Burma (Myanmar)"', add
label define bpld_lbl 52140 `"Pakistan"', add
label define bpld_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define bpld_lbl 52200 `"Iran"', add
label define bpld_lbl 52300 `"Maldives"', add
label define bpld_lbl 52400 `"Nepal"', add
label define bpld_lbl 53000 `"Bahrain"', add
label define bpld_lbl 53100 `"Cyprus"', add
label define bpld_lbl 53200 `"Iraq"', add
label define bpld_lbl 53210 `"Mesopotamia"', add
label define bpld_lbl 53300 `"Iraq/Saudi Arabia"', add
label define bpld_lbl 53400 `"Israel/Palestine"', add
label define bpld_lbl 53410 `"Gaza Strip"', add
label define bpld_lbl 53420 `"Palestine"', add
label define bpld_lbl 53430 `"West Bank"', add
label define bpld_lbl 53440 `"Israel"', add
label define bpld_lbl 53500 `"Jordan"', add
label define bpld_lbl 53600 `"Kuwait"', add
label define bpld_lbl 53700 `"Lebanon"', add
label define bpld_lbl 53800 `"Oman"', add
label define bpld_lbl 53900 `"Qatar"', add
label define bpld_lbl 54000 `"Saudi Arabia"', add
label define bpld_lbl 54100 `"Syria"', add
label define bpld_lbl 54200 `"Turkey"', add
label define bpld_lbl 54210 `"European Turkey"', add
label define bpld_lbl 54220 `"Asian Turkey"', add
label define bpld_lbl 54300 `"United Arab Emirates"', add
label define bpld_lbl 54400 `"Yemen Arab Republic (North)"', add
label define bpld_lbl 54500 `"Yemen, PDR (South)"', add
label define bpld_lbl 54600 `"Persian Gulf States, ns"', add
label define bpld_lbl 54700 `"Middle East, ns"', add
label define bpld_lbl 54800 `"Southwest Asia, nec/ns"', add
label define bpld_lbl 54900 `"Asia Minor, ns"', add
label define bpld_lbl 55000 `"South Asia, nec"', add
label define bpld_lbl 59900 `"Asia, nec/ns"', add
label define bpld_lbl 60000 `"Africa"', add
label define bpld_lbl 60010 `"Northern Africa"', add
label define bpld_lbl 60011 `"Algeria"', add
label define bpld_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpld_lbl 60013 `"Libya"', add
label define bpld_lbl 60014 `"Morocco"', add
label define bpld_lbl 60015 `"Sudan"', add
label define bpld_lbl 60016 `"Tunisia"', add
label define bpld_lbl 60017 `"Western Sahara"', add
label define bpld_lbl 60019 `"North Africa, ns"', add
label define bpld_lbl 60020 `"Benin"', add
label define bpld_lbl 60021 `"Burkina Faso"', add
label define bpld_lbl 60022 `"Gambia"', add
label define bpld_lbl 60023 `"Ghana"', add
label define bpld_lbl 60024 `"Guinea"', add
label define bpld_lbl 60025 `"Guinea-Bissau"', add
label define bpld_lbl 60026 `"Ivory Coast"', add
label define bpld_lbl 60027 `"Liberia"', add
label define bpld_lbl 60028 `"Mali"', add
label define bpld_lbl 60029 `"Mauritania"', add
label define bpld_lbl 60030 `"Niger"', add
label define bpld_lbl 60031 `"Nigeria"', add
label define bpld_lbl 60032 `"Senegal"', add
label define bpld_lbl 60033 `"Sierra Leone"', add
label define bpld_lbl 60034 `"Togo"', add
label define bpld_lbl 60038 `"Western Africa, ns"', add
label define bpld_lbl 60039 `"French West Africa, ns"', add
label define bpld_lbl 60040 `"British Indian Ocean Territory"', add
label define bpld_lbl 60041 `"Burundi"', add
label define bpld_lbl 60042 `"Comoros"', add
label define bpld_lbl 60043 `"Djibouti"', add
label define bpld_lbl 60044 `"Ethiopia"', add
label define bpld_lbl 60045 `"Kenya"', add
label define bpld_lbl 60046 `"Madagascar"', add
label define bpld_lbl 60047 `"Malawi"', add
label define bpld_lbl 60048 `"Mauritius"', add
label define bpld_lbl 60049 `"Mozambique"', add
label define bpld_lbl 60050 `"Reunion"', add
label define bpld_lbl 60051 `"Rwanda"', add
label define bpld_lbl 60052 `"Seychelles"', add
label define bpld_lbl 60053 `"Somalia"', add
label define bpld_lbl 60054 `"Tanzania"', add
label define bpld_lbl 60055 `"Uganda"', add
label define bpld_lbl 60056 `"Zambia"', add
label define bpld_lbl 60057 `"Zimbabwe"', add
label define bpld_lbl 60058 `"Bassas de India"', add
label define bpld_lbl 60059 `"Europa"', add
label define bpld_lbl 60060 `"Gloriosos"', add
label define bpld_lbl 60061 `"Juan de Nova"', add
label define bpld_lbl 60062 `"Mayotte"', add
label define bpld_lbl 60063 `"Tromelin"', add
label define bpld_lbl 60064 `"Eastern Africa, nec/ns"', add
label define bpld_lbl 60065 `"Eritrea"', add
label define bpld_lbl 60066 `"South Sudan"', add
label define bpld_lbl 60070 `"Central Africa"', add
label define bpld_lbl 60071 `"Angola"', add
label define bpld_lbl 60072 `"Cameroon"', add
label define bpld_lbl 60073 `"Central African Republic"', add
label define bpld_lbl 60074 `"Chad"', add
label define bpld_lbl 60075 `"Congo"', add
label define bpld_lbl 60076 `"Equatorial Guinea"', add
label define bpld_lbl 60077 `"Gabon"', add
label define bpld_lbl 60078 `"Sao Tome and Principe"', add
label define bpld_lbl 60079 `"Zaire"', add
label define bpld_lbl 60080 `"Central Africa, ns"', add
label define bpld_lbl 60081 `"Equatorial Africa, ns"', add
label define bpld_lbl 60082 `"French Equatorial Africa, ns"', add
label define bpld_lbl 60090 `"Southern Africa"', add
label define bpld_lbl 60091 `"Botswana"', add
label define bpld_lbl 60092 `"Lesotho"', add
label define bpld_lbl 60093 `"Namibia"', add
label define bpld_lbl 60094 `"South Africa (Union of)"', add
label define bpld_lbl 60095 `"Swaziland"', add
label define bpld_lbl 60096 `"Southern Africa, ns"', add
label define bpld_lbl 60099 `"Africa, ns/nec"', add
label define bpld_lbl 70000 `"Australia and New Zealand"', add
label define bpld_lbl 70010 `"Australia"', add
label define bpld_lbl 70011 `"Ashmore and Cartier Islands"', add
label define bpld_lbl 70012 `"Coral Sea Islands Territory"', add
label define bpld_lbl 70013 `"Christmas Island"', add
label define bpld_lbl 70014 `"Cocos Islands"', add
label define bpld_lbl 70020 `"New Zealand"', add
label define bpld_lbl 71000 `"Pacific Islands"', add
label define bpld_lbl 71010 `"New Caledonia"', add
label define bpld_lbl 71012 `"Papua New Guinea"', add
label define bpld_lbl 71013 `"Solomon Islands"', add
label define bpld_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define bpld_lbl 71015 `"Fiji"', add
label define bpld_lbl 71016 `"Melanesia, ns"', add
label define bpld_lbl 71017 `"Norfolk Islands"', add
label define bpld_lbl 71018 `"Niue"', add
label define bpld_lbl 71020 `"Cook Islands"', add
label define bpld_lbl 71022 `"French Polynesia"', add
label define bpld_lbl 71023 `"Tonga"', add
label define bpld_lbl 71024 `"Wallis and Futuna Islands"', add
label define bpld_lbl 71025 `"Western Samoa"', add
label define bpld_lbl 71026 `"Pitcairn Island"', add
label define bpld_lbl 71027 `"Tokelau"', add
label define bpld_lbl 71028 `"Tuvalu"', add
label define bpld_lbl 71029 `"Polynesia, ns"', add
label define bpld_lbl 71032 `"Kiribati"', add
label define bpld_lbl 71033 `"Canton and Enderbury"', add
label define bpld_lbl 71034 `"Nauru"', add
label define bpld_lbl 71039 `"Micronesia, ns"', add
label define bpld_lbl 71040 `"US Pacific Trust Territories"', add
label define bpld_lbl 71041 `"Marshall Islands"', add
label define bpld_lbl 71042 `"Micronesia"', add
label define bpld_lbl 71043 `"Kosrae"', add
label define bpld_lbl 71044 `"Pohnpei"', add
label define bpld_lbl 71045 `"Truk"', add
label define bpld_lbl 71046 `"Yap"', add
label define bpld_lbl 71047 `"Northern Mariana Islands"', add
label define bpld_lbl 71048 `"Palau"', add
label define bpld_lbl 71049 `"Pacific Trust Terr, ns"', add
label define bpld_lbl 71050 `"Clipperton Island"', add
label define bpld_lbl 71090 `"Oceania, ns/nec"', add
label define bpld_lbl 80000 `"Antarctica, ns/nec"', add
label define bpld_lbl 80010 `"Bouvet Islands"', add
label define bpld_lbl 80020 `"British Antarctic Terr."', add
label define bpld_lbl 80030 `"Dronning Maud Land"', add
label define bpld_lbl 80040 `"French Southern and Antarctic Lands"', add
label define bpld_lbl 80050 `"Heard and McDonald Islands"', add
label define bpld_lbl 90000 `"Abroad (unknown) or at sea"', add
label define bpld_lbl 90010 `"Abroad, ns"', add
label define bpld_lbl 90011 `"Abroad (US citizen)"', add
label define bpld_lbl 90020 `"At sea"', add
label define bpld_lbl 90021 `"At sea (US citizen)"', add
label define bpld_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define bpld_lbl 95000 `"Other n.e.c."', add
label define bpld_lbl 99900 `"Missing/blank"', add
label values bpld bpld_lbl

label define citizen_lbl 0 `"N/A"'
label define citizen_lbl 1 `"Born abroad of American parents"', add
label define citizen_lbl 2 `"Naturalized citizen"', add
label define citizen_lbl 3 `"Not a citizen"', add
label define citizen_lbl 4 `"Not a citizen, but has received first papers"', add
label define citizen_lbl 5 `"Foreign born, citizenship status not reported"', add
label values citizen citizen_lbl

label define school_lbl 0 `"N/A"'
label define school_lbl 1 `"No, not in school"', add
label define school_lbl 2 `"Yes, in school"', add
label define school_lbl 9 `"Missing"', add
label values school school_lbl

label define educ_lbl 00 `"N/A or no schooling"'
label define educ_lbl 01 `"Nursery school to grade 4"', add
label define educ_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_lbl 03 `"Grade 9"', add
label define educ_lbl 04 `"Grade 10"', add
label define educ_lbl 05 `"Grade 11"', add
label define educ_lbl 06 `"Grade 12"', add
label define educ_lbl 07 `"1 year of college"', add
label define educ_lbl 08 `"2 years of college"', add
label define educ_lbl 09 `"3 years of college"', add
label define educ_lbl 10 `"4 years of college"', add
label define educ_lbl 11 `"5+ years of college"', add
label values educ educ_lbl

label define educd_lbl 000 `"N/A or no schooling"'
label define educd_lbl 001 `"N/A"', add
label define educd_lbl 002 `"No schooling completed"', add
label define educd_lbl 010 `"Nursery school to grade 4"', add
label define educd_lbl 011 `"Nursery school, preschool"', add
label define educd_lbl 012 `"Kindergarten"', add
label define educd_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_lbl 014 `"Grade 1"', add
label define educd_lbl 015 `"Grade 2"', add
label define educd_lbl 016 `"Grade 3"', add
label define educd_lbl 017 `"Grade 4"', add
label define educd_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_lbl 021 `"Grade 5 or 6"', add
label define educd_lbl 022 `"Grade 5"', add
label define educd_lbl 023 `"Grade 6"', add
label define educd_lbl 024 `"Grade 7 or 8"', add
label define educd_lbl 025 `"Grade 7"', add
label define educd_lbl 026 `"Grade 8"', add
label define educd_lbl 030 `"Grade 9"', add
label define educd_lbl 040 `"Grade 10"', add
label define educd_lbl 050 `"Grade 11"', add
label define educd_lbl 060 `"Grade 12"', add
label define educd_lbl 061 `"12th grade, no diploma"', add
label define educd_lbl 062 `"High school graduate or GED"', add
label define educd_lbl 063 `"Regular high school diploma"', add
label define educd_lbl 064 `"GED or alternative credential"', add
label define educd_lbl 065 `"Some college, but less than 1 year"', add
label define educd_lbl 070 `"1 year of college"', add
label define educd_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_lbl 080 `"2 years of college"', add
label define educd_lbl 081 `"Associate's degree, type not specified"', add
label define educd_lbl 082 `"Associate's degree, occupational program"', add
label define educd_lbl 083 `"Associate's degree, academic program"', add
label define educd_lbl 090 `"3 years of college"', add
label define educd_lbl 100 `"4 years of college"', add
label define educd_lbl 101 `"Bachelor's degree"', add
label define educd_lbl 110 `"5+ years of college"', add
label define educd_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_lbl 112 `"7 years of college"', add
label define educd_lbl 113 `"8+ years of college"', add
label define educd_lbl 114 `"Master's degree"', add
label define educd_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_lbl 116 `"Doctoral degree"', add
label define educd_lbl 999 `"Missing"', add
label values educd educd_lbl

label define empstat_lbl 0 `"N/A"'
label define empstat_lbl 1 `"Employed"', add
label define empstat_lbl 2 `"Unemployed"', add
label define empstat_lbl 3 `"Not in labor force"', add
label values empstat empstat_lbl

label define empstatd_lbl 00 `"N/A"'
label define empstatd_lbl 10 `"At work"', add
label define empstatd_lbl 11 `"At work, public emerg"', add
label define empstatd_lbl 12 `"Has job, not working"', add
label define empstatd_lbl 13 `"Armed forces"', add
label define empstatd_lbl 14 `"Armed forces--at work"', add
label define empstatd_lbl 15 `"Armed forces--not at work but with job"', add
label define empstatd_lbl 20 `"Unemployed"', add
label define empstatd_lbl 21 `"Unemp, exper worker"', add
label define empstatd_lbl 22 `"Unemp, new worker"', add
label define empstatd_lbl 30 `"Not in Labor Force"', add
label define empstatd_lbl 31 `"NILF, housework"', add
label define empstatd_lbl 32 `"NILF, unable to work"', add
label define empstatd_lbl 33 `"NILF, school"', add
label define empstatd_lbl 34 `"NILF, other"', add
label values empstatd empstatd_lbl

label define labforce_lbl 0 `"N/A"'
label define labforce_lbl 1 `"No, not in the labor force"', add
label define labforce_lbl 2 `"Yes, in the labor force"', add
label values labforce labforce_lbl

label define wkswork2_lbl 0 `"N/A"'
label define wkswork2_lbl 1 `"1-13 weeks"', add
label define wkswork2_lbl 2 `"14-26 weeks"', add
label define wkswork2_lbl 3 `"27-39 weeks"', add
label define wkswork2_lbl 4 `"40-47 weeks"', add
label define wkswork2_lbl 5 `"48-49 weeks"', add
label define wkswork2_lbl 6 `"50-52 weeks"', add
label values wkswork2 wkswork2_lbl

label define uhrswork_lbl 00 `"N/A"'
label define uhrswork_lbl 01 `"1"', add
label define uhrswork_lbl 02 `"2"', add
label define uhrswork_lbl 03 `"3"', add
label define uhrswork_lbl 04 `"4"', add
label define uhrswork_lbl 05 `"5"', add
label define uhrswork_lbl 06 `"6"', add
label define uhrswork_lbl 07 `"7"', add
label define uhrswork_lbl 08 `"8"', add
label define uhrswork_lbl 09 `"9"', add
label define uhrswork_lbl 10 `"10"', add
label define uhrswork_lbl 11 `"11"', add
label define uhrswork_lbl 12 `"12"', add
label define uhrswork_lbl 13 `"13"', add
label define uhrswork_lbl 14 `"14"', add
label define uhrswork_lbl 15 `"15"', add
label define uhrswork_lbl 16 `"16"', add
label define uhrswork_lbl 17 `"17"', add
label define uhrswork_lbl 18 `"18"', add
label define uhrswork_lbl 19 `"19"', add
label define uhrswork_lbl 20 `"20"', add
label define uhrswork_lbl 21 `"21"', add
label define uhrswork_lbl 22 `"22"', add
label define uhrswork_lbl 23 `"23"', add
label define uhrswork_lbl 24 `"24"', add
label define uhrswork_lbl 25 `"25"', add
label define uhrswork_lbl 26 `"26"', add
label define uhrswork_lbl 27 `"27"', add
label define uhrswork_lbl 28 `"28"', add
label define uhrswork_lbl 29 `"29"', add
label define uhrswork_lbl 30 `"30"', add
label define uhrswork_lbl 31 `"31"', add
label define uhrswork_lbl 32 `"32"', add
label define uhrswork_lbl 33 `"33"', add
label define uhrswork_lbl 34 `"34"', add
label define uhrswork_lbl 35 `"35"', add
label define uhrswork_lbl 36 `"36"', add
label define uhrswork_lbl 37 `"37"', add
label define uhrswork_lbl 38 `"38"', add
label define uhrswork_lbl 39 `"39"', add
label define uhrswork_lbl 40 `"40"', add
label define uhrswork_lbl 41 `"41"', add
label define uhrswork_lbl 42 `"42"', add
label define uhrswork_lbl 43 `"43"', add
label define uhrswork_lbl 44 `"44"', add
label define uhrswork_lbl 45 `"45"', add
label define uhrswork_lbl 46 `"46"', add
label define uhrswork_lbl 47 `"47"', add
label define uhrswork_lbl 48 `"48"', add
label define uhrswork_lbl 49 `"49"', add
label define uhrswork_lbl 50 `"50"', add
label define uhrswork_lbl 51 `"51"', add
label define uhrswork_lbl 52 `"52"', add
label define uhrswork_lbl 53 `"53"', add
label define uhrswork_lbl 54 `"54"', add
label define uhrswork_lbl 55 `"55"', add
label define uhrswork_lbl 56 `"56"', add
label define uhrswork_lbl 57 `"57"', add
label define uhrswork_lbl 58 `"58"', add
label define uhrswork_lbl 59 `"59"', add
label define uhrswork_lbl 60 `"60"', add
label define uhrswork_lbl 61 `"61"', add
label define uhrswork_lbl 62 `"62"', add
label define uhrswork_lbl 63 `"63"', add
label define uhrswork_lbl 64 `"64"', add
label define uhrswork_lbl 65 `"65"', add
label define uhrswork_lbl 66 `"66"', add
label define uhrswork_lbl 67 `"67"', add
label define uhrswork_lbl 68 `"68"', add
label define uhrswork_lbl 69 `"69"', add
label define uhrswork_lbl 70 `"70"', add
label define uhrswork_lbl 71 `"71"', add
label define uhrswork_lbl 72 `"72"', add
label define uhrswork_lbl 73 `"73"', add
label define uhrswork_lbl 74 `"74"', add
label define uhrswork_lbl 75 `"75"', add
label define uhrswork_lbl 76 `"76"', add
label define uhrswork_lbl 77 `"77"', add
label define uhrswork_lbl 78 `"78"', add
label define uhrswork_lbl 79 `"79"', add
label define uhrswork_lbl 80 `"80"', add
label define uhrswork_lbl 81 `"81"', add
label define uhrswork_lbl 82 `"82"', add
label define uhrswork_lbl 83 `"83"', add
label define uhrswork_lbl 84 `"84"', add
label define uhrswork_lbl 85 `"85"', add
label define uhrswork_lbl 86 `"86"', add
label define uhrswork_lbl 87 `"87"', add
label define uhrswork_lbl 88 `"88"', add
label define uhrswork_lbl 89 `"89"', add
label define uhrswork_lbl 90 `"90"', add
label define uhrswork_lbl 91 `"91"', add
label define uhrswork_lbl 92 `"92"', add
label define uhrswork_lbl 93 `"93"', add
label define uhrswork_lbl 94 `"94"', add
label define uhrswork_lbl 95 `"95"', add
label define uhrswork_lbl 96 `"96"', add
label define uhrswork_lbl 97 `"97"', add
label define uhrswork_lbl 98 `"98"', add
label define uhrswork_lbl 99 `"99 (Topcode)"', add
label values uhrswork uhrswork_lbl

label define tranwork_lbl 00 `"N/A"'
label define tranwork_lbl 10 `"Auto, truck, or van"', add
label define tranwork_lbl 11 `"Auto"', add
label define tranwork_lbl 12 `"Driver"', add
label define tranwork_lbl 13 `"Passenger"', add
label define tranwork_lbl 14 `"Truck"', add
label define tranwork_lbl 15 `"Van"', add
label define tranwork_lbl 20 `"Motorcycle"', add
label define tranwork_lbl 30 `"Bus or streetcar"', add
label define tranwork_lbl 31 `"Bus or trolley bus"', add
label define tranwork_lbl 32 `"Streetcar or trolley car"', add
label define tranwork_lbl 33 `"Subway or elevated"', add
label define tranwork_lbl 34 `"Railroad"', add
label define tranwork_lbl 35 `"Taxicab"', add
label define tranwork_lbl 36 `"Ferryboat"', add
label define tranwork_lbl 40 `"Bicycle"', add
label define tranwork_lbl 50 `"Walked only"', add
label define tranwork_lbl 60 `"Other"', add
label define tranwork_lbl 70 `"Worked at home"', add
label values tranwork tranwork_lbl

label define carpool_lbl 0 `"N/A"'
label define carpool_lbl 1 `"Drives alone"', add
label define carpool_lbl 2 `"Carpools"', add
label define carpool_lbl 3 `"Shares driving"', add
label define carpool_lbl 4 `"Drives others only"', add
label define carpool_lbl 5 `"Passenger only"', add
label values carpool carpool_lbl


drop multy cbse cluster strat hispand raced bpl pernum educ empstatd gq

assert age >= 16 & age <= 64

compress
save "usa_00145.dta", replace
