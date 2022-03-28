---
title: Running
category: Setup
order: 5
brief: Running the software.
---

In order to run the already installed system please perform the following steps:

1. Run Matlab.
   2. In Matlab Command Window run the Peter Corke's Robotics, Vision & Control toolkit, e.g. nn Linux/Mac:
   ```
      cd ~/ws_emor/emor_trs/matlab
      run('startup_robot.m');
   ```
   2. Run CoppeliaSim simulator (in Linux: type `./coppeliaSim.sh` in the CoppeliaSim directory).
   2. Load the environemnt with youBot in CoppeliaSim.
   2. In Matlab Command Window change the current directory:
   ```
      cd ~/ws_emor/emor_trs/youbot
   ```
Now you can run the control scripts. Please see the [Example Task page]({{site.baseurl}}/03_references/03_example_task){:target="_blank"}. 
