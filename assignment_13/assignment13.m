clear;
epoch = 0;
mse = intmax;
Lrate = 0.1;

inputs = [0 0;
         1 0;
         0 1;
         1 1];
 
targets = [0;
          1;
          1;
          0];
      
in2hidden = (2).*rand(2,2) - 1;
hidden2out = (2).*rand(2,1) - 1;

while mse > 0.01
    epoch = epoch + 1;
    for n = 1:4
        
        in = inputs(n,:);
        targ = targets(n,:);
        
        hiddenAct = 1./(1 + exp(-(in * in2hidden)));
        outputAct = 1./(1 + exp(-(hiddenAct * hidden2out)));
        
        sqErr = (targ - outputAct).^2;
        sqErrs(n) = sqErr;
        
        delta2 = Lrate * ((outputAct.*(1-outputAct).*sqErr)' * in)';
        delta1 = Lrate * ((hiddenAct.*(1-hiddenAct).*sqErr)' * in)';
        
        hidden2out = hidden2out - delta2;
        in2hidden = in2hidden - delta1;
    end
    
    mse = mean(sqErrs)
    MSEs(epoch) = mse;
    
    if epoch > 1000
        break;
    end
end
plot(MSEs);