function fixedPoint = fixHoofTipDirection(ptCloud, axes, tipWidth, kmeanNum)
    if nargin < 3
        tipWidth = 35;
        kmeanNum = 2;
    end

    switch axes
        case 'x'
            tip = ptCloud.XLimits(2);
            axIdx = 1;
            make2d = [2 3];
        case 'y'
            tip = ptCloud.YLimits(2);
            axIdx = 2;
            make2d = [1 3];
        case 'z'
            tip = ptCloud.Zlimits(2);
            axIdx = 3;
            make2d = [1 2];
    end
    % 先端部分の切り取り
    sp = ptCloud.Location;
    HoofTip = sp(sp(:,axIdx) < tip & (tip-tipWidth) < sp(:,axIdx), :);
    % 重心の位置計算
    center = mean(HoofTip);
    [~, C] = kmeans(HoofTip, kmeanNum);

    projCenter = center(:,make2d);
    projTips = HoofTip(:,make2d);
    proKmean = C(:,make2d);
    % 極座標化
    [thetaSorted, rhoSorted] = sortPointOnPolar(projTips);
    [centTheta, centRho] = sortPointOnPolar(projCenter);
    [Ktheta, KRho] = sortPointOnPolar(proKmean);
    
    newTheta = -pi/2;
    diffTheta = -(newTheta-centTheta);
    rotatedTip = rotatePoint(pointCloud(HoofTip), diffTheta, axes);
    rotTipCenter = mean(rotatedTip.Location);
    [Rotidx, Crot] = kmeans(rotatedTip.Location, kmeanNum);
   
    fixedPoint = rotatePoint(ptCloud, diffTheta, axes);
    figure("Name","fix Hoof Tip Direction");
    hold on;grid on;
    pcshow(rotTipCenter, 'r', "MarkerSize", 300);
    pcshow(Crot, 'm', "MarkerSize", 300);
    pcshow(fixedPoint, 'AxesVisibility','on');
    xlabel('X');ylabel('Y');zlabel('Z');
    hold off;
end
