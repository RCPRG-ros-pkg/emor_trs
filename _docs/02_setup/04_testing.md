---
title: Testing
category: Setup
order: 4
brief: Testing the software.
---

## Testing the Matlab - CoppeliaSim connection

This procedure checks if everything is installed properly. You only need to run it once.

1. Run the CoppeliaSim simulator (in Linux: `./coppeliaSim.sh` from CoppeliaSim directory)
1. In CoppeliaSim simulator
   2. Use the menu *File / Open Scene* and open `~/emor_trs/youbot/vrep_env/binding_test.ttt`.
   2. Hit *Start Simulation* in the *Simulation* menu.
1. In Matlab
   2. Test if the RVC toolbox works - run in Matlab Command Window:
   ```
       rotx(1)
   ```
   You should see the output:

      ![rotx_1]({{ site.baseurl }}/images/rotx_1.png)

      If there is no error, Peter Corke's RVC toolbox is working! If there is an error, check the steps above and read the toolbox's [install doc](https://petercorke.com/toolboxes/robotics-toolbox/){:target="_blank"}.
   2. Test if the Matlab bindings to CoppeliaSim work - run in Matlab Command Window:
   ```
       cd ~/ws_emor/emor_trs/youbot
       binding_test();
   ```
   You should see the output:

      ![binding_test]({{ site.baseurl }}/images/binding_test.png)
