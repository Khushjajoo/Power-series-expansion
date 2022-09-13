% Khushkumar Jajoo
% 10/31/2021
% ECE 202 Fall 2021
% Project 1 phase 2
% Power series expansion of 12 cos(40t)
% Making the output more nicer

clear
clf
format shortG

tms = linspace(0, 200, 401); % creating a time array to plot in ms
t = tms/1000; % converting time array from ms to s

% f = 12*cos(40*t) target function to plot

n = 0:2:10; % first non zero six terms indices in series (only even terms)
a = 12*(-1).^(n/2).*40.^n ./ factorial(n); % the general expression from
                                            % handwork
output_table = table(n.', a.', 'VariableName',...
      {'Index n', 'Coefficients'})
 
%----------- Creating plotting functions----------
f1 = a(1)*t.^n(1); % forst non zero term
f2 = f1 + a(2)*t.^n(2); % sum of first and second non zero term
f3 = f2 + a(3)*t.^n(3); % sum of first three non zero terms
f4 = f3 + a(4)*t.^n(4); % sum of first four non zero terms
f5 = f4 + a(5)*t.^n(5); % sum of first five non zero terms
f6 = f5 + a(6)*t.^n(6); % sum of first six non zero terms
%-------------- plotting the graph---------------
plot([0,200], [0,0], 'k', 'LineWidth', 1)
hold on
p1 = plot(tms,f1,tms,f2,tms,f3,tms,f4,tms,f5,"LineWidth",2);
p2 = plot(tms,f6,"LineWidth",4);
hold off

ax = gca;
ax.FontSize = 16;
ylim([-15,15])
xlabel("time t (ms)", "Fontsize", 18)
ylabel("f(t)", "Fontsize", 18)
title(["ECE 202, Project-1, Phase 2, Power series "...
       "expansion of f(t) = 12 cos(40t) using truncated"...
       "sums up to first six non-zero terms"], "Fontsize", 24)
legend ([p1;p2], "up to n = "+n,"FontSize",18, "Location",...
        "NorthEastoutside")
 grid on
 set (gca,"GridAlpha",0.4)