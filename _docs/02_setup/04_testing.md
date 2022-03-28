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
   2. Test if the Matlab bindings to CoppeliaSim work - run in Matlab Command Window:
   ```
      cd ~/ws_emor/emor_trs/youbot
      binding_test();
   ```
   You should see the output:

      ![binding_test]({{ site.baseurl }}/images/binding_test.png)

## Testing RVC toolbox

Test if the RVC toolbox works - run in Matlab Command Window:
```
rotx(1)
```
You should see the output:

![rotx_1]({{ site.baseurl }}/images/rotx_1.png)

If there is no error, Peter Corke's RVC toolbox is working! If there is an error, check the steps above and read the toolbox's [install doc](https://petercorke.com/toolboxes/robotics-toolbox/){:target="_blank"}.

If the output differs, you have probably installed Robotics Toolbox form the official Matlab add-ons. Please remove the Robotics Toolbox, and install the RVC toolbox as described in [CoppeliaSim, Robotics Toolbox page]({{ site.baseurl }}/02_setup/03_simulator)
