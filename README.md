# MazeBot
ECE 6311 Final Project Code

Our final project includes a number of stages. It begins with our robot capturing a webcam image of a maze. We process the image of the maze to isolate the walls and the area inside the maze boundary. We then use Breadth First Search to find the distance from every pixel in the image to the maze destination (the lower right corner of the maze). We then use a greedy approach to find the shortest path from the start (upper left) to the end (lower right). We then convert the path in the maze to a path in space. From there we determine the configurations necessary to deliver the path. From there, we determine the encoder readings necessary. We then move the robot to satisfy these encoder values.
