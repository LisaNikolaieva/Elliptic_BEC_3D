Config;
cd(ProjectDir)
e = 0.9;
load(['a=50/Psi/g=0/Psi_e=',num2str(e),'.mat'])
figure;
    ax = gca;
    ax.FontSize=16;
    ax.LabelFontSizeMultiplier = 1.5;
    ax.TickLabelInterpreter='latex'; 
    ax.TickLabelInterpreter='latex'; 
    ax.XMinorTick = 'on';
    ax.YMinorTick = 'on';
    ax.Box='on';
    hold on
    
    ss=surf(r_mult_microm*rx,r_mult_microm*ry,abs(Psi_mult_cm3*Psi(:,:,Nz/2)).^2);
    view(2);


    ss.EdgeColor='none';
    cb=colorbar;
    cb.TickLabelInterpreter='latex';
    daspect([1 1 1])
    xlim([-Lx/2*r_mult_microm,Lx/2*r_mult_microm]);
    ylim([-Ly/2*r_mult_microm,Ly/2*r_mult_microm]);
    xlabel('x, $\mu m$','FontSize',16,'Interpreter','latex');
    ylabel('y, $\mu m$','FontSize',16,'Interpreter','latex');
caxis([0 25*1e12])