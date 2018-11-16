% 2018/5/18
% Jungwon Kang


clc;
clear all;
close all;


%%%% point (USER SETTING)
p1 = [1; 1; 1];    % x; y; 1
p2 = [2; 1; 1];
p3 = [1; 2; 1];
p4 = [2; 2; 1];


%%%% params (USER SETTING)
sx = 1.0;
sy = 1.0;
theta = pi/4;
hx = 0.0;
hy = 0.0;
tx = 0.0;
ty = 0.0;


%%%% get center point of the given points (USER SETTING if you want)
min_x = min([p1(1), p2(1), p3(1), p4(1)]);
max_x = max([p1(1), p2(1), p3(1), p4(1)]);
min_y = min([p1(2), p2(2), p3(2), p4(2)]);
max_y = max([p1(2), p2(2), p3(2), p4(2)]);

x_cen = (min_x + max_x)/2;
y_cen = (min_y + max_y)/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% DO NOT EDIT BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% get elementary transformation
mat_sc  = [sx, 0, 0; 0, sy, 0; 0, 0, 1];
mat_sh  = [1, hx, 0; hy, 1, 0; 0, 0, 1];
mat_ro  = [cos(theta), -sin(theta), 0; sin(theta), cos(theta), 0; 0, 0, 1];
mat_cen = [1, 0, x_cen; 0, 1, y_cen; 0, 0, 1];
mat_tr  = [1, 0, tx; 0, 1, ty; 0, 0, 1];

%%%% 
inv_mat_cen = inv(mat_cen);
mat_ro_ = (mat_cen*mat_ro*inv_mat_cen);
mat_sh_ = (mat_cen*mat_sh*inv_mat_cen);
mat_sc_ = (mat_cen*mat_sc*inv_mat_cen);

%%%% get composite transformation
mat_a = mat_tr*mat_ro_*mat_sh_*mat_sc_;


%%%% transform
p1_res = mat_a*p1;
p2_res = mat_a*p2;
p3_res = mat_a*p3;
p4_res = mat_a*p4;

p1_res = p1_res./p1_res(3);
p2_res = p2_res./p2_res(3);
p3_res = p3_res./p3_res(3);
p4_res = p4_res./p4_res(3);

if true,
    p1_res
    p2_res
    p3_res
    p4_res
end


%%%% show
temp_min_x = min([p1(1), p2(1), p3(1), p4(1), p1_res(1), p2_res(1), p3_res(1), p4_res(1)]);
temp_max_x = max([p1(1), p2(1), p3(1), p4(1), p1_res(1), p2_res(1), p3_res(1), p4_res(1)]);
temp_min_y = min([p1(2), p2(2), p3(2), p4(2), p1_res(2), p2_res(2), p3_res(2), p4_res(2)]);
temp_max_y = max([p1(2), p2(2), p3(2), p4(2), p1_res(2), p2_res(2), p3_res(2), p4_res(2)]);
    
figure(1),
    hold on;
    axis equal;
    axis([temp_min_x, temp_max_x, temp_min_y, temp_max_y]);
    plot(p1(1), p1(2), 'b.');   text(p1(1), p1(2), '1');
    plot(p2(1), p2(2), 'b.');   text(p2(1), p2(2), '2');
    plot(p3(1), p3(2), 'b.');   text(p3(1), p3(2), '3');
    plot(p4(1), p4(2), 'b.');   text(p4(1), p4(2), '4');
    title('before transformation');
        
figure(2),
    hold on;
    axis equal;
    axis([temp_min_x, temp_max_x, temp_min_y, temp_max_y]);
    plot(p1_res(1), p1_res(2), 'r.');   text(p1_res(1), p1_res(2), '1');
    plot(p2_res(1), p2_res(2), 'r.');   text(p2_res(1), p2_res(2), '2');
    plot(p3_res(1), p3_res(2), 'r.');   text(p3_res(1), p3_res(2), '3');
    plot(p4_res(1), p4_res(2), 'r.');   text(p4_res(1), p4_res(2), '4');
    title('after transformation');



