clear;

nodes = 100;
bias = 2;
links = 500;
net = zeros(nodes, nodes);

yey = ones(nodes);
for a = 1:nodes
    yey(a,a) = 0;
end

for n = 1:nodes
    x = randi([1 nodes], 1);
    
    while x == n
        x = randi([1 nodes], 1);
    end
    
    net(n,x) = 1;
    net(x,n) = 1;
end
net = net.*yey;

for n = 1:10
    x = randi([1 nodes], 1);
    y = randi([1 nodes], 1);
    
    while x == y
        y = randi([1 nodes], 1);
    end
    
    net(x,y) = 1;
    net(y,x) = 1;
end

net = net.*yey;

while (nnz(net)/2) < links
    PEdge = sum(net,1) / nodes;
    PEdge = (PEdge.^bias) / sum(PEdge.^bias);
    choice = rand(1);
    criterion = 0;
    
    for nn = 1:nodes
        criterion = criterion + PEdge(nn);
        if choice < criterion
            choice = nn;
            break;
        end
    end
    
    for nnn = 1:10000
        i = choice;
        j = randi([1 nodes], 1);
        
        if net(i,j) == 0
            net(i,j) = 1;
            net(j,i) = 1;
            break;
        end
    end 
end

net = net.*yey;
netl = net((net + net.') > 0);

subplot(1,3,1);
p1 = histogram(sum(netl.'), 10);
n = p1.Values;
x = p1.Values;

subplot(1,3,2);
p2 = loglog(n, x, '*');
xlim([1 100]);
ylim([1 100]);

subplot(1,3,3);
N = length(netl);
theta = linspace(0, 2*pi, N).';
k = cos(theta);
l = sin(theta);
xy = [k(:), l(:)];
p3 = gplot(netl, xy);