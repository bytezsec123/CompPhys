Tim and Joshua Comp project process


First file (The initialization)
1st determine the scale of time days, years, centuries, etc.  and the unit of length that we'll be using. Then after determining you dt.
2nd do data allocation for planets include the time standards for each planet and moon system. Do data allocation for each planet. This includes finding mass initial position and velocity.
*It will be easier to treat each planet as its own variable by manipulating each one at the same time on an array.

2nd File (Add gravitational field)
Find the acceleration of gravity on each planet, using the equation a = Gm/r^2
Input: initial position Output: acceleration of each planet
Use the mass and postions of each planet to get a gravity value for the sun and then each celestial body

3rd File 
Using Rk4 to solve 2nd order differential equation and obtain position
*haven't quite figured this out.

Final pt.
Using the 3rd file in the first file to automatically know position value in a given time interval.
