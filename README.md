# JCG Global Air Service - Linear Optimization Case Study

#### Problem Background
JCG Global Air Services operates four aircrafts to serve the transprotation needs of the corporate HQ of JCG Company - one of which is the CESSNIA CITATION X aircraft (CE750), with a fuel burn rate of 310 gallons per hour coupled with its 13,000lb tank, and a capacity of 10 passengers.

An upcoming four-legged flight from Moline to Boston, the New York area, Dallas, and back to Moline, has been scheduled for the CEO and CFO of the JCG Corporation using the CE750 aircraft. 

A cost-minimizing fuel plan is required for the upcoming flight that will take into consideration the differences in fuel prices at each airport and ramp fees levied at destination airports if fuel purchases fail to meet specified minimums. This include the company’s “safety stock” policy specifying the minimum amount of fuel required for each landing at 2,400 pounds. Upon arrival back at Moline, the aircraft needs a mnimium starting fuel of 7,000lb.

The flight details and aircraft limitations are as followed:
<img width="748" alt="Screen Shot 2022-07-09 at 9 31 11 PM" src="https://user-images.githubusercontent.com/106416383/178127882-8d96737a-c6b1-4d67-9d3d-4220f6bb494a.png">
<img width="358" alt="Screen Shot 2022-07-09 at 9 31 25 PM" src="https://user-images.githubusercontent.com/106416383/178127885-2b488d06-93dd-4b44-90be-bee81db98ec6.png">


## Summary of Methodology
In order to develop an optimal cost-minimizing strategy, we first also had to put into consideration of the following constraints
- Fuel prices at each airport where fuel is cheaper if purchased at home
- Ramp fees charged if specified minimums are not met
- Aircraft weight limits for takeoffs and landing
- Fuel tank capacity
- 2400 landing rule which requires the aircraft to land with at least 2400 pounds of fuel

Based on the objective of this case, we created the following two decision variables, where i represents each of the starting and landing destination of the aircraft:
- x1(i) = for gallons of fuel purchased at each airport, where i represents destination of the aircraft:
- x2(i) = for ramp fees paid at each of the airports; this variable is also **binary** where 1 = purchased, and 0 = not purchased

## Summary of Solution
To minimize the total accumulated costs of fuel and ramp fees levied at destination airports, the following strategy has been developed for the upcoming four-legged flight using the Cessnia Citation X aircraft (CE750) at a total cost of **$11,645**. This model developed in consideration of the aircraft weight limits at takeoff and landings, fuel capacity, and minimum fuel requirement at landing. 

As fuel cost is cheaper if bought at home, an estimated **896 gallons** of fuel is recommended to be purchased at KMLI airport in Moline prior to the start of the flight. This will reduce the volume of fuel needed to be purchased at the next landing destination in Boston to zero where fuel price is the highest. This is in addition to having the highest set fuel purchase minimum, therefore, ramp fees should be paid instead. 

In subsequent landing airports, the aircraft is recommended to be refueled at each destination after Boston to meet specified fuel purchase minimums for waivers. This will avoid additional ramp fees while ensuring sufficient fuel to reach the next destination. As such, the following estimated gallons of fuel should be purchased at each destination airport after Boston: 
- **300 gallons** in New York
- **387 gallons** in Dallas
Both are minimum fuel purchased for fee waivers at each respective location. 

Upon return to KMLI airport at Moline, an estimated **687 gallons** of fuel will need to be purchased to refuel the aircraft back to a total of 7,000 pounds to meet policy standards for the CE750 aircraft on arrival. 

#### 2400 Landing Rule:
Some pilots argue that company procedures (2400 landing rule) could be modified to reduce flight costs.  2000 and the savings for this trip, then calculate savings for one year of flights (650 hr./year). Assume CE750 accounts for 40% of the total hours flew by JCG. 
