%% Config parameters

ProjectDir = pwd;

L = 250/2;    Lx=L; Ly=L/2; Lz=L/16;
N = 512;    
Nx=N; Ny=N/2; Nz=N/16;


% e=0.995; %[0.94, 0.955, 0.965, 0.975, 0.984, 0.987, 0.992, 0.994]
g_mult = 1;


s0 = 0;
gamma = 0.03;
NN0 = 1e4;
a_ph=0.5*100*1e-6;
l_r=0.2*5*1e-6;                     % m
l_z=l_r;


t_init_ph = 0;      % s
t_fin_ph = 1;       % s

NonLinPart = @(V,g,Psi) V+g*(abs(Psi)).^2;


if ~exist([ProjectDir,'/DATA/Pictures/'], 'dir')
    mkdir([ProjectDir,'/DATA/Pictures/'])
end


%% Default parameters
ModelDir = 'C:\BM\GPE\3D\Model';
cd(ModelDir) 


Physical_parameters;
grid3D;


omega_r = hbar/(mass*l_r^2);      % Hz
omega_z = hbar/(mass*l_z^2);      % Hz
kappa=omega_z/omega_r;

dim3D;

itp_config;
ssfm_config;

integrals;



a=a_ph/r_mult;
% V = potential('elliptic',X,Y,Z,kappa,a,e);

%%
cd(ProjectDir)
b=sqrt(1-e^2)*a;

calculated = 1
if calculated
    load(['a=50/V_e=',num2str(e),'.mat'],'V');
    cd(ModelDir)
% else
%     X0 = zeros(Ny/2,Nx/2,Nz);
%     Y0 = zeros(Ny/2,Nx/2,Nz).*0;
% 
%     for i = 1:Nx/2
%         i
% 
%         for j = 1:Ny/2
%             x = rx(Nx/2+i);
%             y = ry(Ny/2+j);
%             [x0, y0] = find_r0(x,y,a,b);
%             X0(j,i,:) = x0;
%             Y0(j,i,:) = y0;
% 
%         end
%     end
% 
% 
%     X1 = [-X0(:,end:-1:1,:), X0];
%     X2 = [X1(end:-1:1,:,:); X1];
% 
%     Y1 = [-Y0(end:-1:1,end:-1:1,:), -Y0(end:-1:1,:,:)];
%     Y2 = [Y1; -Y1(end:-1:1,:,:)];
% 
% 
%     X0=X2;
%     Y0=Y2;
% 
%     R2 = (X-X0).^2+(Y-Y0).^2;
%     V=0.5*(R2+kappa*Z.^2);

end


