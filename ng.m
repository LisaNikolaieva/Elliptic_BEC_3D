e=0.995;
Config;
cd(ProjectDir);
load(['C:\BM\NRFU\Elliptic_BEC\5\a=50\Psi\g\Psi_e=',num2str(e),'.mat'])
% pr=1./(abs(Psi)).*ifftn(0.5*kk.*fftn(abs(Psi)));
pr=-1./(abs(Psi)).*(del2(abs(Psi),hx,hy,hz));
figure;
hold on;
ax1 = gca;
ax1.FontSize=16;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
daspect([1 1 1])
view(2);
% caxis([0 3])
cb1=colorbar;
    cb1.Location='eastoutside';
%     cb1.Label.String='$\rho$, $1/$cm$^3$';
    cb1.Label.Interpreter='latex';
    cb1.Label.FontSize=16;
    cb1.Label.Position=[1 -3.1 0];
    cb1.Label.Rotation=0;
    cb1.TickLabelInterpreter='latex';
    cb1.FontSize=16;
    pres=pr.*((abs(Psi))>(0.0001*(max(max(max(abs(Psi)))))));
% ss=surf(r_mult_microm*rx,r_mult_microm*ry,pres(:,:,Nz/2));
ss=surf(r_mult_microm*rx,r_mult_microm*ry,g*abs(Psi(:,:,Nz/2)).^2);

ss.EdgeColor='none';
xlabel('$x, \mu m$','FontSize',24,'Interpreter','latex');
ylabel('$y, \mu m$','FontSize',24,'Interpreter','latex');
xlim([-Lx/2,Lx/2]);
ylim([-Ly/2,Ly/2]);


hold on
% 
phi=linspace(0,2*pi,100*256);

Rh = b./sqrt(1-e^2*cos(phi).^2);
x0 = Rh.*cos(phi);
y0 = Rh.*sin(phi);

scatter3(x0,y0,10*x0,'.k');
scatter3(x0,y0,-10*x0,'.k');