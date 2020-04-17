%% ECE 498 - Matlab
% Author: Derek Haas

clear all;
clc;
close all;

%% Figure 1: Enneper Surface

% Give values to u and v
u = linspace(-1.5, 1.5, 50);
v = u;
[u, v] = meshgrid(u, v);

% Functions that make up the Enneper surface.
X = u .* (1 - ((u.^2)/3) + v.^2);
Y = -v .* (1 - ((v.^2)/3) + u.^2);
Z = u.^2 - v.^2;

% Make the 3D surface.
figure(1);
handles = surfc(X,Y,Z);
 
% handles is a 2-element array of handles: the surface plot and the contours
hContour = handles(2); % get the handle to the contour lines
hContour.ContourZLevel = -2.5; % set the contour's Z position (default: hAxes.ZLim(1)=-10)
 
% We can also customize other aspects of the contour lines, for example:
hContour.LineWidth = 1; % set the contour lines' width (default: 0.5)
 
% Make the plot look good.
camlight left
colormap(jet)
axis tight
xlabel('X')
ylabel('Y')
zlabel('Z')

% Change the ticks to match the HW.
xticks([-3:1:3]);
yticks([-3:1:3]);
zticks([-2.5:0.5:2]);

%% Figure 2: One-surface Hyperboloid

% Equations to make the Hyperboloid.
a = 1; b = 1; c = 1;
v = linspace(-2, 2, 40);
u = linspace(0, 2*pi, 40);
[u, v] = meshgrid(u, v);
x = a .* cosh(v) .* cos(u);
y = b .* cosh(v) .* sin(u);
z = c * sinh(v);
 
% Make the 3D plot.
figure(2);
mesh(x, y, z)
 
% select color scheme
colormap('cool')
 
% Display the colorbar tick marks and tick labels on the side of a colorbar
colorbar('AxisLocation','in')

% Make the plot look good.
axis tight
xlabel('X')
ylabel('Y')
zlabel('Z')
set(gca,'BoxStyle','full','Box','on')
xticks([-3:1:3]);
yticks([-3:1:3]);
zticks([-3:1:3]);


%% Figure 3: Rastrigin Function

x = linspace(-5.12,5.12,100);
y = linspace(-5.12,5.12,100);
[X, Y] = meshgrid(x, y);
Z = 20 + (X.^2 - 10*cos(2*pi.*X)) + (Y.^2 - 10*cos(2*pi.*Y));

figure(3);
surfc(X,Y,Z,'FaceColor','interp',...
    'EdgeColor','none',...
    'FaceLighting','gouraud')
 
colormap('jet')
camlight('headlight')
axis tight
xlabel('X')
ylabel('Y')
zlabel('Z')
zticks([0:10:80]);




