Config;
cd(ProjectDir);
i=0;
eps = [0.93, 0.94, 0.95, 0.955, 0.96, 0.965, 0.97, 0.975, 0.98, 0.984, 0.987, 0.99, 0.992, 0.994, 0.995];
rxdet = linspace(-Lx/2,Lx/2,100*Nx);
rydet = linspace(-Ly/2,Ly/2,100*Ny);
for e=drange(eps)
i=i+1;
load(['a=50/Psi/g=0/Psi_e=',num2str(e),'.mat'])    

na0(i)=max(abs(Psi(Ny/2,:,Nz/2)).^2);
nb0(i)=max(abs(Psi(:,Nx/2,Nz/2)).^2);

%%
rho_x = abs(Psi(Ny/2,:,Nz/2)).^2;
rho_y = abs(Psi(:,Nx/2,Nz/2)).^2;

mx = max(rho_x)
my = max(rho_y);

indx = find(rho_x==mx)
indy = find(rho_y==my)

x3 = [rx(indx-1), rx(indx), rx(indx+1)]
y3 = [ry(indy-1), ry(indy), ry(indy+1)]

rho_x3 = [rho_x(indx-1), rho_x(indx), rho_x(indx+1)]
rho_y3 = [rho_y(indy-1), rho_y(indy), rho_y(indy+1)]


%%
px = polyfit(x3,rho_x3,2);
% fx1 = polyval(px,rxdet);
% nx(i) = max(fx1);
px0 = -px(2)/(2*px(1));
nx(i) = px(1)*px0^2+px(2)*px0+px(3);


py = polyfit(y3,rho_y3,2);
% fy1 = polyval(py,rydet);
% ny(i) = max(fy1);
py0 = -py(2)/(2*py(1));
ny(i) = py(1)*py0^2+py(2)*py0+py(3);

% figure
% plot(x3,rho_x3,'o')
% hold on
% plot(rx,rho_x)
% plot(rx,f1,'k--')
% 
% ylim([-1 inf])

end


figure;
eta0=(na0-nb0)./(na0+nb0);
etaxy=(nx-ny)./(nx+ny);


hold on
ax1 = gca;
ax1.FontSize=16;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
xlabel('$\epsilon$','FontSize',24,'Interpreter','latex');

ylabel('$\eta$','FontSize',24,'Interpreter','latex');
p2=plot(eps,eta0,'.-'); p2.LineWidth=3; p2.MarkerSize=20; %p2.Color = col;
p2=plot(eps,etaxy,'.-'); p2.LineWidth=3; p2.MarkerSize=20; %p2.Color = col;


