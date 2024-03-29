# JCG Global Air Service - Linear Optimization Case Study

Repository for a linear optimization case study completed for academic purposes.

## Problem Background
JCG Global Air Services operates four aircrafts to serve the transprotation needs of the corporate HQ of JCG Company - one of which is the CESSNIA CITATION X aircraft (CE750), with a fuel burn rate of 310 gallons per hour coupled with its 13,000lb tank, and a capacity of 10 passengers. Aircrafts are located at Moline, Illonois.

An upcoming four-legged flight from Moline to Boston, the New York area, Dallas, and back to Moline, has been scheduled for the CEO and CFO of the JCG Corporation using the CE750 aircraft. Six additional passengers will be picked up along the flight path; 2 in Boston, 4 in NY.

A cost-minimizing fuel plan is required for the upcoming flight that will take into consideration the differences in fuel prices at each airport and ramp fees levied at destination airports if fuel purchases fail to meet specified minimums. This include the company’s “safety stock” policy specifying the minimum amount of fuel required for each landing at 2,400 pounds. Upon arrival back at Moline, the aircraft needs a mnimium starting fuel of 7,000lb.

The flight details and aircraft limitations are as followed:
<img width="748" alt="Screen Shot 2022-07-09 at 9 31 11 PM" src="https://user-images.githubusercontent.com/106416383/178127882-8d96737a-c6b1-4d67-9d3d-4220f6bb494a.png">
<img width="358" alt="Screen Shot 2022-07-09 at 9 31 25 PM" src="https://user-images.githubusercontent.com/106416383/178127885-2b488d06-93dd-4b44-90be-bee81db98ec6.png">

#### Project Files:
- [SAS Code Solution](https://github.com/tlieva/JCG-linear-optimization-project/blob/7e963c1bb737e1c912ba02ed476fba3302ee99d3/JCG-code.sas)
- [SAS Code Solution: Adjusted 2400-Rule](https://github.com/tlieva/JCG-linear-optimization-project/blob/699be70d1f11c881e1f50c7b18372cb396031a5e/JCG-code-2.sas)


## Summary of Methodology

**Conversion: 6.7lbs/gallon**

The linear optimization model was developed in SAS by invoking the OPTMODEL procedure. The objective function (z) was minimized subject to the constraints defined in given linear programming code in SAS.

Based on the objective of this case, the following two decision variables were declared:
1. Let **x1(i)** = gallon of fuel purchased at each airport, where i = destination 0, 1,2,3,4
2. Let **x2(i)** = ramp fees paid at each airport, where i = destination 0, 1, 2, 3, 4

(i) = 0:Moline, 1:Boston, 2:NY, 3:Dallas, 4:Moline (Return) 

Note: x2 = binary where 0 = not purchased, 1 = purchased

### Objective function:
<img width="834" alt="Screen Shot 2022-07-21 at 6 46 17 PM" src="https://user-images.githubusercontent.com/106416383/180327550-751ec58c-273d-4f76-8e74-6db9dcde2f51.png">

### Constraints:
The model took into consideration of three main constraints:
1. **Fuel**; including the fuel tank capacity and 2400 landing rule which requires the aircraft to land with at least 2400 pounds of fuel

<img width="749" alt="Screen Shot 2022-07-21 at 6 44 41 PM" src="https://user-images.githubusercontent.com/106416383/180327395-08655e82-fe78-4025-b5f7-1467473d10a0.png">

2. **Weight Limitations of the Aircraft** for takeoffs and landing (including passenger weight and basic opeating weight of the aircraft)

<img width="696" alt="Screen Shot 2022-07-21 at 6 43 53 PM" src="https://user-images.githubusercontent.com/106416383/180327321-e9bbcf8c-ed64-444c-b89c-48167ac71fb6.png">

3. **Ramp Fees Levied**; where fess levied at each landing destination airport (x2(i)), is dependent on the gallons of fuel purchase at each respective landing destinations. 

<img width="677" alt="Screen Shot 2022-07-21 at 6 41 16 PM" src="https://user-images.githubusercontent.com/106416383/180327068-9b2867b5-a0c6-4b40-a522-dcb252f6bc24.png">

Additional **non-negativity constraints** was included in the model to ensure each decision variable will be positive.

The complete mathematical model can be found in the provided sample code linked above.

## Model Output:
<img width="447" alt="Screen Shot 2022-07-22 at 7 37 53 PM" src="https://user-images.githubusercontent.com/106416383/180580802-ed96ecd6-4c8d-4547-80bf-5176f7f7f801.png">

## Summary of Solution: Cost-Minimizing Strategy

### Fuel Plan
<img width="722" alt="Screen Shot 2022-07-22 at 8 32 21 PM" src="https://user-images.githubusercontent.com/106416383/180583336-bc1518bc-49c2-4588-9ca0-736f38d96d8d.png">

Taking into consideration of the aircraft weight limits at takeoff and landings, fuel capacity, and minimum fuel requirement at landing, the model identified that the most optimal solution was for fuel to be purchased prior to the start of the flight where cost is cheapest, thereby, negating the need to refuel the aircraft at Boston where cost is highest. This will minimize the total accumulated costs of fuel and ramp fees levied at destination airports to a total cost of **$11,645**.

As fuel cost is cheaper if bought at home, an estimated **896 gallons** of fuel is recommended to be purchased at KMLI airport in Moline prior to the start of the flight. This will reduce the volume of fuel needed to be purchased at the next landing destination in Boston to zero where fuel price is the highest. This is in addition to having the highest set fuel purchase minimum. As a result, it is recommended for ramp fees to be paid instead to save on fuel costs. 

In subsequent landing airports, the aircraft is recommended to be refueled at each destination after Boston to meet specified fuel purchase minimums for waivers. This will avoid additional ramp fees while ensuring sufficient fuel to reach the next destination. As such, the following estimated gallons of fuel should be purchased at each destination airport after Boston: 
- **300 gallons** in New York
- **387 gallons** in Dallas
Both are minimum fuel purchased for fee waivers at each respective location. 

Upon return to KMLI airport at Moline, an estimated **687 gallons** of fuel will need to be purchased to refuel the aircraft back to a total of 7,000 pounds to meet policy standards for the CE750 aircraft on arrival. 

### Cost Breakdown at Each Airport
<img width="723" alt="Screen Shot 2022-07-22 at 9 47 02 PM" src="https://user-images.githubusercontent.com/106416383/180585792-e53c3a43-6bc4-428c-a015-ef12137eca93.png">


### Reducing the 2400 Landing Rule:
Some pilots argue that company procedures (2400 landing rule) could be modified to reduce flight costs to a minimum of 2000lbs of landing fuel. 

The model found that reducing the company’s minimum required fuel for landing to 2,000 pounds from 2,400 results in a total cost of **$11,571** per flight.

#### Model Output:
<img width="421" alt="Screen Shot 2022-07-22 at 9 03 50 PM" src="https://user-images.githubusercontent.com/106416383/180584445-ec2fd119-e690-4fa9-ae18-b9a1eec4afdd.png">

When looking at the potential yearly savings, we know that the total flight hours of the present case was found to be approximately 7.2~ hours. And as the CE750 is responsible for 40% of all flight hours, and JCG flies 650 hours per year, CE750 therefore accounts for 260 hours. 

Given a reduction in the 2400 landing rule, the yearly cost of this scenario is therefore **$417,841.67**. In comparison, to the accumulated cost of $11,645 per 7.2h flight of the first scenario, with a yearly cost of **$420,513.89**. The savings brought by the reduction is an estimated $2,672.22 - representing **<1% in savings**, **in comparison to the 17% reduction in fuel**.

Due to the minimal cost-savings from reducing 2400-landing rule to 2000 lbs, a reduction to the 2400-landing rule is not recommended to be implemented at the expense of reducing the safety cushion. 
