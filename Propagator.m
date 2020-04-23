function [out]=Propagator(t,input);

global sunm G earthm moonm

%% Earth with the Moon
C1=zeros(6,6);
C2=zeros(6,1);
C1(1,4)=1;
C1(2,5)=1;
C1(3,6)=1;
xem=input(13); %x position
yem=input(14); %y position
zem=input(15); %z position
Rem = norm([xem,yem,zem]); %find the radius from the earth to the sun 
unitvectorem=[xem,yem,zem]/Rem;
% do these calculations now so we only have to calculate it once

C2(4)=-G*moonm/Rem^2*unitvectorem(1); %acceleration in the x
C2(5)=-G*moonm/Rem^2*unitvectorem(2); %acceleration in the y
C2(6)=-G*moonm/Rem^2*unitvectorem(3); %acceleration in the z

%% Moon with the Earth
D1=zeros(6,6);
D2=zeros(6,1);
D1(1,4)=1;
D1(2,5)=1;
D1(3,6)=1;
xme=input(13); %x position
yme=input(14); %y position
zme=input(15); %z position
Rme = norm([xme,yme,zme]); %find the radius from the earth to the sun 
unitvectorme=[xme,yme,zme]/Rme;
% do these calculations now so we only have to calculate it once

D2(4)=-G*earthm/Rme^2*unitvectorme(1); %acceleration in the x
D2(5)=-G*earthm/Rme^2*unitvectorme(2); %acceleration in the y
D2(6)=-G*earthm/Rme^2*unitvectorme(3); %acceleration in the z

inputEarthMoon = input(13:18);

%% Earth
%state space representation idot=A1*input+A2(input) 
%where idot is the derivative of the input
%this represents the linear part in A1 added to the non-linear part in A2

% |Vx|   |0 0 0 1 0 0|   |x |   | 0                |
% |Vy|   |0 0 0 0 1 0|   |y |   | 0                |
% |Vz| = |0 0 0 0 0 1| * |z | + | 0                |
% |Ax|   |0 0 0 0 0 0|   |Vx|   | -G*sunm/R^2*|Rx| |
% |Ay|   |0 0 0 0 0 0|   |Vy|   | -G*sunm/R^2*|Ry| |
% |Az|   |0 0 0 0 0 0|   |Vz|   | -G*sunm/R^2*|Rz| |
% idot =      A1       * input   +     A2(input)
% where |Rx| is the unit vector of R in the x direction
% where R=sqrt(x^2+y^2+z^2);

dx=zeros(6,1); %initialize the xdot matrix
A1=zeros(6,6);
A2=zeros(6,1);
A1(1,4)=1;
A1(2,5)=1;
A1(3,6)=1;
x=input(1); %x position
y=input(2); %y position
z=input(3); %z position
R = norm([x,y,z]); %find the radius from the earth to the sun 
unitvector=[x,y,z]/R;
% do these calculations now so we only have to calculate it once

A2(4)=-G*sunm/R^2*unitvector(1); %acceleration in the x
A2(5)=-G*sunm/R^2*unitvector(2); %acceleration in the y
A2(6)=-G*sunm/R^2*unitvector(3); %acceleration in the z

inputEarth = input(1:6);

TotAccelEarth=A1 * inputEarth + A2 + C2; %sum up the linear + nonlinear accelerations

%% Moon
B1=zeros(6,6);
B2=zeros(6,1);
B1(1,4)=1;
B1(2,5)=1;
B1(3,6)=1;
xm=input(7); %x position
ym=input(8); %y position
zm=input(9); %z position
Rm = norm([xm,ym,zm]); %find the radius from the earth to the sun 
unitvectorm=[xm,ym,zm]/Rm;
% do these calculations now so we only have to calculate it once

B2(4)=-G*sunm/Rm^2*unitvectorm(1); %acceleration in the x
B2(5)=-G*sunm/Rm^2*unitvectorm(2); %acceleration in the y
B2(6)=-G*sunm/Rm^2*unitvectorm(3); %acceleration in the z

inputMoon = input(7:12);

TotAccelMoon = B1 * inputMoon + B2 + D2;
%% Output
out=[TotAccelEarth; TotAccelMoon; A2]; %output the accelerations

end

