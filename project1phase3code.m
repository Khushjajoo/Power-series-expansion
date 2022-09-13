
  % Khushkumar Jajoo
  % 11/13/2021
  % ECE 202 Fall 2021
  % Project 1 phase 3
  % Plotting the sum of non zero terms of truncated power 
  % series for f(t) = 12 cos 40(t) upto six non zero terms
  % making sure that nothing is hardcoded and is reusable

 clear 9 clf
 format shortG
 
 tmin = 0; % starting time in ms
 tmax = 200; % end time in ms
 N = 401; % number of points in linspace
 tms = linspace(tmin, tmax, N); % time array in ms
 t = tms/1000; % cconverting time array from ms to s
 
  % f = 12*cos(40*t) target function to plot
 
  A = 12; % amplitude in the function and graph
  w = 40; % angular frequency in function and graph, in rad/s
  terms = 6; % number of non zero terms to be printed
 
  n = 0:2:(terms-1)*2; % first non zero six terms indices in series
                       % (only even terms)
 
  a = A*(-1).^(n/2).*w.^n ./ factorial(n); % the general expression from
                                           % handwork
 
  output_table = table(n.', a.', 'VariableName',...
       {'Index n', 'Coefficients'})
 
  %----------- Creating plotting functions----------
f1 = a(1)*t.^n(1); % first non zero term
f2 = f1 + a(2)*t.^n(2); % sum of first and second non zero term
f3 = f2 + a(3)*t.^n(3); % sum of first three non zero terms
f4 = f3 + a(4)*t.^n(4); % sum of first four non zero terms
f5 = f4 + a(5)*t.^n(5); % sum of first five non zero terms
f6 = f5 + a(6)*t.^n(6); % sum of first six non zero terms

 
  %-------------- plotting the graph---------------
  plot([tmin,tmax], [0,0], 'k', 'LineWidth', 1)
  hold on
  p1 = plot(tms,f1,tms,f2,tms,f3,tms,f4,tms,f5,"LineWidth",2);
  p2 = plot(tms,f6,"LineWidth",4);
  hold off
  ax = gca;
  ax.FontSize = 16;
  ylim([-1.25*A 1.25*A])
  xlabel("time t (ms)", "Fontsize", 18)
  ylabel("f(t)", "Fontsize", 18)
  str1 = sprintf("Power series expansion of f(t) = %ucos(%ut)",A,w);
  str2 = sprintf("using truncated sums up to %u non-zero terms"...
                 ,terms);
  title(["ECE 202, Project-1, Phase 3", str1, str2], "Fontsize", 24)
  legend ([p1;p2], "up to n = "+n,"FontSize",18, "Location",...
           "NorthEastoutside")
  grid on
  set (gca,"GridAlpha",0.4)
  
  % the output and the graph should be similar to phase 2 as we
  % have not changed the function just removed the hardcoded values
  % the graph would be the same with same axes limits and lines