clear;
clf;

mandelbrot = zeros(300, 200);

i = 1; 
for real = -2:0.01:1
    j = 1;
   for imag = -1:0.01:1 
       z = 0;
       c = real + imag*i;
       zs = [];
       
       for n = 1:100
           z = z^2 + c;
           zs(n) = z;
       end
       
       if numel(zs(abs(zs) < 2)) == 100
           mandelbrot(i, j) = 1;
       end
       
       j = j+1;
   end
   i = i+1;
end

myColorMap = [1 1 1
              0 0 0];

figure,
imagesc(-2:0.01:1, 1:0.01:-1, mandelbrot*2),
colormap cool
axis square