function [x0,y0] = find_r0(x,y,a,b)



F = @(x,y,a,b,t) (x.*a./(a.^2+t)).^2 +(y.*b./(b.^2+t)).^2 - 1;

fun = @(t) F(x,y,a,b,t);

t0 = fzero(fun,-0.9*(b^2));


t = linspace(-b^2, 3*a, 1000);
f = F(x,y,a,b,t);
% figure;
% hold on
% p1 = plot(t,f); p1.LineWidth = 3;
% % ylim([-2 2])
% p2 = plot(t0,0,'.'); p2.MarkerSize = 30; 
% xlim([t0-5, t0+5]);

% x0 = (a.^2).*x./(t0+a.^2);
% y0 = (b.^2).*y./(t0+b.^2);

x0 = (a.^2).*x./(t0+a.^2);
y0 = (b.^2).*y./(t0+b.^2);


end