%% IR Lab #14

%% Task 1

P_c = [2;
       3;
       4;
       1];

D_b = 5;
Theta = 30;

D_c = 3;
Beta = 45;

T_y = [1 0 0 0;
       0 1 0 D_b;
       0 0 1 0;
       0 0 0 1];

R_z = [cosd(Theta) -sind(Theta) 0 0;
       sind(Theta)  cosd(Theta) 0 0;
       0            0           1 0;
       0            0           0 1;];
   
H_ab = T_y*R_z;

P_b = H_ab*P_c;

T_x = [1 0 0 D_c;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];

R_x = [1 0           0          0;
       0 cosd(Beta) -sind(Beta) 0;
       0 sind(Beta)  cosd(Beta) 0;
       0 0           0          1;];
   
H_bc = T_x*R_x;

P_a = H_ab*H_bc*P_c;

figure, plot3([0 P_c(1)],[0 P_c(2)],[0 P_c(3)]), grid, title('Point wrt frame C');
figure, plot3([0 P_b(1)],[0 P_b(2)],[0 P_b(3)]), grid, title('Point wrt frame B');
figure, plot3([0 P_a(1)],[0 P_a(2)],[0 P_a(3)]), grid, title('Point wrt frame A');