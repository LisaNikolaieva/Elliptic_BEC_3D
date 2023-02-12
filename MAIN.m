clear;
tic

Config;

[mu, Psi] = itp(ProjectDir,300);
% real_time_run;
    
toc
cd(ProjectDir);
% save (['a=50/Psi/g=0/Psi_e=',num2str(e),'.mat'],'Psi');