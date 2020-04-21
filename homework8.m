%% ECE 498 - Matlab 
% Author: Derek Haas

clear;
clc;
close all;

%% Question 1: Solve Diff Eqs Analytically

f1 = dsolve('Dy = (x^2 / y)', 'x')
f2 = dsolve('Dy + y^2 * sin(x) = 0', 'x')
f3 = dsolve('x * Dy = sqrt(1 - y^2)', 'x')


%% Question 2: Solve Diff Eqs Numerically

% First Diff Eq
f = @(x,y) (-x * y) / sqrt(2 - y^2);
[x, y] = ode45(f, [0 5], 1);

figure(1);
plot(x, y);
grid on;
title('Differential Equation: Numerical Solution');
xlabel('x');
ylabel('y');

% Second Diff Eq
y0=[1 -1 1];
xspan=[0 pi/2];
[x,y]= ode23('diff_eq', xspan, y0);

% Make the 3 subplots
% This is for Y1
figure(2);
subplot(3,1,1);
plot(x,y(:,1));
title('Y1');
grid on;

% This is for Y2
subplot(3,1,2);
plot(x,y(:,2));
title('Y2');
grid on;

% This for Y3
subplot(3,1,3);
plot(x,y(:,3));
title('Y3');
grid on;

