Config;
cd(ProjectDir);
i=0;
for e=[0.93, 0.95, 0.96, 0.97, 0.98, 0.99, 0.995]
   i=i+1;
   load(['a=50/Psi/g=0/Psi_e=',num2str(e),'.mat'])    
   na0(i)=max(abs(Psi(Ny/2,:,Nz/2)).^2);
   nb0(i)=max(abs(Psi(:,Nx/2,Nz/2)).^2);
   
%    load(['g/Psi_e=',num2str(e),'.mat'])    
%    na(i)=max(abs(Psi(Ny/2,:,Nz/2)).^2);
%    nb(i)=max(abs(Psi(:,Nx/2,Nz/2)).^2);
end

figure;
eta0=(na0-nb0)./(na0+nb0);
% eta=(na-nb)./(na+nb);

hold on
ax1 = gca;
ax1.FontSize=16;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
xlabel('$\epsilon$','FontSize',24,'Interpreter','latex');

ylabel('$\eta$','FontSize',24,'Interpreter','latex');
p2=plot([0.93, 0.95, 0.96, 0.97, 0.98, 0.99, 0.995],eta0,'.-'); p2.LineWidth=3; p2.MarkerSize=20; %p2.Color = col;
% p2=plot([0.93, 0.95, 0.96, 0.97, 0.98, 0.99, 0.995],eta,'.-'); p2.LineWidth=3; p2.MarkerSize=20; %p2.Color = col;


% legend('$g=0$','$g!=0$','FontSize',24,'Interpreter','latex');
