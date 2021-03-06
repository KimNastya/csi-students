function createfigure(X1, YMatrix1)
%CREATEFIGURE(X1, YMATRIX1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 01-Jun-2017 02:22:31

% Create figure
figure1 = figure('PaperType','a4letter',...
    'PaperSize',[20.98404194812 29.67743169791],...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);

% Create axes
axes1 = axes('Parent',figure1,'FontSize',20,'FontName','Times New Roman');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'Parent',axes1,'LineWidth',2);
set(plot1(1),'Color',[1 0.200000002980232 0.400000005960464],...
    'DisplayName','T_u=0.3 ��');
set(plot1(2),'LineWidth',1,'DisplayName','T_u=0.6 ��','Color',[0 0 0]);
set(plot1(3),'Color',[0 1 0],'DisplayName','T_u=0.9 ��');

% Create xlabel
xlabel('t, c','FontSize',20,'FontName','Times New Roman');

% Create ylabel
ylabel('X, �','FontSize',20,'FontName','Times New Roman');

% Create legend
legend(axes1,'show');

