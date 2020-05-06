%% ECE 498 - Matlab Homework #5
% Author: Derek Haas

clear;
clc;
close all;

%% Question 1: Set Operations

ece271 = [ % ID, Score
900, 34;
801, 90;
700, 77;
400, 33];
 
ece473 = [ % ID, Score
900, 67;
802, 99;
700, 35;
500, 88];

% Find all students. Dont have repeating IDs.
% Get the 271 and 473 ids.
% Then find where they are the same (union).
id_271 = ece271(:,1);
id_473 = ece473(:,1);
ids = union(id_271, id_473);

% Use intersect to get the indexes of 271 and 473 grades for the list of
% students.
[scores_271, index_id1, index_271] = intersect(ids, id_271);
[scores_473, index_id2, index_473] = intersect(ids, id_473);

% Create an array to hold id,  271 score, 473 score.
scores = zeros(length(ids), 3);
scores(:,1) = ids;
scores(index_id1,2) = ece271(index_271,2);
scores(index_id2,3) = ece473(index_473,2);

% Print scores to console.
scores


%% Question 2: Regular Expression

% Strings to parse.
str = 'Welcome to ECE 498! My phone number is 207-581-2499. My email is hello@maine.edu. How to contact you?';
 
addr1 = '5713 Chadbourne Hall, Orono, ME 04469-5713';
addr2 = '73 Harlow St, Bangor, ME 04401';
addr3 = '141 Center St, Old Town, ME 04468';
addr{1} = addr1;
addr{2} = addr2;
addr{3} = addr3;

% Get number of words in the string.
words = regexp(str, '\s+', 'split');
fprintf('Number of words in str: %d words\n', length(words));

% Get the amount of sentences in the string.
% A sentence ends in punctuation (. ? !) with a space after.
sentences = regexp(str, '[.?!] ', 'split');
fprintf('Number of sentences in str: %d sentences\n', length(sentences));

% Extract the email address from the string.
% Look for characters before @, after @, and .edu/com/org.
email = regexp(str, '[a-zA-Z0-9]+@[a-zA-Z]+.(edu|com|org)', 'match');
fprintf('Email address is: %s\n', string(email));

% Extract the phone number from the string.
% Look for sequence of digits 3 3 4, with or without -.
phone = regexp(str, '[0-9]{3}-?[0-9]{3}-?[0-9]{4}', 'match');
fprintf('Phone number is: %s\n', string(phone));


% Extract the five-digit zip code
% Look for 5 digits, and if applicable, (- 4 digits).
zip_code = regexp(addr, '[0-9]{5}(-[0-9]{4})?', 'match');
fprintf('Zip Codes are: %s, %s, %s\n\n', string(zip_code{1}), string(zip_code{2}), string(zip_code{3}));


%% Question 3: Tables

% Store the contents of the .dat into a table.
table = readtable('myPatients.dat');

% Get the age column and find the average.
age = table.(3)(:);
fprintf("The average age of the Patients is %d years old\n", mean(age));

% Get the gender column and find the number of males and females.
gender = table.(2)(:);
index = find(strcmp(gender, 'Male'));
num_males = length(index);
num_females = length(gender) - num_males;
fprintf("There are %d males and %d females\n", num_males, num_females);

% Get the height and weight from the dataset.
height = table.(5)(:);
weight = table.(6)(:);

% Calculate the BMI and store to new .dat file.
bmi = (weight*0.453592)./((height*0.0254).^2);
table.BMI = bmi;
writetable(table, 'myPatients2.dat');




