% Basic Aircraft Parameters
b = 1.0;
S = 0.18;
AR = b^2/S;
e = 0.8;
rho = 1.225 ;
W = 0.9*9.81;
CL_total = 0.8;

% Splitting the entire wingspan to discrete points
n = 100;
y = linspace(-b/2,b/2,n);
theta = acos(2*abs(y)/b);

% Elliptical lift distribution
CL_y = (CL_total*AR/(pi*e))*sqrt(1-(2*y/b).^2);

% Induced Drag Estimation
CDi = CL_total^2/(pi*AR*e);
Di = 0.5*rho*(2*W/(rho*S*CL_total))^2*S*CDi;

% Plotting
figure;
plot(y, CL_y, 'b-', 'LineWidth', 3);
xlabel('Spanwise position y (m)')
ylabel('Local Lift Coefficient C_{L,y}')
title('Elliptical Lift Distribution along the Wing')
grid on

fprintf('Total Induced Drag = %.3f N\n',Di)