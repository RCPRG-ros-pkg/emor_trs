---
title: Task 2
category: Tasks
order: 2
brief: 
---

{::comment}
To be announced.
{:/comment}

## Introduction

The second trajectory the youBot robot has to follow is a circle. The robot should keep the constant orientation while moving along a circle (as in the figure). The radius of the circle is passed to the control program through the variable-length argument list in the `run_simulation` function, e.g. running the function `run_simulation(@solution2, false, 1.234)` should generate the movement of the robot along a circle of radius 1.234 m.

![Task 2]({{ site.baseurl }}/images/vrep-circle2.jpg){:width="50%"}

## Task requirements

* The name of the control callback function should be `solution2`,
* The control program can be implemented as a two state finite state maching (FSM), i.e. aside of the initial state you it will be required to create another state responsible for computation of the required linear and angular velocities.
* It is suggested that in the initialize state you should store the coordinates of the center of the circle - they can be computed once, based on the current (initial) position of the robot and desired radius of the circle.
* Both position and orientation of the robot should be controlled by regulators (P regulators with limited output).
* The robot can move infinitelly.
* The radius of circle should be equal to the value provided as an argument to the run_simulation function.
* Use a clear environment with no obstacles, e.g. file `~/emor_trs/youbot/vrep_env/exercise01.ttt`.

## Grading
You can get 5 points, including:
* x, y regulators (proportional with limited output),
* phi regulator (proportional with limited output).
* using reference frames transformations.

A complete solution for a task is the source code and a report.

Please refer to the [Schedule]({{site.baseurl}}/01_introduction/02_schedule){:target="_blank"} page for consultation dates and deadlines.
