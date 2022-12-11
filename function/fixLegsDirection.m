function newPoint = fixLegsDirection(ptCloud, cutAxes, cutWidth)
% 蹄がある方向が負の場合、正方向になるよう回転する。
    if nargin < 3
        cutWidth = 0.5;
    end
    originalData= CalculateCircum(ptCloud, cutAxes, cutWidth);
    x = originalData(:,1);
    area = originalData(:,3);
    
    [~, I] = max(area);
    rotAxes = 'z';
    if x(I) < 0
        newPoint = rotatePoint(ptCloud, pi, rotAxes);
    end
end

