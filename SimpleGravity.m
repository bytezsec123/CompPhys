%% Inputs
stepsize=1;   %step size in days, should not exceed 1
finaltime=365; %days from t0

%% System Conditions
global sunm G earthm moonm
sunm=1.9891e30; %kg
G=1.4879*10^(-34); %AU^3/(kg*Day^2)
earthm = 5.97e24; %kg
moonm = 7.39e22; %kg
%% Sun Initial Conditions
x=0;
y=0;
z=0;
Vx=0;
Vy=0;
Vz=0;
SunInitial=[x,y,z,Vx,Vy,Vz]; %summary of initial conditions of the sun
%Note: not used in rest of code.

%% Earth Initial Conditions
x=-7.829690890802676E-01; %AU
y=6.009223815219861E-01;  %AU
z=-1.377986550047871E-05; %AU
Vx=-1.075646922487205E-02;%AU/day
Vy=-1.370584048238274E-02;%AU/day
Vz=3.974096024543801E-08; %AU/day
EarthInitial=[x,y,z,Vx,Vy,Vz]; %summary of initial conditions of the earth

%% Moon Initial Conditions (Earth)
x=-2.350177263460718E-03;
y=-7.035457575168254E-04;
z=-1.762901624374759E-04;
Vx=1.730614688017424E-04;
Vy=-5.904792903295297E-04;
Vz=3.133882541070862E-05;
MoonEarthInitial = [x, y, z, Vx, Vy, Vz];

%% Moon Initial Conditions (Sun)
x=-7.853192642569187E-01; 
y=6.002188383775213E-01;
z=-1.900677619611636E-04;
Vx=-1.058340780222186E-02;
Vy=-1.429631973892683E-02;
Vz=3.137843562812329E-05;
MoonInitial = [x,y,z,Vx,Vy,Vz];

%% Call the Function
%output=call the function,      time to run,      initial conditions
[attime,finalposition]=ode45...
    (@Propagator,[0:stepsize:finaltime],[EarthInitial, MoonInitial, MoonEarthInitial]);

%% Plot the Result
hold on;

plot3(finalposition(:,1),finalposition(:,2),finalposition(:,3),'g'); %plot of position of earth in green
plot3(finalposition(:,7), finalposition(:,8), finalposition(:,9), 'b'); %plot of position of moon in blue

xlabel('Distance (AU)');ylabel('Distance (AU)');zlabel('Distance (AU)'); %label the axis
%legend('Earth', 'Moon'); %tell me what the green line is
axis equal %fix the axis so it has the same scale in x, y and z
%note: sun is at 0,0,0

