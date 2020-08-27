clear

%%%%%%%%%%     Part 1     %%%%%%%%%%
ff = [];
tails = 0;
one = round(rand(10000));

for i = 4:9999
   if one(i)==1 && one(i-1)==1 && one(i-2)==1 && one(i-3)==1
       ff = [ff; one(i+1)];
   end
end

disp(nnz(~ff) / length(ff)) %will be approximately 50%
if nnz(~ff) >= length(ff)/2 
    disp("Gambler's fallacy is a falacy")
end

%%%%%%%%%%     Part 2     %%%%%%%%%%

hh = 0;

for a = 1:10000
    first = round(rand(1));
    if first == 1
        second = round(rand(1));
        if second == 1
            hh = hh+1;
        end
    end
end

disp(hh / 10000); %Will be around .25
