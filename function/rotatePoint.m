function RotatedPoint = rotatePoint(Point,theta, axes)
% 点群データの回転行列をかける　
% Point = pointCloud
% theta 回転角 
% axis 回転軸 

% trans 平行移動を設定できる
switch axes
        case 'x'
            Rot = [
                   1 0 0;
                   0 cos(theta) -sin(theta);
                   0 sin(theta) cos(theta);
                   ];
        case 'y'
            Rot = [
                    cos(theta) 0 sin(theta);
                    0 1 0;
                   -sin(theta) 0 cos(theta);
                   ];
        case 'z'
            Rot = [
                cos(theta) -sin(theta) 0;
                sin(theta) cos(theta) 0;
                0 0 1;
                ];
        otherwise
            warning('Input The Number');
            return;
end
%     RotatedPoint = Point * Rot;
    trans = [0,0,0];
    tform = rigid3d(Rot, trans);
    RotatedPoint = pctransform(Point, tform);
end
