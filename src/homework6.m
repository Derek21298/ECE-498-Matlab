%% ECE 498 - Matlab 
% Author: Derek Haas

clear;
clc;
close all;

%% Question 1: Curve Fitting

enrollment = [
% Year	
1995	1996	1997	1998	1999	2000	2001	2002	2003	2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015    2016
% UM	
9996	9928	9213	9451	9945	10282	10698	11135	11222	11358	11435	11797	11912	11818	11867	11501	11168	10901	11247	11286   10922   11219
% UMA	
6023	5496	5248	5130	5612	5617	5575	5722	5943	5538	5494	5257	5101	4974	5054	5074	4974	4990	4770	4664    4683    4416
% UMF	
2510	2512	2446	2507	2479	2413	2435	2395	2420	2349	2452	2424	2265	2227	2238	2322	2269	2179	2061	1960    2016    2000
% UMFK	
731	767	690	827	926	886	897	827	924	1076	1193	1339	1269	1102	1126	1073	1080	1169	1209	1327    1559    1904
% UMM	
856	915	884	899	908	927	1017	1068	1313	1191	1149	1259	1093	1023	964	951	863	925	892	810     786     745
% UMPI	
1278	1347	1307	1344	1378	1427	1367	1560	1546	1652	1548	1655	1533	1455	1436	1434	1453	1463	1263	1138    1289    1326
% USM	
9721	9966	10230	10462	10645	10820	10966	11382	11007	11089	10974	10478	10453	10009	9655	9654	9301	9385	8923	8428    7739    7855
];

% Get data needed to make the fitting.
year = enrollment(1,:);
um = enrollment(2,:) / 1e3;

% Perform curve fitting.
% I chose poly5 because the curve appeared to fit the data the best without
% overfitting.  The future values of poly5 also look reasonable.
f = fit(year', um', 'poly5', 'Normalize', 'on');

% This is for calculating future confidence intervals
yearFuture = (2016:1:2020).';
enrollFuture = f(yearFuture);
ci = predint(f, yearFuture, 0.95, 'observation');

% Make a plot of the regular data and fitted data.
figure(1);

% Plot the regular data.
plot(year, um, 'LineWidth', 3, 'Color', 'g');
hold on;
% Plot the fitted data and future data.
plot(f, year', um', 'predobs');
plot(f)
% Plot the future confidence intervals.
errorbar(yearFuture, enrollFuture, enrollFuture-ci(:,1), ci(:,2)-enrollFuture, '.');

% Make the graph look nice.
grid on;
title('UMaine Enrollment');
xlabel('Year');
ylabel('Enrollment (Thousands)');
legend('Unfitted Data', 'Recorded Data Points', 'Fitted Curve');
xlim([1995 2021]);

% Make a plot of the residuals.
figure(2);
plot(f, year', um', 'residuals');
xlim([1995 2016]);
xlabel('Year');
ylabel('Residuals');
title('Residuals Plot');
grid on;




