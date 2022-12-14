function pcshowWithAxes(ptCloud, name)
    
    if nargin < 2
        figure;
    else
        figure("Name",name);
    end
    grid on;
    pcshow(ptCloud, AxesVisibility="on");
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end

