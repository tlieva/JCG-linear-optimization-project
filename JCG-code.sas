/*** SCENARIO 1: CE750 CESSNIA **/

proc optmodel;

 

/* Decision variables 

Let x1(i) = gallon of fuel purchased at each airport, where i = destination 0, 1,2,3,4
Let x2(i) = ramp fees paid at each airport, where i = destination 0, 1, 2, 3, 4
Note: x2 = binary where 0 = not purchased, 1 = purchased

(i) is 0 = Start (Moline), 1 = Boston, 2=NY, 3=Dallas, 4=Moline (Return) */
    
	var x10, x11, x12, x13, x14;
	var x21 binary, x22 binary, x23 binary;
	var f1, f2, f3, f4;
	var g1, g2, g3, g4;
	var ftotal0, ftotal1, ftotal2, ftotal3, ftotal4;
	var wtotal0, wtotal1, wtotal2, wtotal3, wtotal4;

 

    num prob_id init 1;        /*PROB id*/

 

/*     Objective Function: */
    min z = 3.97*x10 + 8.35*x11 + 7.47*x12 + 6.01*x13  + 3.97*x14 + 800*x21 + 450*x22 + 400*x23;
			 
 
/* constraints */
    con
 
/* constraint 1: fuel burned*/   
/*Fuel used by the END of each leg (f(i)) */
/*Leg 1*/ f1 = 4800/6.7,
/*Leg 2*/ f2 = 2000/6.7,
/*Leg 3*/ f3 = 5300/6.7,
/*Leg 4*/ f4 = 3100/6.7,

/* g = fuel at landing */
g1 = ftotal0 - f1,
g2 = ftotal1 - f2,
g3 = ftotal2 - f3,
g4 = ftotal3 - f4,
g1 >= 2000/6.7, g2 >= 2000/6.7, g3 >= 2000/6.7, g4 >= 2000/6.7,


/*Total fuel during take-off at each leg (ftotal(i)) */
/*Start*/ ftotal0 = x10 + 7000/6.7,
/*Leg 1*/ ftotal1 = x11 + g1,
/*Leg 2*/ ftotal2 = x12 + g2,
/*Leg 3*/ ftotal3 = x13 + g3,
/*Leg 4*/ ftotal4 = x14 + g4, ftotal4 = 7000/6.7,
ftotal0<=13000/6.7, ftotal1<=13000/6.7, ftotal2<=13000/6.7, ftotal3<=13000/6.7, ftotal4<=13000/6.7,



/* constraint 2: aircraft weight limitation at takeoff and landing*/ 
/*Total weight at each take-off: BOW + Passenger weight (wtotal(i)) */
/*Start*/ wtotal0 = 22200/6.7 + 2*(200/6.7),
/*Leg 1*/ wtotal1 = 22200/6.7 + 4*(200/6.7),
/*Leg 2*/ wtotal2 = 22200/6.7 + 8*(200/6.7),
/*Leg 3*/ wtotal3 = 22200/6.7 + 8*(200/6.7),
/*Leg 4*/ wtotal4 = 22200/6.7, 


/* start; moline */
/* take off */ wtotal0 + ftotal0 <= 36400/6.7,

/* leg 1: boston*/
/* landing */ wtotal0 + ftotal0 - f1 <= 31800/6.7,
/* take-off */ wtotal1+ ftotal1 <= 36400/6.7,

/* leg 2: NY*/
/* landing */ wtotal1 + ftotal1 - f2 <= 31800/6.7,
/* take-off */ wtotal2+ ftotal2 <= 36400/6.7,


/* leg 3: Dallas*/
/* landing */ wtotal2 + ftotal2 - f3 <= 31800/6.7,
/* take-off */ wtotal3+ ftotal3 <= 36400/6.7,

/* leg 4: moline (return)*/
/* landing */ wtotal3 + ftotal3 - f4 <= 31800/6.7,
/* take-off */ wtotal4 + ftotal4 <= 36400/6.7,




/* constraint 3: ramp fees */
x21 + x22 + x23 <= 3,
/*conditional constraints */ 
500*(1-x21) <= x11,
300*(1-x22) <= x12,
350*(1-x23) <= x13,



/*     Non-Negativity Constraints: */

	x10 >=0, x11>=0, x12>=0, x13>=0, x14>=0, x21>=0, x22>=0, x23>=0,
	f1>=0, f2>=0, f3>=0, f4>=0, 
	ftotal0>=0, ftotal1>=0, ftotal2>=0, ftotal3>=0, ftotal4>=0,
	wtotal0>=0, wtotal1>=0, wtotal2>=0, wtotal3>=0, wtotal4>=0;

    
/* Request to solve the LP problem     */
    solve;
/*     Create a table  */
    create data sol_data_01 from x10 x11  x12  x13  x14  x21  x22  x23 z prob_id;
    
    print x10 x11  x12  x13  x14  x21  x22  x23 z;
    print data = sol_data_01 ;run;
