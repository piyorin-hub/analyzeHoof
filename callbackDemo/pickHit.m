function pickHit
    f = figure;
    ax = axes;
    p = patch(rand(1,3),rand(1,3),'g');
    l = line([1 0],[0 1]);
    % dt = datatip(p);
    set(f,'ButtonDownFcn',@(~,~)disp('figure'),...
       'HitTest','off')
    set(ax,'ButtonDownFcn',@(~,~)disp('axes'),...
       'HitTest','off')
    set(p,'ButtonDownFcn',@(~,~)disp('patch'),...
       'PickableParts','all','FaceColor','blue')
    set(l,'ButtonDownFcn',@(~,~)disp('line'),...
       'HitTest','on')
    % set(dt, 'ButtonDownFcn', @(~,~)disp('dt'), ...
    %     'HitTest', 'on')
end