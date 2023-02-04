% Script for plotting the Soccer field over the Robot Visualizer
%
% Copyright 2019 The MathWorks, Inc.

% Find the figure number to start plotting over
obj = findobj('Tag','MultiRobotEnvironment');
figNum = obj.Number;
figure(figNum);
hold on

variables;

% Title
title('Robot Soccer Simulation');



% Center circle
viscircles([xlimit_outer/2 ylimit_outer/2],centrecircle_dia/2,'Color','k');

% Draw outer boundary
rectangle('Position', [0 0 xlimit_outer ylimit_outer],'LineWidth', 4);

%new code
rectangle('Position', [xlimit_boarderstrip ylimit_boarderstrip xlimit_inner ylimit_inner], 'LineWidth', 2);
rectangle('Position', [xlimit_boarderstrip-goalpost_xlimit (ylimit_outer-goalpost_ylimit)/2 goalpost_xlimit goalpost_ylimit], 'LineWidth', 3)
rectangle('Position', [xlimit_boarderstrip (ylimit_outer-goalarea_ylimit)/2 goalarea_xlimit goalarea_ylimit], 'LineWidth', 2)
rectangle('Position', [xlimit_boarderstrip (ylimit_outer-penaltyarea_ylimit)/2 penaltyarea_xlimit penaltyarea_ylimit], 'LineWidth', 2)
rectangle("Position", [xlimit_inner+xlimit_boarderstrip-penaltyarea_xlimit (ylimit_outer-penaltyarea_ylimit)/2 penaltyarea_xlimit penaltyarea_ylimit], 'LineWidth', 2)
rectangle('Position', [xlimit_inner+xlimit_boarderstrip-goalarea_xlimit (ylimit_outer-goalarea_ylimit)/2 goalarea_xlimit goalarea_ylimit], 'LineWidth', 2)
rectangle('Position', [xlimit_inner+xlimit_boarderstrip (ylimit_outer-goalpost_ylimit)/2 goalpost_xlimit goalpost_ylimit], 'LineWidth', 3)

plot(xlimit_outer/2, [ylimit_boarderstrip ylimit_outer-(ylimit_boarderstrip+ylimit_inner)],'k-', 'LineWidth', 2)


% Remove default labels and ticks
xlabel('');
ylabel('');
yticks('');
xticks('');

% Crop to field dimensions
axis equal
xlim([0 xlimit_outer]);
ylim([0 ylimit_outer]);

hold off