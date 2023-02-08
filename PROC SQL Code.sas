/*Course name STAT 5200
Name: Susannah Craig
#1A SAS Program PROC SQL*/

PROC IMPORT OUT=state 
	DATAFILE= 'file location\state.txt' 
	DBMS= tab REPLACE; 
	GETNAMES=no; 
	guessingrows=54; 
RUN;

data state;
	set state;
	label
	Var1="State Code"
	Var2="State Name"
	Var3="East or West of Mississippi River"
	Var4="Census Bureau District Code"
	Var5="Highest Recorded Temp"
	Var6="Lowest Recorded Temp"
	Var7="1980 population"
	Var8="Population per Square Mile"
	Var9="% Land Devoted to Agriculture"
	Var10="% Urban Population"
	Var11="Crimes per 100,000"
	Var12="BTU's Used per Capita"
	Var13="Per Capita Income"
	Var14="% Labor force in Manufacturing"
	Var15="Per Capita Military Contracts"
;
Run;

Proc SQL;
create table popgt5 as
select *
from state
where Var7>=5000000;
quit; 

/*Course name STAT 5200
Name: Susannah Craig
#1B SAS Program PROC SQL*/

Proc SQL;
create table state_1b as
select 	*,
		(Var10*Var7)/100 as UrbanPop,
		(Var5-Var6) as TempRange
from state
;
quit; 

/*Course name STAT 5200
Name: Susannah Craig
#1C SAS Program PROC SQL*/

Proc SQL;
create table state_1c as
select 	Var2, 
		Var5, 
		Var6,
		(Var5-Var6) as TempRange
from state
order by Var2, Var5, Var6, TempRange desc;
quit; 

/*Course name STAT 5200
Name: Susannah Craig
#1D SAS Program PROC SQL*/

Proc SQL;
title 'Observations with 1980 population larger than 5 million';
create view popgt5view as
select *
from state
where Var7>=5000000;
select * from popgt5view;

/*Course name STAT 5200
Name: Susannah Craig
#1E SAS Program PROC SQL*/

Proc sql;
   describe view popgt5view;

/*Course name STAT 5200
Name: Susannah Craig
#2A SAS Program PROC SQL*/

data left;
   input LeftSubj Height Weight;
   datalines;
001 68 155
002 75 220
003 65 99
005 79 266
006 70 190
009 61 122
;

data right;
   input RightSubj Salary;
   datalines;
001 46000
003 67900
004 28200
005 98202
006 88000
007 57200
;

Proc sql;
select * 
from left inner join right
on left.LeftSubj=right.RightSubj;
quit;

/*Course name STAT 5200
Name: Susannah Craig
#2B SAS Program PROC SQL*/

Proc sql;
select * 
from left full join right
on left.LeftSubj=right.RightSubj;
quit;

/*Course name STAT 5200
Name: Susannah Craig
#2C SAS Program PROC SQL*/

Proc sql;
select * 
from left left join right
on left.LeftSubj=right.RightSubj;
quit;
