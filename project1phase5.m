% Khushkumar Jajoo
% 12/1/2021
% ECE 202 Fall 2021
% Project 1 phase 5
% Plotting the sum of non zero terms of truncated power 
% series for f(t) = 12 cos 40(t) upto six non zero terms
% Letting the user define the paraameters

clear
clf
format shortG

tmin = input("Enter starting time in ms: "); % starting time in ms
tmax = input("Enter ending time in ms: "); % end time in ms
N = input("Enter number of intervals: "); % number of intervals in linspace
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
f = zeros(1,N);
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
title(["ECE 202, Project-1, Phase 5", str1, str2, str3], "Fontsize", 24);
legend (p, "up to n = "+n,"FontSize",18, "Location",...
         "NorthEastoutside");
grid on 
set (gca,"GridAlpha",0.4);