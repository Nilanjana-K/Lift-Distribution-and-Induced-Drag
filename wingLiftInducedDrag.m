% Basic Aircraft Parameters
b = 1.0;
S = 0.18;
AR = b^2/S;
e = 0.8;
rho = 1.225 ;
W = 0.9*9.81;
CL_total = 0.8;

% Determining the velocity
v = sqrt(2*W/(rho*S*CL_total));

% Splitting the entire wingspan to discrete points
n = 1000;
y = linspace(-b/2,b/2,n);
theta = acos(2*abs(y)/b);

% Elliptical lift distribution

% Determining the elliptical shape
shape = sqrt(1 - (2*y/b).^2);

% Scaling the circulation
Gamma0 = (4*W)/(pi*rho*v*b);

% Spanwise circulation distribution
Gamma_y = Gamma0 * shape;

% Lift per unit span:
L_prime = rho * v.* Gamma_y;

% Induced Drag Estimation
CDi = CL_total^2/(pi*AR*e);
Di = 0.5*rho*v^2*S*CDi;

% Estimation of downwash
w = Gamma0/(2*b);

% Plot : Circulation Distribution
figure
plot(y, Gamma_y, 'b', 'LineWidth', 2)

xlabel('Spanwise Position y (m)')
ylabel('Circulation \Gamma(y) (m^2/s)')
title('Elliptical Circulation Distribution')
grid on

% Plot: Lift Distribution 
figure
plot(y, L_prime, 'r', 'LineWidth', 2)

xlabel('Spanwise Position y (m)')
ylabel('Lift per Unit Span L''(y) (N/m)')
title('Spanwise Lift Distribution')
grid on

% Outputs 
fprintf('Aspect Ratio              = %.2f\n', AR);
fprintf('Cruise Velocity           = %.2f m/s\n', v);
fprintf('Induced Drag Coefficient  = %.4f\n', CDi);
fprintf('Total Induced Drag        = %.3f N\n', Di);
fprintf('Estimated Downwash        = %.3f m/s\n', w);
