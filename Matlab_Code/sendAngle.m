function sendAngle(out,joint_angles,leg_id)
%     in the order of fr -> fl -> rr -> rl
%     # <ch> P <pw> S  < spd> T  <time> <cr>
%     ? <ch>: pin / channel to which the servo is connected (0 to 31) in decimal
%     ? <pw>: desired pulse width (normally 500 to 2500) in microseconds
%     ? <spd>: servomovementspeedinmicrosecondspersecond*
%     ? <time>: time in microseconds to travel from the current position to the desired position.
%     This affects all servos (65535 max) *
%     ? <cr>: carriage return (ASCII 13)**
%     Example 1: #2P1500S750<cr>
%     This would have the servo connected to pin #2 of the SSC­32U move to position 1500 
%     (0 degrees / centered) at a rate of 750uS per second*. Numeric arguments to all SSC­32 
%     commands must be ASCII strings of decimal numbers, e.g. "1234". Some commands 
%     accept negative numbers, e.g. "­5678". ASCII format is not case sensitive. 
%     Use as many bytes as required. Spaces, tabs, and line feeds are ignored.
    n = [8, 24, 0, 16];
    i = 0;
    angle = round(joint_angles(i + 1)*2000/pi + 1500);
    servo_num = n(leg_id) + i;
    s = ['#',num2str(servo_num),'P',num2str(angle),'S750<cr>']
    fprintf(out.s,s);
    i = 1;
    if leg_id == 1 || leg_id == 4
        angle = round(joint_angles(i + 1)*2000/pi + 1500);
    end
    if leg_id == 2 || leg_id == 3
        angle = round(-joint_angles(i + 1)*2000/pi + 1500);
    end
    % FR & RL are opposite to FL & RR. For example, 1600 of FR/RL map
    % equals to 1400 of FL/RR map.
    servo_num = n(leg_id) + i;
    s = ['#',num2str(servo_num),'P',num2str(angle),'S750<cr>']
    fprintf(out.s,s);
    i = 2;
    if leg_id == 1 || leg_id == 4
        angle = round(-joint_angles(i + 1)*2000/pi + 1500);
    end
    if leg_id == 2 || leg_id == 3
        angle = round(joint_angles(i + 1)*2000/pi + 1500);
    end
    % FR & RL are opposite to FL & RR. For example, 1600 of FR/RL map
    % equals to 1400 of FL/RR map.
    servo_num = n(leg_id) + i;
    s = ['#',num2str(servo_num),'P',num2str(angle),'S750<cr>']
    fprintf(out.s,s);
end