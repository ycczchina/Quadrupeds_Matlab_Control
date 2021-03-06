close all;clear all;
% set desired robot pose
joints_angles = zeros(4, 3);%ones(4, 3)*pi/3;
base_position = ones(3, 1);
base_rotation = eye(3);

% calculate desired feet positions
[abs_pos(1, :), ~, ~, ~] = Quad_LegFK(base_position, base_rotation, joints_angles(1, :), 1);
[abs_pos(2, :), ~, ~, ~] = Quad_LegFK(base_position, base_rotation, joints_angles(1, :), 2);
[abs_pos(3, :), ~, ~, ~] = Quad_LegFK(base_position, base_rotation, joints_angles(1, :), 3);
[abs_pos(4, :), ~, ~, ~] = Quad_LegFK(base_position, base_rotation, joints_angles(1, :), 4);

% calculate joints angles regarding to desired pose
[base_position_1, base_rotation_1, joints_angles_1, err_val, exitflag]=Quad_IK(base_position, base_rotation, abs_pos', true);

% draw robot to verify results
Quad_Draw(base_position_1, base_rotation_1, joints_angles_1);
Quad_Draw(base_position, base_rotation, joints_angles);