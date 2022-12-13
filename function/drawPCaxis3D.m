function [fig, coeff, score] = drawPCaxis3D(ptData)
    % This function draws PC Axis on The plot After calculate by PCA
    % @param data => PointCloud.Location
    % 
    [coeff, score] = pca(ptData);
    [h1, h2, h3] = pcaxisVector(coeff);
    meanData = mean(ptData);
    x = meanData(:,1);
    X = [x x x];
    y = meanData(:,2);
    Y = [y y y];
    z = meanData(:,3);
    Z = [z z z];
    
    fig = figure('Position', [100 500 500 400]); 

    hold on;
    xLabel = [200 0 0];
    yLabel = [0 200 0];
    zLabel = [0 0 200];
    quiver3(X, Y, Z, h1, h2, h3,'red','AutoScale', "on", 'AutoScaleFactor',165, 'LineWidth',3.5);
    text(xLabel,yLabel,zLabel, num2str((1:numel(xLabel)).'), 'Color','w', 'FontSize',20);
    quiver3(X, Y, Z, -h1, -h2, -h3,'red', 'AutoScale', "on", 'AutoScaleFactor',140, 'Marker','o','ShowArrowHead','off', 'LineWidth',3.5);
    grid on;
%     pcshow(ptData);
    pcshow(ptData, 'AxesVisibility','on');
    hold off;
end


