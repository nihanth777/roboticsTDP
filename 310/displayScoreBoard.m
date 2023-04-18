% Define the teams and their scores
function displayScoreBoard(score_home, score_away,gamesection)

team1 = 'Red  Team';
team2 = 'Blue Team';
team1_score = score_home;
team2_score = score_away;

% Create the score board as a string
scoreboard = sprintf('%s\n%s: %d\n%s: %d', gamesection,team1, team1_score, team2, team2_score);

% Create a message box to display the score board
score_count = msgbox(scoreboard, 'Goal Score Board');
%set(score_count, 'position', [30 550 220 120]);
set(score_count, 'position', [100 500 220 120]);


ah = get(score_count, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 25 );