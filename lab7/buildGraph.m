function [out_figure] = buildGraph(figTitle, config, isNewFig)
% title                                           title of figure
% config
%  xy                                             x and y data columns
%  labelX ['']                                    x label
%  labelY ['']                                    y label
%  xyLim [auto system]                            x and y limints
%  lineStyle [auto detection]                     '-.' or '--' or '-' or ':'
%  marker [auto detection]                        '*' or 'x' or 'o' or '.' ...
%  isColor [false] NOT IMPLEMENTED YET            -
%  color [auto detection] NOT IMPLEMENTED YET     -
% isNewFig [false]                                use old figure or new one
%
% [] — default value
% [auto system] — use embedded matlab defaults
% [auto detection] — use local alghoritm

XY = config.xy;

% If x label exist
labX = '';
if isfield(config, 'xLabel')
    labX = config.xLabel;
end

% If x label exist
labY = '';
if isfield(config, 'yLabel')
    labY = config.yLabel;
end

% Find limits
isXLim = false;
isYLim = false;
xyLim = [];
if isfield(config, 'xyLim')
    xyLim = config.xyLim;
    limSize = size(config.xyLim);
    if limSize(1) == 2
        isXLim = true;
        isYLim = true;
    elseif limSize(1) == 1
        isXLim = true;
    end
end

% If some lines styles setted
isLineStyle = isfield(config, 'lineStyle');
isMarker = isfield(config, 'marker');

% If new figure
if nargin < 3
    isNewFig = false;
end

global legendList__;
global lineStyleList__;
global markerStyleList__;

% Create new figure
if isNewFig
    legendList__ = {};
    lineStyleList__ = {'-', '--', ':', '-.'};
    markerStyleList__ = {'o', '+', '*', '.', 'x', 's', 'd',...
                       '^', 'v', '>', '<', 'p', 'h'};
    % Create figure (with magic awsome sizes)
    out_figure = figure('PaperSize',[10 30],...
        'Name', '',...
        'Color', [1 1 1],...
        'Position',[1 1 900 571],...
        'Resize', 'off');
    % Create axes (with magic awsome position)
    axes1 = axes('Parent',out_figure,'YGrid','on','XGrid','on',...
        'Position',[0.1 0.15 0.855 0.770],...
        'FontSize',12);
    
    if isXLim
        xlim(axes1,[xyLim(1, 1) xyLim(1, 2)]);
    end
    
    if isYLim
        ylim(axes1,[xyLim(2, 1) xyLim(2, 2)]);
    end
    
    box(axes1,'on');
    hold(axes1,'all');
    title(figTitle);
end

if ~isLineStyle && ~isMarker
    lineStyle = '-';
    markerStyle = 'none';
    if ~isempty(lineStyleList__)
        lineStyle = cell2mat(lineStyleList__(1));
        lineStyleList__ = lineStyleList__(2:end);
    else
        lineStyle = '-';
        markerStyle = cell2mat(markerStyleList__(1));
        markerStyleList__ = markerStyleList__(2:end);
    end

    plot(XY(:,1),XY(:,2),...
            lineStyle,...
            'LineWidth', 1,...
            'Color',     [0 0 0],...
            'Marker',    markerStyle);

elseif isLineStyle && isMarker
    plot(XY(:,1),XY(:,2),...
            config.lineStyle,...
            'LineWidth', 1,... 
            'Color',     [0 0 0],... 
            'Marker',    config.marker);
elseif isLineStyle
    plot(XY(:,1),XY(:,2),...
            config.lineStyle,...
            'LineWidth', 1,...
            'Color',     [0 0 0]);
elseif isMarker
    plot(XY(:,1),XY(:,2),...
        '-',...
        'LineWidth', 1,...
        'Color',     [0 0 0],...
        'Marker',    config.marker);
end

legendList__(length(legendList__)+1) = {labY};

% Create xlabel
xlabel(labX, 'FontSize', 14,...
             'Interpreter', 'tex');

% Create ylabel and legend
if length(legendList__) > 1
    labY = ' ';
    leg = legend(legendList__, 'Location','Best');
    set(leg,'interpreter','tex')
end;
ylabel(labY,'FontSize',14,'Interpreter','tex');

end