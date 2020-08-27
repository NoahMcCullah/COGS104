clear;
% %%%%%%%%%%     Part 1     %%%%%%%%%%
one = rand(1, 2000);
subplot(1, 3, 1);
histogram(one, 10);

two = rand(1, 2000);
three = [one;two];
agg1 = mean(three);
subplot(1, 3, 2);
histogram(agg1, 10);

agg2 = mean(rand(30, 2000));
subplot(1, 3, 3);
histogram(agg2, 10);
axis([0 1 0 600]);

%%%%%%%%%%     Part 2     %%%%%%%%%%
clear;

w1 = rand(1,1000)*.4;
w2 = (rand(1,1000)*.4)+.6;
w = [w1 w2];
w = w(randperm(2000));
subplot(1, 3, 1);
histogram(w, 10);

x1 = rand(1,1000)*.4;
x2 = (rand(1,1000)*.4)+.6;
x = [x1 x2];
x = x(randperm(2000));
y = [w;x];
agg1 = mean(y);
subplot(1, 3, 2);
histogram(agg1, 10);

for i = 1:30
    z1 = rand(1, 1000)*.4;
    z2 = (rand(1, 1000)*.4)+.6;
    z = [z1 z2];
    z = z(randperm(2000));
    matrix(i,:) = z;
end

agg2 = mean(matrix);
subplot(1, 3, 3);
histogram(agg2, 10);
axis([0 1 0 600]);

%%%%%%%%%%     Part 3      %%%%%%%%%%
clear;

w1 = rand(1, 500)*.1;
w2 = (rand(1, 500)*.1)+.9;
w3 = (rand(1, 500)*.3)+.1;
w4 = (rand(1, 500)*.3)+.6;
w = [w1 w3 w4 w2];
w = w(randperm(2000));
subplot(1, 3, 1);
histogram(w, 10);

x1 = rand(1, 500)*.1;
x2 = (rand(1, 500)*.1)+.9;
x3 = (rand(1, 500)*.3)+.1;
x4 = (rand(1, 500)*.3)+.6;
x = [x1 x3 x4 x2];
x = x(randperm(2000));
y = [w;x];
agg1 = mean(y);
subplot(1, 3, 2);
histogram(agg1, 10);

for i = 1:30
    z1 = rand(1, 500)*.1;
    z2 = (rand(1, 500)*.1)+.9;
    z3 = (rand(1, 500)*.3)+.1;
    z4 = (rand(1, 500)*.3)+.6;
    z = [z1 z3 z4 z2];
    z = z(randperm(2000));
    matrix(i,:) = z;
end

agg2 = mean(matrix);
subplot(1, 3, 3);
histogram(agg2, 10);
axis([0 1 0 600]);
clf;