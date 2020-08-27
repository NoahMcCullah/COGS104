clear

%%%%%%%  Assignment 2  %%%%%%%%%%%%
N = 6;
x = rand(1,N);
for I = 1:N
    x = x + N;
end

%%%%%%%  Assignment 3  %%%%%%%%%%%%
Y = ceil(randn(1, N))
while rand < .9
    Y = Y+1;
end

%%%%%%%  Assignment 4  %%%%%%%%%%%%
t=0;
Z= rand(1, N);
Z = Z / sum(Z);
while max(Z) < .95
    Z = Z-.01;
    Z = Z/sum(Z);
    t = t+1;
    allZ(t,:) = Z;
end
figure()
plot(allZ)
title('Part 4 plot: Normalized vector over time');
xlabel('Time');
ylabel('Activations');

%%%%%%%  Assignment 5  %%%%%%%%%%%%
W = rand(8,4)*10-5;
t = 0;

for m=1:10
    t = t+1;
   input = rand(1,8); 
   outputs(t,:) = input * W;
   %  Accumulate  %
end
figure()
mesh(outputs);
