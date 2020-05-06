%% ECE 498 - Matlab 
% Author: Derek Haas

clear;
clc;
close all;


%% Question 1: Maximizing Profit of Crops

% 75 Acres to Plant
% P(x,y)=143x+69y
% 110x+30y≤4000
% 120x+210y≤15000
% x≥0, y≥0, x+y≤75

% This is the profit.
p = [143; 69];

% These are the coefs of x and y.
A = [110 30
    120 210
    1 1];

% These are the RHS to the inequalities.
b = [4000; 15000; 75];

% Lower bounds
lb = zeros(2,1);

% Use linear programmingto find the optimal solution.
[val, fval, exitflag, output, lambda] = linprog(-p,A,b,[],[],lb);
fprintf("Crop A acres: %d\nCrop B acres: %d\n", val(1), val(2));

[A, B] = meshgrid(0:0.05:75);
Y = 143 * A + 69 * B;

% Visually Verify.
figure(1);
meshc(A,B,Y);
title('Profit Graph');
colormap jet
colorbar
xlabel('A');
ylabel('B');
zlabel('Y');


%% Question 2: Production Planning

% Profit(A,B) = 4A + 5B
% A + B < 200
% 1.25A + 0.75B < 200
% Upper bounds: A->none B->150

% This is the profit.
p = [4; 5];

% These are the coefs of A and B.
A = [1 1
    1.25 0.75];

% These are the RHS to the inequalities.
b = [200; 200];

% Upper bounds.
ub = [inf; 150];

% Use linear programmingto find the optimal solution.
[val, fval, exitflag, output, lambda] = linprog(-p,A,b,[],[],[],ub);
fprintf("Number of product A: %d\nNumber of Product B: %d\n", val(1), val(2));

[A, B] = meshgrid(0:0.5:500);
Y = 4 * A + 5 * B;

% Visually Verify.
figure(2);
meshc(A,B,Y);
title('Production Graph');
colormap jet
colorbar
xlabel('A');
ylabel('B');
zlabel('Y');


%% Question 3: Minimizing Multi-Variable Function

% f(x,y,z)=(x2+y2)2−x2−y+z2

% Find the minimum value of the function.
x0 = [0 0 0];
f = @(x) (x(1)^2 + x(2)^2)^2 - x(1)^2 - x(2) + x(3)^2;
[x,fval] = fminunc(f,x0);

fprintf('Min Value %d at X=%d, Y=%d, Z=%d\n', fval,x(1),x(2),x(3));


%% Question 4: Minimaizing Mult-Variable Function Again.

% f(x1,x2)=2x^2+20y^2+6xy+5x
% x - y = -2

% Find the minimum value of the function.
x0 = [0 0];
f = @(x) 2*x(1)^2 + 20*x(2)^2 + 6*x(1)*x(2) + 5*x(1);

% This is the constraint.
A = [1 -1];
b = -2;

[x, fval] = fmincon(f, x0, A, b);
fprintf('Min Value %d at X=%d, Y=%d\n', fval,x(1),x(2));

[x, y] = meshgrid(-5:0.005:5);
f = 2*x^2 + 20*y^2 + 6*x*y + 5*x;

% Visually Verify.
figure(3);
meshc(x,y,f);
title('Minimizing Value');
colormap jet
colorbar
xlabel('X');
ylabel('Y');
zlabel('F');

