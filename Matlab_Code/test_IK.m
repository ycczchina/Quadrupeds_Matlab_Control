% clear all;close all;
% set desired robot pose
base_position = zeros(3,1)+[0;-0.02;0]; 

base_rotation = eye(3);
% joint_angles = zeros(4,3)
joint_angles =   1 / 48 * ones(4,3) * pi;
% joint_angles = [-pi/6   -pi/4   -0.7854;
%                 -pi/6   -pi/4   -pi/4;
%                 -pi/5   -0.7854   -0.7854;
%                 -pi/7   -0.7854   -0.7854;]
figure(1)
Quad_Draw(base_position, base_rotation, joint_angles);
xlabel('x')
ylabel('y')
zlabel('z')
hold off
title('Forward Kinematics')
% calculate desired feet positions
abs_pos_des = [Quad_LegFK(base_position, base_rotation, joint_angles(1, :), 1)'; ...
    Quad_LegFK(base_position, base_rotation, joint_angles(2, :), 2)';...
    Quad_LegFK(base_position, base_rotation,joint_angles(3, :), 3)';...
    Quad_LegFK(base_position, base_rotation, joint_angles(4, :), 4)']';
display(abs_pos_des)
% calculate joints angles regarding to desired pose
base_movable = false;
% base_movable = true;
height = zeros(3,4);
height(3,:)=ones(1,4)
abs_pos_des = [0.12,0.14,0.02; -0.155,0.115,0.02; 0.12,-0.14,0.015; -0.1,-0.14,0.01]' - height * 0.15;
% abs_pos_des =[    0.1019   -0.0477    0.1019   -0.0477;
%                         0.0959    0.0590   -0.0115   -0.0485;
%                        -0.1624   -0.1624   -0.1624   -0.1624];
[base_pos_des, base_rot_des, joint_ang_des] = Quad_IK(base_position, ...
    base_rotation, abs_pos_des, base_movable);
% display(joint_ang_des)
figure(2)
Quad_Draw(base_pos_des, base_rot_des, joint_ang_des);
xlabel('x')
ylabel('y')
zlabel('z')
hold off
title('Inverse Kinematics')
display(abs_pos_des)
for i = 1 : 4
    sendAngle(bot,joint_ang_des(i,:),i)
end