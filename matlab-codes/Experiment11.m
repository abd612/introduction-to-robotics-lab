%% IR Lab #11

%% Task 1

al1 = input('al1: ');
al2 = input('al2: ');

x = input('x: ');
y = input('y: ');

D = (x^2 + y^2 - al1^2 -al2^2)/(2*al1*al2);

th2 = acosd(D);
th1 = atan2d(y,x) - atan2d((al2*sind(th2)),(al1+al2*cosd(th2)));

x0 = 0;
y0 = 0;

x1 = al1*cosd(th1);
y1 = al1*sind(th1);

x2 = al1*cosd(th1) + al2*cosd(th1 + th2);
y2 = al1*sind(th1) + al2*sind(th1 + th2);

figure, plot([x0,x1],[y0,y1],[x1,x2],[y1,y2]);

%% Task 2

xc = input('x: ');
yc = input('y: ');
zc = input('z: ');

d1 = input('d1: ');
d2 = input('d2: ');

th1 = atan2(yc,xc).*180/pi;
r = sqrt(xc.^2+yc.^2);          
s = zc - 5;
th2 = 90-(atan2(abs(s),abs(r)).*180/pi);
d3 = sqrt(r.^2+s.^2)-5;

a = [0 0 0];
al = [-90 90 0];
d = [d1 0 d2+d3];
th = [th1 th2 0];

A = zeros(4,4,3);

for i = 1:3
    A(:,:,i) = [cosd(th(i)) -sind(th(i))*cosd(al(i)) sind(th(i))*sind(al(i)) a(i)*cosd(th(i));
    sind(th(i)) cosd(th(i))*cosd(al(i)) -cosd(th(i))*sind(al(i)) a(i)*sind(th(i));
    0 sind(al(i)) cosd(al(i)) d(i); 0 0 0 1];
end

H = A(:,:,1)*A(:,:,2)*A(:,:,3);

x0 = 0;
y0 = 0;
z0 = 0;

B = A(:,:,1);
x1 = B(1,4);
y1 = B(2,4);
z1 = B(3,4);

C = A(:,:,1)*A(:,:,2);
x2 = C(1,4);
y2 = C(2,4);
z2 = C(3,4);

D = A(:,:,1)*A(:,:,2)*A(:,:,3);
x3 = D(1,4);
y3 = D(2,4);
z3 = D(3,4);

plot3([x0,x1],[y0,y1],[z0,z1],[x1,x2],[y1,y2],[z1,z2],[x2,x3],[y2,y3],[z2,z3]);
grid on;

%% Credits

% 
%  Made by:
%  Muhammad Abdlah
%  (2015-EE-166)
%