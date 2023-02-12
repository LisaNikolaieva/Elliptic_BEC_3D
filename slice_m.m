Config;
cd(ProjectDir)
load('a=50\Psi\g\Psi_e=0.995.mat')

figure;
s1=subplot(1,2,1)
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$z, \mu m$','FontSize',45,'Interpreter','latex');
ylabel('$x, \mu m$','FontSize',45,'Interpreter','latex');
ss=surf(rz*r_mult_microm,rx*r_mult_microm,squeeze(abs(Psi_mult*Psi(Ny/2,:,:)).^2)); ss.EdgeColor='none'; daspect([1 1 1]); view(2)
cb=colorbar;
cb.TickLabelInterpreter='latex';
    cb.Location='eastoutside';
    cb.Label.String='$\rho$, $1/$m$^3$';
    cb.Label.Interpreter='latex';
    cb.Label.FontSize=16;
    cb.Label.Position=[1 -3.1 0];
    cb.Label.Rotation=0;
% caxis([0 24.9*1e12])
    xlim([-Lz/2*r_mult_microm,Lz/2*r_mult_microm]);
    ylim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);

s2 = subplot(1,2,2) 
hold on
ax1 = gca;
ax1.FontSize=24;
ax1.LabelFontSizeMultiplier = 1.5;
ax1.TickLabelInterpreter='latex';
ax1.Box='on';
xlabel('$z, \mu m$','FontSize',45,'Interpreter','latex');
ylabel('$y, \mu m$','FontSize',45,'Interpreter','latex');
ss=surf(rz*r_mult_microm,ry*r_mult_microm,squeeze(abs(Psi_mult*Psi(:,Nx/2,:)).^2)); ss.EdgeColor='none'; daspect([1 1 1]); view(2);
cb=colorbar;
cb.TickLabelInterpreter='latex';
    cb.Location='eastoutside';
    cb.Label.String='$\rho$, $1/$m$^3$';
    cb.Label.Interpreter='latex';
    cb.Label.FontSize=16;
    cb.Label.Position=[1 -3.1 0];
    cb.Label.Rotation=0;
% caxis([0 24.9*1e12])
    xlim([-Lz/2*r_mult_microm,Lz/2*r_mult_microm]);
    ylim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);