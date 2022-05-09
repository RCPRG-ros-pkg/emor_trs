---
title: Task 5
category: Tasks
order: 5
brief: 
---

{::comment}
To be announced.
{:/comment}


## Introduction

The goal of this task is to introduce navigation realized by Bug2 algorithm.
The basic idea is to move along the line connecting the target and initial point and in the case
of being near to the obstacle follow its contour and thus circumnavigate it.
The program should work as follows:
1. Find the line `l` connecting initial and target position.
1. Rotate towards the goal.
1. Move towards the goal along the `l` line until reaching an obstacle or the goal. If the goal is reached, then stop.
1. When the robot reaches the obstacle, save the distance to the goal `d`.
1. Use "moving along the walls" controller to avoid the obstacle ([Task 4]({{site.baseurl}}/04_tasks/04_task_4){:target="_blank"}).
1. Depart immediately when the robot is on the `l` line again and the distance to the goal is lower than `d`.
1. Go to the step 2.

Implement a control callback function `solution5` that realizes the Bug2 navigation task. Use the input variables position and orientation to determine the line `l` and to calculate the distance `d`. The goal point should be provided as an additional input argument to the function `solution5`, so running the simualtion would be:
`run_simulation(@solution5, false, [goal_x, goal_y])`

You can refer to a implementation of the Bug2 algorithm in the Robotics Toolbox.
Please see the file `~/ws_emor/emor_trs/matlab/rvctools/robot/Bug2.m`.

## Task requirements

* Analyse the LIDAR readings to check if the robot is close to obstacle.
* Use the Finite State Machine (FSM) for switching between different states of Bug2 algorithm (e.g. heading towards the goal, moving along the walls).
* Use the "moving along the walls" controller to circumnavigate the obstacles.
* Use proportional controllers with limited output to move the robot along the line `l`.
* The line `l` should be calculated once, in the initial state.
* If the robot reaches the goal, stop the controller.

## Grading

You can get 5 points, including:

* Processing of the sensory data
* Overall Bug2 implementation quality, Finite State Machine
* Regulators that keep the robot on the line `l`
* Stop condition and clean exit
