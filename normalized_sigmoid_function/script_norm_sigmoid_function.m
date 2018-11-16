% 2018/3/23
% Jungwon Kang
% https://dinodini.wordpress.com/2010/04/05/normalized-tunable-sigmoid-functions/

clc;
clear all;
close all;

k = 0.3;

x_set = 0.0:0.01:1.0;
y_set = zeros(1, length(x_set));

for idx = 1:length(x_set),
    x = x_set(idx);
    
    if x > 0.5,
        y = (k*x + 2*x - 1)./(k + 2*x - 1);
    else
        y = (k*x)./(k - 2*x + 1);
    end
    
    y_set(idx) = y;    
end

figure(1);
    plot(x_set, y_set, 'b-', 'LineWidth', 3);
    axis equal;
    axis tight;


