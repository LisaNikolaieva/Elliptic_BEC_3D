Config;
cd(ProjectDir);
figure;


i=0;
for e = [0.99]
    i=i+1;
load(['a=100/Psi/g=0/Psi_e=',num2str(e),'.mat'])    
hold on
ax1 = gca;
ax1.FontSize=16;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';


switch e
    case 0.99
        col = 'blue';
    case 0.95
        col = 'black';
    case 0.9
        col = 'magenta';
end        
        
p1=plot(rx*l_r*1e6,abs(Psi(Ny/2,:,Nz/2)).^2,'.-'); p1.LineWidth=3; p1.MarkerSize=20; p1.Color = col;
% p2=plot(ry*l_r*1e6,abs(Psi(:,Nx/2,Nz/2)).^2); p2.LineWidth=4; p2.Color = col;



xlabel('r, $\mu m$','FontSize',24,'Interpreter','latex');
% legend('$\rho_x$', '$\rho_y$','FontSize',24,'Interpreter','latex');
% legend('$\epsilon =0.99$','$\epsilon =0.95$','$\epsilon =0.9$','FontSize',24,'Interpreter','latex');

na(i)=max(abs(Psi(Ny/2,:,Nz/2)).^2);
end


i=0;
for e = [0.99 ]
    i=i+1;
load(['a=100/Psi/g=0/Psi_e=',num2str(e),'.mat'])    
hold on
ax1 = gca;
ax1.FontSize=16;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';


switch e
    case 0.99
        col = 'blue';
    case 0.95
        col = 'black';
    case 0.9
        col = 'magenta';
end        
        
% p1=plot(rx*l_r*1e6,abs(Psi(Ny/2,:,Nz/2)).^2); p1.LineWidth=4; p1.Color = col;
p2=plot(ry*l_r*1e6,abs(Psi(:,Nx/2,Nz/2)).^2,'.-'); p2.LineWidth=3; p2.MarkerSize=20; p2.Color = col;



xlabel('r, $\mu m$','FontSize',24,'Interpreter','latex');
legend('$\rho_x$', '$\rho_y$','FontSize',24,'Interpreter','latex');
% legend('$\epsilon =0.99$','$\epsilon =0.95$','$\epsilon =0.9$','FontSize',24,'Interpreter','latex');
nb(i)=max(abs(Psi(:,Nx/2,Nz/2)).^2);
end

ylim([0 20])

% figure;
% eta=(na-nb)./(na+nb);
% hold on
% ax1 = gca;
% ax1.FontSize=16;
% ax1.LabelFontSizeMultiplier = 1.5;
% ax1.TickLabelInterpreter='latex';
% xlabel('$\epsilon$','FontSize',24,'Interpreter','latex');
% 
% ylabel('$\eta$','FontSize',24,'Interpreter','latex');
% p2=plot([0.99 0.95 0.9],eta,'.-'); p2.LineWidth=3; p2.MarkerSize=20; p2.Color = col;
