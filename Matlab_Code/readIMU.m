function [R0 R1 R2 R3 R4] = readIMU(out)

    fprintf(out.s,'R');
    
    %read values from IMUs
    for i = 1:20
        readings(i)= fscanf(out.s,'%u');
    end
    
    for i = 0:3
        n = readings(i * 5 + 1);
        w = readings(i * 5 + 2);
        x = readings(i * 5 + 3);
        y = readings(i * 5 + 4);
        z = readings(i * 5 + 5);
        R = [1.0-2.0*(y * y + z * z),...
        2*(x * y - w * z),...
        2*(x * z + w * y);...
        2*(x * y + w * z),...
        1-2*(x * x + z * z),...
        2*(y * z - w * x);...
        2*(x * z - w * y),...
        2*(w * x + y * z),...
        1-2*(x * x + y * y);];
        if(n == 0)
            R0 = R;
        end
        if(n == 1)
            R1 = R;
        end
        if(n == 2)
            R2 = R;
        end
        if(n == 3)
            R3 = R;
        end
        if(n == 4)
            R4 = R;
        end
        display(R0);
        display(R1);
        display(R2);
        display(R3);
        display(R4);
    end