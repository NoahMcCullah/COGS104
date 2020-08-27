clear;

epochs = 0;

inputs = [1 0 0 0;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];
      
targets = [1 0;
           1 0;
           0 1;
           0 1];
       
W = (2).*rand(4,2) - 1;
mse = intmax;
Lrate = .1;

while mse > 0.05
    epochs = epochs + 1;
    
    for n = 1:4
        in = inputs(n,:);
        targ = targets(n,:);
        
        out = in * W;
        Err = targ - out;
        errs(n) = mean(Err.^2);
        
        delta = Lrate * ((Err)' * in)';
        W = W - delta;
    end
    
    mse = mean(errs)
    MSEs(epochs) = mse;
    
    if epochs > 100
        mse = -1;
    end
    
end

disp(epochs)
plot(MSEs);
