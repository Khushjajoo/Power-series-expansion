% Khushkumar Jajoo
% 10/31/2021
% ECE 202 Fall 2021
% Project 1: Power Series expansion of A cos(wt)
% Phase 1: Approximating f(t) = 12 cos(40t) using truncated sums
% upto six non zero terms, getting to work something quickly

clear
clf
format shortG

t = linspace(0, 0.2, 401); % creating a time array to plot, in s

% f = 12*cos(40*t) target function to plot

n = 0:2:10; % first non zero six terms indices in series (only even terms)


a = 12*(-1).^(n/2).*40.^n ./ factorial(n)  % the general expression from 
                                            % handwork


%----------- Creating plotting functions----------
f1 = a(1)*t.^n(1); % first non zero term
f2 = f1 + a(2)*t.^n(2); % sum of first and second non zero term
f3 = f2 + a(3)*t.^n(3); % sum of first three non zero terms
f4 = f3 + a(4)*t.^n(4); % sum of first four non zero terms
f5 = f4 + a(5)*t.^n(5); % sum of first five non zero terms
f6 = f5 + a(6)*t.^n(6); % sum of first six non zero terms


%-------------- plotting the graph---------------
plot(t,f1,t,f2,t,f3,t,f4,t,f5,t,f6...
     , "Linewidth", 3);
ylim([-15,15])
xlabel("time t (s)", "Fontsize", 18)
ylabel("f(t)", "Fontsize", 18)
title(["ECE 202, Project-1, Phase 1, Power series "...
       "expansion of f(t) = 12 cos(40t) using truncated"...
       "sums up to first six non-zero terms"], "Fontsize", 24)
grid on 
set (gca,"GridAlpha",0.4)