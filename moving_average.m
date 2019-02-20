clc
clear
close all

n = 1:0.01:10;
x = sin(n);

figure(1);
subplot(2,3,1); plot(n,x);
title('data');

my_noise = 0.1*randn(size(x));

subplot(2,3,2); plot(n,my_noise);
title('the noise');

x2 = x + my_noise;
subplot(2,3,3); plot(n,x2);
title('data with noise');

M = 7;
y = zeros(size(x));
for k = floor(M/2)+1:length(x2)-floor(M/2)
   y(k) = + 1/M * x2(k-3) + 1/M * x2(k-2) + 1/M * x2(k-1) +  1/M * x2(k) + 1/M * x2(k+1) + 1/M * x2(k+2) + 1/M * x2(k+3);
end

subplot(2,3,4); plot(n,y);
hold on
subplot(2,3,4); plot(n,x,'r');
title('Centered moving average');

M = 7;
y2 = zeros(size(x));
for k = M:length(x2)
   y2(k) = 1/M * x2(k) + 1/M * x2(k-1) +  1/M * x2(k-2) + 1/M * x2(k-3) + 1/M * x2(k-4) + 1/M * x2(k-5) + 1/M * x2(k-6);
end

subplot(2,3,5); plot(n,y2);
hold on
subplot(2,3,5); plot(n,x,'r');
title('Moving average')
