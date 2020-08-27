clear;
learningRate = 0.1;
inputs = [1 1 1 0 0 0 0 0 0;
        0 0 1 1 1 0 0 0 0;
        0 0 0 0 1 1 1 0 0;
        0 0 0 0 0 0 1 1 1];

weights = rand(9,4);
weights = weights./repmat(sqrt(sum(weights.^2)), 1, 4);

for epoch = 1:200
    for n = 1:4
        in = inputs(n,:);
        output = in.*weights;
        [r,c] = max(output(n,:));
        weights(r,:) = weights(r,:) + learningRate * (in' - weights(r,:));
    end
end

weights = weights./repmat(sqrt(sum(weights.^2)), 1, 4);
