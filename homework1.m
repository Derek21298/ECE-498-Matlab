%% Homework #1

clc;
clear;

% The first column consists of student ids.
% The second column consists of their scores.
roster = [
        8000          80
        8001          39
        8002          24
        8003          40
        8004          10
        8005          13
        8006          94
        8007          96
        8008          58
        8009          16
        8010          23
        8011          35
        8012          82
        8013          12
        8014          34
        8015          17
        8016          65
        8017          73
        8018          65
        8019          4];
    
% Find out how many students in ECE 498? (Hint: size)

class_size = size(roster, 1)

% What is the highest score? (Hint: max)

highest_score = max(roster(:,2))

% Who has the highest score? (Hint: max)

highest_student = roster(roster(:,2) == max(roster(:,2)),1)

% What is the lowest score? (Hint: min)

lowest_score = min(roster(:,2))

% What is the median score? (Hint: median)

median_score = median(roster(:,2))

% What is the mean score? (Hint: mean)

mean_score = mean(roster(:,2))

% What is the sum of all scores? (Hint: sum)

sum_score = sum(roster(:,2))

% Find out how many students have a score greater than 60 (Hint: sum)

above_60 = sum(roster(:,2) > 60)

% Sort the roster based on the scores in descending order. The student ids have to remain in the same row as their scores. (Hint: sort)

sorted = sortrows(roster,2,'descend')

% Remove the row from the roster that contains the highest score (Hint: max)

roster(find(roster(:,2) == highest_score),:) = [] 



