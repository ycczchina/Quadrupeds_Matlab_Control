% ================================================================
% ===================IMU Arduino to matlab code===================
% ================================================================

%% 1.Specifies the COM port that the Arduino board is connected to
clear all;close all;clc;
comPort = '/dev/cu.usbserial-A4VBKT8O';   %choose the arduino COM port

%% 2.Initialize the Serial Port - setupSerial()

if(~exist('serialFlag','var'))
    [bot.s,serialFlag] = setupSerial(comPort);
end

stop = false;
%% 3.Send latest position
%angle = leg_IK_reverse_order(p_goal, leg_id);
%sendAngle(bot,angle,leg_id)
%% Close Serial Port
%fclose(bot.s)