clear

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

prop = hh / 10000;
disp(prop);