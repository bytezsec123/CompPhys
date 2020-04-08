%%Description 
%This is the script that has all the intial data for the solar system
%bodies.
%
%Input: None
%Output: None
% 
% April 8, 2020: Written by Tim Honablew and Joshua White

%Array for the Planets 
planets = planets = ['Sun', 'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', ...
    'Saturn', 'Uranus', 'Neptune'];

%seconds in a day
secsInDay = 60^2*24;
%astronomical unit in meters
AU = 1.495978707E11;   

%Planet Data

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

distance = [0.387;
            0.723;
            1;
            1.523;
            5.204;
            9.583;
            19.191;
            30.045;]; %AU