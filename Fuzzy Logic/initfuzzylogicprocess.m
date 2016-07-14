function [ flp ] =initfuzzylogicprocess( )
%Initialize membership functions and rules for Fuzzy Logic Process

%%
flp = newfis('responseIntensity');

flp = addvar(flp, 'input', 'accMagHoriz', [0 8]);
flp = addmf(flp, 'input', 1, 'accVeryLow', 'trimf', [0 0 2]);
flp = addmf(flp, 'input', 1, 'accLow', 'trimf', [0 2 4]);
flp = addmf(flp, 'input', 1, 'accMedium', 'trimf', [2 4 6]);
flp = addmf(flp, 'input', 1, 'accHigh', 'trapmf', [4 6 8 8]);

% flp = addvar(flp, 'input', 'forceExternalMag', [0 40]);
% flp = addmf(flp, 'input', 1, 'forceVeryLow', 'trapmf', [0 0 10 15]);
% flp = addmf(flp, 'input', 1, 'forceLow', 'trimf', [10 15 20]);
% flp = addmf(flp, 'input', 1, 'forceMedium', 'trimf', [15 20 25]);
% flp = addmf(flp, 'input', 1, 'forceHigh', 'trapmf', [20 25 40 40]);


% flp = addvar(flp, 'input', 'inclination', [-60 60]);
% flp = addmf(flp, 'input', 2, 'inclinedAwayBig', 'trapmf', [-90 -60 -15 -5]);
% flp = addmf(flp, 'input', 2, 'inclinedLevel', 'trapmf', [-7 -2 2 7]);
% flp = addmf(flp, 'input', 2, 'inclinedTowardBig', 'trapmf', [5 15 60 90]);

% flp = addvar(flp, 'input', 'inclination', [-60 60]);
% flp = addmf(flp, 'input', 2, 'inclinedAwayBig', 'trapmf', [-60 -60 -8 -2.5]);
% flp = addmf(flp, 'input', 2, 'inclinedLevel', 'trimf', [-5 0 5]);
% flp = addmf(flp, 'input', 2, 'inclinedTowardBig', 'trapmf', [2.5 8 60 60]);

flp = addvar(flp, 'input', 'inclination', [-60 60]);
flp = addmf(flp, 'input', 2, 'inclinedAwayBig', 'trapmf', [-90 -60 -15 -8]);
flp = addmf(flp, 'input', 2, 'inclinedLevel', 'trimf', [-2 0 2]);
flp = addmf(flp, 'input', 2, 'inclinedTowardBig', 'trapmf', [8 15 60 90]);
flp = addmf(flp, 'input', 2, 'inclinedAwaySmall', 'trimf', [-9.5 -5.5 -1.5]);
flp = addmf(flp, 'input', 2, 'inclinedTowardSmall', 'trimf', [1.5 5.5 9.5]);

flp = addvar(flp, 'input', 'gamma', [0 180]);
flp = addmf(flp, 'input', 3, 'flipAway', 'trapmf', [0 0 50 90]);
flp = addmf(flp, 'input', 3, 'flipSideway', 'trimf', [70 90 110]);
flp = addmf(flp, 'input', 3, 'flipToward', 'trapmf', [90 130 180 180]);

flp = addvar(flp, 'input', 'gyroHorizMag', [0 10]);
flp = addmf(flp, 'input', 4, 'gyroLow', 'trapmf', [0 0 0.5 1.5]);
flp = addmf(flp, 'input', 4, 'gyroMedium', 'trapmf', [1 1.5 3 3.5]);
flp = addmf(flp, 'input', 4, 'gyroHigh', 'trapmf', [3 4.5 10 10]);

flp = addvar(flp, 'output', 'responseIntensity', [-1 1]);
flp = addmf(flp, 'output', 1, 'towardBig', 'trapmf', [-1 -1 -0.9 -0.6]);
flp = addmf(flp, 'output', 1, 'towardSmall', 'trapmf', [-0.9 -0.6 -0.4 -0.1]);
flp = addmf(flp, 'output', 1, 'level', 'trapmf', [-0.4 -0.1 0.1 0.4]);
flp = addmf(flp, 'output', 1, 'awaySmall', 'trapmf', [0.1 0.4 0.6 0.9]);
flp = addmf(flp, 'output', 1, 'awayBig', 'trapmf', [0.6 0.9 1 1]);


% Rule Set 1
ruleList1 = [1	0	0	0	3	1	1; ...
            0	2	0	0	3	1	1; ...
            2	3	0	0	2	1	1; ...
            2	1	0	0	4	1	1; ...
            3	3	0	0	1	1	1; ...
            3	1	0	0	5	1	1; ...
            4	3	0	0	1	1	1; ...
            4	1	0	0	5	1	1; ...
            2   4   0   0   4   1   1; ...
            2   5   0   0   2   1   1; ...
            3   4   0   0   4   1   1; ...
            3   5   0   0   2   1   1; ...
            4   4   0   0   5   1   1; ...
            4   5   0   0   1   1   1];   
        
% Rule Set 2        
ruleList2 = [0	0	0	1	3	1	1; ...
            0	0	3	2	2	1	1; ... 
            0	0	3	3	1	1	1; ...
            0	0	1	2	4	1	1; ...
            0	0	1	3	5	1	1];

%--------------------------------------------------------%
% Rule Set 3
ruleList3 = [1 0 0 0 3 1 1; ...
            2 0 1 0 4 1 1; ...
            2 0 2 0 3 1 1; ...
            2 0 3 0 2 1 1; ...
            3 0 1 0 4 1 1; ... %output = 5?
            3 0 2 0 2 1 1; ...
            3 0 3 0 2 1 1; ... %output = 1?
            4 0 1 0 5 1 1; ...
            4 0 2 0 2 1 1; ...
            4 0 3 0 1 1 1];
        

% Rule Set 4
ruleList4 = [0	1	0	1	4	1	1;...
            0	4	0	1	3	1	1;...
            0	2	0	1	3	1	1;...
            0	5	0	1	3	1	1;...
            0	3	0	1	2	1	1;...
            0	1	0	2	5	1	1;...
            0	4	0	2	4	1	1;...
            0	5	0	2	2	1	1;...
            0	3	0	2	1	1	1;...
            0	1	0	3	5	1	1;...
            0	4	0	3	5	1	1;...
            0	5	0	3	1	1	1;...
            0	3	0	3	1	1	1];

%--------------------------------------------------------%

% Rule Set 5: 3 inputs(horiz accel, inclination, flipping dir)
ruleList5 = [1	2	3	0	3	1	1; ...
1	5	3	0	3	1	1; ...
1	3	3	0	2	1	1; ...
2	2	3	0	3	1	1; ...
2	5	3	0	2	1	1; ...
2	3	3	0	2	1	1; ...
3	2	3	0	2	1	1; ...
3	5	3	0	1	1	1; ...
3	3	3	0	1	1	1; ...
4	2	3	0	1	1	1; ...
4	5	3	0	1	1	1; ...
4	3	3	0	1	1	1; ...
1	1	2	0	4	1	1; ...
1	4	2	0	4	1	1; ...
1	2	2	0	3	1	1; ...
1	5	2	0	2	1	1; ...
1	3	2	0	2	1	1; ...
2	1	2	0	5	1	1; ...
2	4	2	0	4	1	1; ...
2	2	2	0	2	1	1; ...
2	5	2	0	2	1	1; ...
2	3	2	0	1	1	1; ...
3	1	2	0	5	1	1; ...
3	4	2	0	4	1	1; ...
3	2	2	0	2	1	1; ...
3	5	2	0	1	1	1; ...
3	3	2	0	1	1	1; ...
4	1	2	0	5	1	1; ...
4	4	2	0	5	1	1; ...
4	2	2	0	1	1	1; ...
4	5	2	0	1	1	1; ...
4	3	2	0	1	1	1; ...
1	1	1	0	4	1	1; ...
1	4	1	0	3	1	1; ...
1	2	1	0	3	1	1; ...
2	1	1	0	4	1	1; ...
2	4	1	0	4	1	1; ...
2	2	1	0	3	1	1; ...
3	1	1	0	5	1	1; ...
3	4	1	0	5	1	1; ...
3	2	1	0	4	1	1; ...
4	1	1	0	5	1	1; ...
4	4	1	0	5	1	1; ...
4	2	1	0	5	1	1];


ruleList = [ruleList1;ruleList2];
% ruleList = [ruleList3;ruleList4];      
% ruleList = [ruleList2;ruleList5];
flp = addrule(flp,ruleList);

% %% Plot membership functions
% figure();
% plotmf(flp,'input',1);
% figure();
% plotmf(flp,'input',2);
% figure();
% plotmf(flp,'input',3);
% figure();
% plotmf(flp,'input',4);
% figure();
% plotmf(flp,'output',1);


end

