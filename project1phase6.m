% Khushkumar Jajoo
% 12/1/2021
% ECE 202 Fall 2021
% Project 1 phase 6
% Plotting the sum of non zero terms of truncated power 
% series for f(t) = 12 cos 40(t) upto six non zero terms
% understanding the Taylor series

clear
clf
format shortG

tmin = input("Enter starting time in ms: "); % starting time in ms
tmax = input("Enter ending time in ms: "); % end time in ms
N = input("Enter number of intervals: "); % number of intervals in 
                                          % linspace
tms = linspace(tmin, tmax, N+1); % time array in ms
t = tms/1000; % cconverting time array from ms to s

% f = 12*cos(40*t) target function to plot

A = 12; % amplitude in the function and graph
w = 40; % angular frequency in function and graph
terms = input("Enter number of non zero terms: "); % number of non zero 
                                                   % terms to be printed

n = 0:2:(terms-1)*2; % first non zero six terms indices in series 
                     % (only even terms)

a = A*(-1).^(n/2).*w.^n ./ factorial(n); % the general expression
                                         % from handwork

output_table = table(n.', a.', 'VariableName',...
     {'Index n', 'Coefficients'})
                 
%----------- Creating plotting functions----------
f = zeros(1,N+1);
p = zeros(terms,1);
plot([tmin,tmax], [0,0], 'k', 'LineWidth', 1);
hold on 
for i = 1:terms
    f = f + a(i)*t.^n(i);
    if i ~= terms
        p(i) = plot(tms, f, "LineWidth", 2);
    else
        p(terms) = plot(tms, f, "LineWidth", 4);
    end
end
hold off

%---------- Check using previous script--------------
if terms ==6 % printing check when number of non zero terms are 6
   f1 = a(1)*t.^n(1); % first non zero term
   f2 = f1 + a(2)*t.^n(2); % sum of first and second non zero term
   f3 = f2 + a(3)*t.^n(3); % sum of first three non zero terms
   f4 = f3 + a(4)*t.^n(4); % sum of first four non zero terms
   f5 = f4 + a(5)*t.^n(5); % sum of first five non zero terms
   f6 = f5 + a(6)*t.^n(6); % sum of first six non zero terms
   check = sum(abs(f-f6));  % should be zero
end

%-------------- plotting the graph---------------
diff = abs(A*cos(w*t) - f); % difference between 2 functions
aveDeviation = sum(diff)/length(diff) % average standard deviation
ax = gca;
ax.FontSize = 16;
ylim([-1.25*A,1.25*A])
xlabel("time t (ms)", "Fontsize", 18)
ylabel("f(t)", "Fontsize", 18)
str1 = sprintf("Power series expansion of f(t) = %ucos(%ut)",A,w);
str2 = sprintf("using truncated sums up to first %u non-zero terms"...
               ,terms);
str3 = sprintf("with an Average Deviation of %0.4g",aveDeviation);
title(["ECE 202, Project-1, Phase 6", str1, str2, str3], "Fontsize", 24);
legend (p, "up to n = "+n,"FontSize",18, "Location",...
         "NorthEastoutside");
grid on 
set (gca,"GridAlpha",0.4);

% a) Through trial the smallest number of non-zero terms with an average
%    deviation of less than 0.05 is 11 terms with an average deviation of
%    0.032

% b) When the intervals are doubled the deviation is still close 
%    to the deviation as before doubling with a value of 0.313.

% c) The deviation from -200ms to 0ms will be the same as that of
%    0ms to 200ms as the function is a cosine function and as we 
%    already know that it is mirrored along the y axis, hence the 
%    deviation will more or less be similar to the original value.

% d) The value for aveDeviation was close to the average deviation of 
%    the first graph with a value of 0.0327. This means that the
%    hypothesis in part (c) was correct and that is what took place


% e) The average deviation will be similar to answer (a) a small value 
%    since the standard deviation will be low from 200 ms to 400 ms, but
%    it will also be small value from 0 to 200 ms thus, the  aveDeviation
%    will still be small.

% f) During the second 200 ms the last transform goes stray to a very 
%    high number. This happened because the number of non-zero terms 
%    were only sufficient to compute accuracy till 200 ms, anything  
%    after that did not follow the original function thus causing the 
%    huge value for aveDeviation.

% g) 22 non zero terms are required  until 400 ms
