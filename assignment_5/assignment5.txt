clear;

%declare variables for lorenz attractor
sigma = 10;
beta = 8/3;
p = 28;

x = (20).*rand(1, 1) -10;
y = (20).*rand(1, 1) -10;
z = (20).*rand(1, 1) -10;

%vectors to record all coords
allx = [];
ally = [];
allz = [];

for i = 1:5000
    x0 = x;
    y0 = y;
    z0 = z;
    
    %calculate new values by adding the dx/dt, dy/dt, and dz/dt
    x = x0 + 0.01 * (sigma*(y0 - x0));
    y = y0 + 0.01 * (x0 * (p - z0) - y0);
    z = z0 + 0.01 * ((x0 * y0) - (beta * z));
    
    allx = [allx x];
    ally = [ally y];
    allz = [allz z];
end

%plot and rotate
plot3(allx, ally, allz);
view(10, 0);