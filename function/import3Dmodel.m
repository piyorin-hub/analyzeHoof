function ptCloud = import3Dmodel(filename, showPt)
    if nargin < 2
        showPt = false;
    end
    if contains(filename, '.stl')
        mesh = stlread(filename);
        scale = 1;
        pt = (mesh.Points).*scale;
        ptCloud = pointCloud(pt);
    elseif contains(filename, '.ply')
        ptCloud = pcread(filename);
    else
        disp('Not Found');
    end

    if showPt
        pcshowWithAxes(ptCloud);
    end

end
