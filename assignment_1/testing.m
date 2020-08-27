clear
N = 6;
t=0;
x= rand(1, N);
x = x / sum(x);

while max(x) < .95
    x = x-.01;
    x = x/sum(x);
    t = t+1;
    allx(t,:) = x;
end
plot(allx)