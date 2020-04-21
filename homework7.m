%% ECE 498 - Matlab
% Author: Derek Haas

clear;
clc;
close all;

%% Question 1: Finding Roots

% Create an inline function to find the roots of.
y = inline('0.05 * x - sin(x)');

% Use fzero() to find the roots. Go from -5 to 5.
for i=-5:5
    % Dont print roots that will show up twice.
    if(fzero(y,i) ~= fzero(y,i-1))
        fprintf("Zero found at x=%d\n", fzero(y,i));
    end
end


%% Question 2: Finding Roots Again

% Y = x7 + 2x6 - 7x5 - 8x4 + 10x3 + 0x2 + 8x + 0
polyCoefs = [1 2 -7 -8 10 0 8 0];
x = roots(polyCoefs)


%% Question 3: Solve non-linear equation

% Use matlab function to solve the system of equations
x0 = [0,0,0]';
x = fsolve('nle', x0)

