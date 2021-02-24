%% IR Lab 10

%% Task 1

alpha1 = input('alpha1: ');
alpha2 = input('alpha2: ');

theeta1 = input('theeta1: ');
theeta2 = input('theeta2: ');

x0 = 0;
y0 = 0;

x1 = alpha1*cosd(theeta1);
y1 = alpha1*sind(theeta1);

x2 = alpha1*cosd(theeta1) + alpha2*cosd(theeta1 + theeta2);
y2 = alpha1*sind(theeta1) + alpha2*sind(theeta1 + theeta2);

figure, plot([x0,x1],[y0,y1],[x1,x2],[y1,y2]);

%% Task 2

alpha1 = 2;
alpha2 = 3;
theeta1 = 10;
theeta2 = 10;
figure;
hold on;

for n = 1:9
    
    x0 = 0;
    y0 = 0;

    x1 = alpha1*cosd(theeta1);
    y1 = alpha1*sind(theeta1);

    x2 = alpha1*cosd(theeta1) + alpha2*cosd(theeta1 + theeta2);
    y2 = alpha1*sind(theeta1) + alpha2*sind(theeta1 + theeta2);

    plot([x0,x1],[y0,y1],[x1,x2],[y1,y2]);
    
    theeta1 = theeta1 + 10;
    theeta2 = theeta2 + 10;

end

%% Task 3

d1 = 3;
d2 = 4;
d3 = 7;

th1 = 10;

figure;

for j = 1:9
    
a = [0 0 0];
al = [0 -90 0];
d = [d1 d2 d3];
th = [th1 0 0];

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
hold on;

d1 = d1 + 2;
d2 = d2 + 2;
d3 = d3 + 2;

th1 = th1 + 10;

end

%% Credits

% 
%  Made by:
%  Muhammad Abdlah
%  (2015-EE-166)
%