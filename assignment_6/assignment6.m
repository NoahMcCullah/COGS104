clear;

saveY = [4000, 40];
for h = 1:4000
    x = 0;
    y = rand(1);
    
    for t = 1:1000
        y = (h/1000) * y * (1-y);
        
        if t > 960
            x = x+1;
            saveY(h, x) = y;
        end
        
    end
    
end

p = plot(saveY);
set(p, 'markersize', 1);