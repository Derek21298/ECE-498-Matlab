%% Homework #2

clear;
close all;
clc;

enrollment = [
% Year	
1995	1996	1997	1998	1999	2000	2001	2002	2003	2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015    2016    2017
% UM	
9996	9928	9213	9451	9945	10282	10698	11135	11222	11358	11435	11797	11912	11818	11867	11501	11168	10901	11247	11286   10922   11219    11240
% UMA	
6023	5496	5248	5130	5612	5617	5575	5722	5943	5538	5494	5257	5101	4974	5054	5074	4974	4990	4770	4664    4683    4416    4014
% UMF	
2510	2512	2446	2507	2479	2413	2435	2395	2420	2349	2452	2424	2265	2227	2238	2322	2269	2179	2061	1960    2016    2000    2080
% UMFK	
731	767	690	827	926	886	897	827	924	1076	1193	1339	1269	1102	1126	1073	1080	1169	1209	1327    1559    1904   1760
% UMM	
856	915	884	899	908	927	1017	1068	1313	1191	1149	1259	1093	1023	964	951	863	925	892	810     786     745    701
% UMPI	
1278	1347	1307	1344	1378	1427	1367	1560	1546	1652	1548	1655	1533	1455	1436	1434	1453	1463	1263	1138    1289    1326   1408
% USM	
9721	9966	10230	10462	10645	10820	10966	11382	11007	11089	10974	10478	10453	10009	9655	9654	9301	9385	8923	8428    7739    7855    7794
];

%% Problem #1

% Split the enrollment data into the respective universities.
year = enrollment(1,[1:end-1]);
um = enrollment(2,[1:end-1]) / 1e3;
uma = enrollment(3,[1:end-1]) / 1e3;
umf = enrollment(4,[1:end-1]) / 1e3;
umfk = enrollment(5,[1:end-1]) / 1e3;
umm = enrollment(6,[1:end-1]) / 1e3;
umpi = enrollment(7,[1:end-1]) / 1e3;
usm = enrollment(8,[1:end-1]) / 1e3;

%% Figure 1

% Create a stacked bar graph for the different university enrollemnts.
% Divide by 1e3 to put in terms of thousands.
figure(1);
bar(year, enrollment([2:8], [1:end-1])' / 1e3, 'stacked');
% Now make the graph match the one in the HW.
grid on;
title('Enrollment of University of Maine Campuses, 1995-2016');
xlabel('Year');
ylabel('Total Enrollment (Thousands)');
xlim([1994.5 2016.5]);
set(gca,'XTick',[1995:1:2016]);
legend('UM', 'UMA', 'UMF', 'UMFK', 'UMM', 'UMPI', 'USM', 'Location', 'southwest');

%% Figure 2

% Create a line chart for UM and USM enrollment percentages.
% Find the total enrollment and multiply by 100 to get %.
figure(2);
UMpercent = (um ./ sum(enrollment([2:8], [1:end-1]))) * 100;
USMpercent = (usm ./ sum(enrollment([2:8], [1:end-1]))) * 100;
% Plot UM data, wait, then plot the USM data.
plot(year, 1000 * UMpercent, '--or', 'LineWidth', 3);
hold on;
plot(year, 1000 * USMpercent, ':m^', 'LineWidth', 3);
% Make the graph match the one in the HW.
grid on;
legend('UM', 'USM', 'Location', 'northwest')
xlim([1995 2016]);
xlabel('Year')
set(gca,'XTick',[1996:2:2016]);
ylabel('Percentage of System Total (%)')

%% Figure 3

% Plot a stacked bar graph and line chart on top of each other.
figure(3);
% An array of the line chat data
data = [1000 * UMpercent; 1000 * USMpercent];

% Use plotyy for two different y axis values.
% ax is the axis information.  ax(1) is bar chart. ax(2) is line chart.
% hBar is the bar chart data.
% hLine is the line chart data.
[ax, hBar, hLine] = plotyy(year, enrollment([2:8], [1:end-1])'/1e3, year, data, 'bar', 'plot');
set(hBar, 'BarLayout', 'stacked');

% Make the appropriate Y axis labels.
ylabel(ax(1),'Enrollment (Thousands)', 'FontSize', 14);
ylabel(ax(2),'Percentage of Total Enrollment (%)', 'FontSize', 14);

% Make the lines of the line chart look correctly.
set(hLine(1), 'LineStyle', '--', ...
              'Marker', 'o', ...
              'Color', 'r', ...
              'LineWidth', 2);          
set(hLine(2), 'LineStyle', '--', ...
              'Marker', '^', ...
              'Color', 'm', ...
              'LineWidth', 2);

% Now make the graph look like the HW.
grid(ax(1), 'on');
xlim(ax(1),[1994.5 2016.5]);
xlim(ax(2),[1994.5 2016.5]);        
ylim(ax(1), [0, 35]);
ylim(ax(2), [26, 40]);
set(ax(1),'YTick',0:5:35);
set(ax(2),'YTick',26:2:40);
legend('UM', 'UMA', 'UMF', 'UMFK', 'UMM', 'UMPI', 'USM', 'UM', 'USM', 'Location', 'northoutside', 'Orientation', 'horizontal');
xticks([1996:2:2016]);

%% Figure 4

figure(4);

% Get the year over year growth.
YOY = diff(um);
YOYyear = linspace(1996, 2016, 21);

% Plot the bar chart and line chart on top of eachother.
[ax, hBar, hLine] = plotyy(year, um, YOYyear, YOY * 10, 'bar', 'plot');

% Make the appropriate Y axis labels.
ylabel(ax(1),'Enrollment (Thousands)', 'FontSize', 14);
ylabel(ax(2),'Year over year growth (%)', 'FontSize', 14);

% Set the parameters of the line and bar chart.
set(hLine(1), 'LineStyle', '--', ...
              'Marker', 'o', ...
              'Color', 'r', ...
              'LineWidth', 2); 
set(hBar(1), 'FaceColor', 'g', ...
             'EdgeColor', 'g');

% Set the axes to be correct.
grid(ax(1), 'on');
ylim(ax(1), [9, 12]);
ylim(ax(2), [-10, 10]);
yticks(ax(1), [9:.5:12]);
xlim(ax(1),[1994.5 2016.5]);
xlim(ax(2),[1994.5 2016.5]);
legend('UM Enrollment', 'UM YoY Growth', 'Location', 'northoutside', 'Orientation', 'horizontal');
xticks([1996:2:2016]);






