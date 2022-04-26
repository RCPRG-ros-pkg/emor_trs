---
title: Task 3
category: Tasks
order: 3
brief: 
---

{::comment}
To be announced.
{:/comment}


## Introduction

The main goal of this task is to learn to control a robot using multiple behaviours governed by a finite state machine (FSM).

Finite State Machines are a useful tool for programming robots.
There are many resources you can read to undestand the concept of FSM, e.g. <a href="https://www.researchgate.net/publication/327389755_Using_Finite_State_Machines_in_Introductory_Robotics_Methods_and_Applications_for_Teaching_and_Learning">this article</a>

Your task is to generate a trajectory that uses both trajectory generators from
the [Task 1]({{site.baseurl}}/04_tasks/01_task_1){:target="_blank"} and [Task 2]({{site.baseurl}}/04_tasks/02_task_2){:target="_blank"}.
The robot should follow a rounded rectangle path that consists of two half circles and two straight lines:

![Task 3]({{ site.baseurl }}/images/task3_img1b.png){:width="50%"}

There are three parameters that describe the path: diameter, length and angle:

![Task 3]({{ site.baseurl }}/images/task3_img2.png){:width="50%"}

You should write a script `solution3.m` that implements a callback function `solution3`.
The parameters are passed to the control program through the variable-length
argument list in the `run_simulation` function, e.g. `run_simulation(@solution3, false, 1, 3, 0.5)`
where the arguments are:
* `solution3` is the name of your control callback function
* `false` - do not display the sensor data (simulation runs faster)
* `1` - the diameter of the rouded rectangle (this is an example value)
* `3` - the length of the rouded rectangle (this is an example value)
* `0.5` - the angle of the rouded rectangle (in radians, this is an example value)

The callback function for this task must be declared as:
```
function [forwBackVel, leftRightVel, rotVel, finish] = solution3(pts, contacts, position, orientation, varargin)
% The control loop callback function - the solution for Task 3

    % get the parameters
    if length(varargin) ~= 3,
         error('Wrong number of additional arguments: %d\n', length(varargin));
    end
    param_diameter = varargin{1};
    param_length = varargin{2};
    param_angle = varargin{3};
    
    % declare the persistent variable that keeps the state of the Finite
    % State Machine (FSM)
    persistent state;
    if isempty(state),
        % the initial state of the FSM is 'init'
        state = 'init';
    end

    % initialize the robot control variables (returned by this function)
    finish = false;
    forwBackVel = 0;
    leftRightVel = 0;
    rotVel = 0;

    % TODO: manage the states of FSM
    ...
end
```
Please refer to solution `solution0a` in the [Example Task]({{site.baseurl}}/03_references/03_example_task){:target="_blank"} for more details on variable-length argument list.


## Task requirements

* The name of the control callback function should be `solution3`
* Both position and orientation must be controlled
* The robot must follow the desired path
* The robot can move infinitelly
* Use the environment file `~/emor_trs/youbot/vrep_env/exercise01.ttt`


## Grading

You can get 5 points, including:
* proper implementation of the FSM: states, transitions, conditions, etc.
* proper use of all parameters
