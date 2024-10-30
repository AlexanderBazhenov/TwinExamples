% 2024-10-30
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
% 2024-10-11
% External - Green
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_ex_left,b_ex_rigth)
 pcolor = [0.7 0.9 0.7]
 p1 =  fill(P1(:,1),P1(:,2), pcolor)
  p4 =  fill(P4(:,1),P4(:,2), pcolor)
%  Easy = method 1 - RED
 [V,P1,P2,P3,P4]=EqnTol2D(xx,xx,b_in_left,b_in_rigth)
 pcolor = [0.9 0.7 0.7]
 p2 = fill(P1(:,1),P1(:,2),pcolor)
   p4 =  fill(P4(:,1),P4(:,2), pcolor)
 %
 lgd12 = legend( [p1 p2 ],   {'external', 'inner'})
set(lgd12, 'location', 'northeast')
set(lgd12, 'fontsize', 14)
%
grid on
set(gca, 'fontsize', 14)
xlabel('\it \beta_0')
ylabel('\it \beta_1')
titlestr=strcat('Information sets', ' - SimpleTwinData')
%title(titlestr)
figure_name_out=strcat(titlestr, '.png')
print('-dpng', '-r300', figure_name_out), pwd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
