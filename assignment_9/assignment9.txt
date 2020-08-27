clear;

allmaxnet = zeros(10, 50);

for run = 1:10
    x = 0;
    cells = 100;
    maxnet = zeros(1, 50);
    for edges = 5:5:250
        x = x+1;
        m = zeros(cells, cells);
        
        while sum(sum(m)) < edges
            i = randi([1 (cells-1)], 1);
            j = randi([(i+1) cells], 1);
            m(i,j) = 1;
        end
        
        netsize = zeros(1, cells);
        
        for n = 1:cells
            cellacts = zeros(1, cells);
            cellacts(n) = 1;
            
            for t = 1:cells
                cellacts = cellacts + (cellacts * m);
            end
            netsize(n) = numel(cellacts(cellacts ~= 0));
        end
        maxnet(x) = max(netsize);
    end
    allmaxnet(run,:) = maxnet;
end

plot(0.05:0.05:2.5, mean(allmaxnet));
