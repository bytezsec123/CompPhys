%% Planet Data (MVEMJSUN)
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
        
%% Plot
hFig = figure();
set(hFig, 'units', 'pixels','Position',[10 10 1260 510]);

rho = @(a,b,theta) (a.*b)./((a.*cos(theta)).^2 + (b.*sin(theta)).^2).^0.5;

theta = linspace(0,2*pi);

mer = polarplot(theta, rho(dist(1), dist(2), theta), '--', 'color', 'm');

hold on;

ven = polarplot(theta, rho(dist(3), dist(4), theta), '--', 'color', 'g');
ear = polarplot(theta, rho(dist(5), dist(6), theta), '--', 'color', 'b');
mar = polarplot(theta, rho(dist(7), dist(8), theta), '--', 'color', 'r');
jup = polarplot(theta, rho(dist(9), dist(10), theta), '--', 'color', 'm');
sat = polarplot(theta, rho(dist(11), dist(12), theta), '--', 'color', 'g');
ura = polarplot(theta, rho(dist(13), dist(14), theta), '--', 'color', 'b');
nep = polarplot(theta, rho(dist(15), dist(16), theta), '--', 'color', 'r');

loops = 100;
film (loops) = struct('cdata',[],'colormap',[]);

for index = 1:loops  
    angle = (index-1)/12 * pi;
    
    merplan = polarplot(angle./period(1) * 365, rho(dist(1), dist(2), angle./period(1) * 365), 'o', 'color', 'm');
    venplan = polarplot(angle./period(2) * 365, rho(dist(3), dist(4), angle./period(2) * 365), 'o', 'color', 'g');
    earplan = polarplot(angle./period(3) * 365, rho(dist(5), dist(6), angle./period(3) * 365), 'o', 'color', 'b');
    marplan = polarplot(angle./period(4) * 365, rho(dist(7), dist(8), angle./period(4) * 365), 'o', 'color', 'r');
    jupplan = polarplot(angle./period(5) * 365, rho(dist(9), dist(10), angle./period(5) * 365), 'o', 'color', 'm');
    satplan = polarplot(angle./period(6) * 365, rho(dist(11), dist(12), angle./period(6) * 365), 'o', 'color', 'g');
    uraplan = polarplot(angle./period(7) * 365, rho(dist(13), dist(14), angle./period(7) * 365), 'o', 'color', 'b');
    nepplan = polarplot(angle./period(8) * 365, rho(dist(15), dist(16), angle./period(8) * 365), 'o', 'color', 'r');
    
    film(index) = getframe;
    
    delete(merplan);
    delete(venplan);
    delete(earplan);
    delete(marplan);
    delete(jupplan);
    delete(satplan);
    delete(uraplan);
    delete(nepplan);
end

movie(hFig, film, 5, 24);
