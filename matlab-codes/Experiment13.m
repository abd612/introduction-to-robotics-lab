%% IR Lab #13

%% Task 1

clear all;

n = 1;

x_p = zeros(51,1);
y_p = zeros(51,1);
z_p = zeros(51,1);

for t = 0:0.1:5

    x = cos(pi*t) + sin(2*pi*t);
    y = (sin(pi*t))^2 + 2*cos(pi*t);
    z = (cos(pi*t))^2 + sin(2*pi*t);
    x_p(n) = x;
    y_p(n) = y;
    z_p(n) = z;
    n = n + 1;
   
end

figure, plot3(x_p, y_p, z_p), grid on, title('Trajectory');

%% Task #2

clear all;

d = input('initial data = [q0,v0,q1,v1,t0,tf] =');
q0 = d(1); v0= d(2); q1 = d(3); v1 = d(4); t0=d(5); tf=d(6);

t = linspace(t0,tf,100*(tf-t0));
c = ones(size(t));
M = [ 1 t0 t0^2 t0^3;
0 1 2*t0 3*t0^2;
1 tf tf^2 tf^3;
0 1 2*tf 3*tf^2];
b = [q0; v0; q1; v1];
a = M\b;

qd = a(1).*c + a(2).*t +a(3).*t.^2 + a(4).*t.^3;
figure, plot(qd), grid on, title('Position Trajectory');
vd = a(2).*c +2*a(3).*t +3*a(4).*t.^2;
figure, plot(vd), grid on, title('Velocity Trajectory');
ad = 2*a(3).*c + 6*a(4).*t;
figure, plot(ad), grid on, title('Acceleration Trajectory');

%% Task #3

% input[0,0,0,5,0,4,1,5] 

clear all;
d = input('initial data = [q0,v0,ac0,q1,v1,ac1,t0,tf] =')
q0 = d(1); v0= d(2); ac0 = d(3); q1 = d(4);v1 = d(5);ac1=d(6);t0=d(7); tf=d(8);
t = linspace(t0,tf,100*(tf-t0));
c = ones(size(t));

M = [ 1 t0 t0^2 t0^3 t0^4 t0^5;
0 1 2*t0 3*t0^2 4*t0^3 5*t0^4;
0 0 2 6*t0 12*t0^2 20*t0^3;
1 tf tf^2 tf^3 tf^4 tf^5;
0 1 2*tf 3*tf^2 4*tf^3 5*tf^4;
0 0 2 6*tf 12*tf^2 20*tf^3];

b=[q0; v0; ac0; q1; v1; ac1];
a = inv(M)*b;
qd = a(1).*c + a(2).*t +a(3).*t.^2 + a(4).*t.^3 +a(5).*t.^4 + a(6).*t.^5;
vd = a(2).*c +2*a(3).*t +3*a(4).*t.^2 +4*a(5).*t.^3 +5*a(6).*t.^4;
ad = 2*a(3).*c + 6*a(4).*t +12*a(5).*t.^2 +20*a(6).*t.^3;
figure, plot(t,qd), title('Accelration of Quintic');

%% Task #4