clear all;
close all;

% Capture the maze image.
cam = webcam(3);
raw = snapshot(cam);
%raw = imread('maze1.png');
img = rgb2gray(raw); % Conver to grayscale
binary = imbinarize(img,'adaptive','ForegroundPolarity','dark','Sensitivity',0.45); % Threshold to binary
dilated = imerode(binary, ones(15)); % Dilate to smooth the walls and move us to the middle 

maze_mask = imfill(~dilated, 'holes'); % Find the maze area
maze = dilated & maze_mask; % Eliminate anything outside it
maze = imerode(maze, ones(15));

imshow(maze); % Let's see
waitforbuttonpress;

[rows, cols] = find(maze);
A = rows + cols;
index = find(A == max(A(:))); % The lower right corner
finish = [rows(index), cols(index)];
index = find(A == min(A(:))); % The upper left corner
start = [rows(index), cols(index)];

adj = [[0 1]; [0 -1]; [1 0]; [-1 0]]; % Adjacency for neighbors
queue = zeros(numel(maze), 2); % queue to hold the boundary elements
mark = ~maze; % arrary to mark points as considered
dist = zeros(size(maze)); % Distance Array for points 
dist(:) = numel(maze); % Set the distances to the largest possible value
front = 1; % front of the queue
back = 2; % back of the queue

mark(finish(1), finish(2)) = 1; % The starting point has been visited
dist(finish(1), finish(2)) = 0; % This is the destination, so distance is zero
queue(front, :) = finish;

while back > front % keep looping as long as there are more points to visit
    point = queue(front, :);
    nextPoints = point + adj;
    for i = 1:4 % loop over the possible neighbors
        if mark(nextPoints(i,1), nextPoints(i,2)) == 0 % we haven't been here yet
            queue(back, :) = nextPoints(i, :); % add in the next point
            back = back + 1;
            mark(nextPoints(i,1), nextPoints(i,2)) = 1; % mark this point as done
            dist(nextPoints(i,1), nextPoints(i,2)) = dist(point(1), point(2)) + 1;
        end
    end
    
    front = front + 1; % move to the next position
end

if numel(start) > 2
    start = start(1, :)
end

% Now find the path to the goal from the start by greedy approach
path = zeros(dist(start(1), start(2))+1, 2); % follow a path back to the start
path(1, :) = start;
front = 2; % The next spot to add to the path
row = start(1);
col = start(2);

while 1
    while 1 % move vertically
        current = dist(row, col);
        up = dist(row-1, col);
        down = dist(row+1, col);
        if up < current
            row = row - 1;
            path(front, :) = [row, col];
            front = front + 1;
        elseif down < current
            row = row + 1;
            path(front, :) = [row, col];
            front = front + 1;
        else
            break; % we reached a minimum
        end
    end
    
    while 1 % move horizontally
        current = dist(row, col);
        left = dist(row, col-1);
        right = dist(row, col+1);
        if left < current % Look Left
            col = col - 1;
            path(front, :) = [row, col];
            front = front + 1;
        elseif right < current % Look Right
            col = col + 1;
            path(front, :) = [row, col];
            front = front + 1;
        else
            break; % we reached a minimum
        end
    end
    
    if dist(row, col) == 0 % We're at the end
        break;
    end
end

for i = 1:dist(start(1), start(2))+1
    row = path(i, 1);
    col = path(i, 2);
    raw(row, col, :) = [255, 0, 0];
end

imshow(raw);






