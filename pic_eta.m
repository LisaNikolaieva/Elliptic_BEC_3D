figure;
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$\epsilon$','FontSize',45,'Interpreter','latex');
ylabel('$\eta$','FontSize',45,'Interpreter','latex');

load('eps_etaxy_g=0.mat','eps', 'etaxy')
p2=plot(eps,etaxy,'.-'); p2.LineWidth=3; p2.MarkerSize=30; p2.Color='black';
load('eps_etaxy_g.mat','eps', 'etaxy')
p2=plot(eps,etaxy,'d-'); p2.LineWidth=3; p2.MarkerSize=30; p2.Color = 'magenta';