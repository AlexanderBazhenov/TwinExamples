% 2024-10-30
% Simple Twin example
% forecast corridor
% external
y_ex = (b_ex_left + b_ex_rigth)/2;
epsilon_ex = (-b_ex_left + b_ex_rigth)/2;
irp_Simple_ex = ir_problem(xx, y_ex, epsilon_ex);
% inner
y_in = (b_in_left + b_in_rigth)/2;
epsilon_in = (-b_in_left + b_in_rigth)/2;
irp_Simple_in = ir_problem(xx, y_in, epsilon_in);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%xlimits = [0 10];
xlimits = [0 3];
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pcolor = [0.7 0.9 0.7]
%pcolor = 2*Pantone
[px,py]= ir_plotmodelset_c(irp_Simple_ex, xlimits, pcolor)
 h1 =  patch(px,py,pcolor);
##   plot(px,py(:,1),"m-","LineWidth",1, "color", 0.5*pcolor);
##   plot(x,yp(:,2),"m-","LineWidth",1, "color", 0.5*pcolor);
%
pcolor = [0.9 0.7 0.7]
%pcolor = RoyalMail
[px,py]= ir_plotmodelset_c(irp_Simple_in, xlimits, pcolor)
 h2 =  patch(px,py,pcolor);

h4 = errorbar(xx(:,1), y_ex, epsilon_ex,'.g');
pcolor = [0.7 0.9 0.7]
set(h4, 'color', 0.5*pcolor )
set(h4, 'linewidth', 1)
%h5 = errorbar(xx(:,1), y_in, epsilon_in,'.b');
h5 = errorbar(xx(:,1), y_in, epsilon_in,'.r');
pcolor = [0.9 0.35 0.35]
set(h5, 'color', pcolor)
set(h5, 'linewidth', 1)


lgd123 = legend([h1 h2 h4 ], ...
  {'external', 'internal', 'twin data'})
set(lgd123, 'location', 'north')
set(lgd123, 'fontsize', 14)

xticks([0:3])
grid on
set(gca, 'fontsize', 14)
xlabel('\it x')
ylabel('\it y')
titlestr = strcat('Set of models compatible with data and constraints', ' SimpleTwinData')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
