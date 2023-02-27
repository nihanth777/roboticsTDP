% Script for plotting the Soccer field over the Robot Visualizer
%
% Copyright 2019 The MathWorks, Inc.

% Find the figure number to start plotting over
figNum = 1;
figure(figNum);
hold on

variables;

% Title
title('Robot Soccer Simulation');

% Draw outer boundary
rectangle('Position', [0 0 xlimit_outer ylimit_outer],'LineWidth', 4, 'FaceColor','#567d46');

%new code
rectangle('Position', [xlimit_boarderstrip ylimit_boarderstrip xlimit_inner ylimit_inner], 'LineWidth', 2,'EdgeColor','w');
rectangle('Position', [xlimit_boarderstrip-goalpost_xlimit (ylimit_outer-goalpost_ylimit)/2 goalpost_xlimit goalpost_ylimit], 'LineWidth', 3,'EdgeColor','w')
rectangle('Position', [xlimit_boarderstrip (ylimit_outer-goalarea_ylimit)/2 goalarea_xlimit goalarea_ylimit], 'LineWidth', 2,'EdgeColor','w')
rectangle('Position', [xlimit_boarderstrip (ylimit_outer-penaltyarea_ylimit)/2 penaltyarea_xlimit penaltyarea_ylimit], 'LineWidth', 2,'EdgeColor','w')
rectangle("Position", [xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit (ylimit_outer-penaltyarea_ylimit)/2 penaltyarea_xlimit penaltyarea_ylimit], 'LineWidth', 2,'EdgeColor','w')
rectangle('Position', [xlimit_inner+xlimit_boarderstrip-goalarea_xlimit (ylimit_outer-goalarea_ylimit)/2 goalarea_xlimit goalarea_ylimit], 'LineWidth', 2,'EdgeColor','w')
rectangle('Position', [xlimit_inner+xlimit_boarderstrip (ylimit_outer-goalpost_ylimit)/2 goalpost_xlimit goalpost_ylimit], 'LineWidth', 3,'EdgeColor','w')

plot([xlimit_outer/2 xlimit_outer/2], [ylimit_boarderstrip ylimit_outer-ylimit_boarderstrip],'LineWidth',2,'Color','w')
viscircles([xlimit_outer/2 ylimit_outer/2],centrecircle_dia/2,'Color','w');

plot(xlimit_boarderstrip+penaltymark, ylimit_outer/2, Color='w',Marker='+',LineWidth=2);
plot(xlimit_outer-xlimit_boarderstrip-penaltymark, ylimit_outer/2, Color='w',Marker='+',LineWidth=2);
plot(xlimit_outer/2, ylimit_outer/2, Color='w',Marker='+',LineWidth=2);

% Remove default labels and ticks
xlabel('');
ylabel('');
yticks('');
xticks('');

% Crop to field dimensions
axis equal
xlim([0 xlimit_outer]);
ylim([0 ylimit_outer]);

hold off;
