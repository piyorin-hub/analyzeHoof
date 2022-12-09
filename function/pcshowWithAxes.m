function pcshowWithAxes(ptCloud, name)
    
    if nargin < 2
        figure;
    else
        figure("Name",name);
    end
    pcshow(ptCloud, AxesVisibility="on");
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end

