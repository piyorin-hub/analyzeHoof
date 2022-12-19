function ptCloud = import3Dmodel(filename, showPt)
    if nargin < 2
        showPt = false;
    end
    if contains(filename, '.stl')
        mesh = stlread(filename);
        scale = 1000;
        pt = (mesh.Points).*scale;
        ptCloud = pointCloud(pt);
    elseif contains(filename, '.ply')
        pt = pcread(filename);
        ptData = pt.Location * 1000;
        ptCloud = pointCloud(ptData);
    else
        disp('Not Found');
    end

    if showPt
        pcshowWithAxes(ptCloud);
    end

end
