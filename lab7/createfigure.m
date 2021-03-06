function createfigure2(X1, YMatrix1)
%CREATEFIGURE2(X1, YMATRIX1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 26-May-2017 15:49:23

% Create figure
figure1 = figure('PaperType','a4letter',...
    'PaperSize',[20.98404194812 29.67743169791],...
    'Color',[0.933333337306976 0.933333337306976 0.933333337306976]);

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',12,...
    'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'Parent',axes1,'LineWidth',2);
set(plot1(1),'Color',[0 0.447058826684952 0.74117648601532],...
    'DisplayName','k=1');
set(plot1(2),'Color',[0.466666668653488 0.674509823322296 0.18823529779911],...
    'DisplayName','k=5');
set(plot1(3),'Color',[1 0.200000002980232 0.200000002980232],...
    'DisplayName','k=10');

% Create xlabel
xlabel('t,c','Interpreter','none','FontSize',12,...
    'FontName','Times New Roman');

% Create ylabel
ylabel('y(t)','Interpreter','none','FontSize',12,...
    'FontName','Times New Roman');

% Create legend
legend(axes1,'show');

