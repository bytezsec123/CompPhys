function [planName, size, radius, force, velocity, acceleration] = SolarSystemData(numPlanet, day)
%% Planet Data (MVEMJSUN)
planName = 'Planet';

if numPlanet == 1
    planName = 'Mercury';
elseif numPlanet == 2
    planName = 'Venus';
elseif numPlanet == 3
    planName = 'Earth';
elseif numPlanet == 4
    planName = 'Mars';
elseif numPlanet == 5
    planName = 'Jupiter';
elseif numPlanet == 6
    planName = 'Saturn';
elseif numPlanet == 7
    planName = 'Uranus';
else
    planName = 'Neptune';
end

mass = [0.3285;
        4.867;
        5.972;
        0.639;
        1898;
        568.3;
        86.81;
        102.4;]; %Times 10^24

period = [88;
          225;
          365;
          687;
          4380;
          10585;
          30660;
          60225;]; %Days
 
dist = [ 0.307, 0.467,...
         0.718, 0.728,...
         0.983, 1.017,...
         1.381, 1.666,...
         4.951, 5.454,...
         9.023, 10.050,...
         18.282, 20.095,...
         29.810, 30.327]; %AU;
     
%% Planet Data
size = mass(numPlanet) * 10^24;

rho = @(a,b,theta) (a.*b)./((a.*cos(theta)).^2 + (b.*sin(theta)).^2).^0.5;

radius = rho(dist(numPlanet*2-1), dist(numPlanet*2), day * 2*pi/period(numPlanet));

g = 6.67 *10^-11;
sun = 1.989 * 10^30;

force = g*sun*size/radius^2;
% accel = @(r) g*sun/r^2;
% acceleration = accel(radius);
acceleration = g*sun/radius^2;
velocity = (g*sun*radius)^0.5;

disp('Planet Mass (kg):');
disp(size);
disp('Distance from Sun (AU):');
disp(radius);
disp('Period (Days):');
disp(period(numPlanet));
disp('Force Due to Gravity (N):');
disp(force);
disp('Acceleration Due to Gravity (m/s^2):');
disp(acceleration);
disp('Velocity (m/s):');
disp(velocity);