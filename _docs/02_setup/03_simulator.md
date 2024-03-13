---
title: CoppeliaSim, Robotics Toolbox
category: Setup
order: 3
brief: About Matlab installation.
---

The recommended procedure for setting up your computer is listed below:

1. Download the EMOR tutorials repository form github.com: [the ZIP snapshot](https://github.com/RCPRG-ros-pkg/emor_trs/archive/master.zip){:target="_blank"}. Unzip the zip file in the `~ws_emor` directory (in Ubuntu) or `C:/emor/ws_emor` directory (in Windows).
1. Download [CoppeliaSim EDU](https://www.coppeliarobotics.com/){:target="_blank"}. When you're done downloading CoppeliaSim, unpack it in the `ws_emor` workspace directory.
1. Install the CoppeliaSim bindings for Matlab:
   2. You must copy three files from the directory of the CoppeliaSim app (downloaded at the previous step) to the directory named `youbot` within your local copy of the GitHub repository. The three files you need to copy are named
      * `remApi.m` -- the file is located in `{CoppeliaSim_path}/programming/legacyRemoteApi/remoteApiBindings/matlab/matlab`
      * `remoteApiProto.m` -- the file is located in `{CoppeliaSim_path}/programming/legacyRemoteApi/remoteApiBindings/matlab/matlab`
      * `remoteApi.so` (if you use Linux) or `remoteApi.dll` (if you use Windows) or `remoteApi.dylib` (if you use a Mac). If you have a choice between a 32-bit or 64-bit remoteApi, pick the one that corresponds to your Matlab install (32-bit Matlab or 64-bit Matlab). If you have 32-bit Matlab, pick the 32-bit remoteApi, even if your kernel is 64-bit. The file is located in `{CoppeliaSim_path}/programming/legacyRemoteApi/remoteApiBindings/lib/lib`
      You will find these files in the directory containing the CoppeliaSim app. Look in the `programming/legacyRemoteApi/remoteApiBindings/lib/lib` and `programming/legacyRemoteApi/remoteApiBindings/matlab/matlab` subdirectories of the CoppeliaSim app directory (although this can change from version to version). You must copy these files to the youbot directory within your copy of the GitHub repo. If you closely followed the instructions above, the youbot directory is at `~/ws_emor/emor_trs/youbot` (Linux/Mac) or `C:/ws_emor/emor_trs/youbot (Windows)`.
   2. Run Matlab and change the current directory to the youbot directory (in Matlab Command Window), e.g. on Linux/Mac:
   ```
       cd ~/ws_emor/emor_trs/youbot
   ```
      Then type (in Matlab):
   ```
       vrep=remApi('remoteApi');
       vrep.delete();
   ```
    If there is no error, the Matlab bindings to CoppeliaSim are loaded! If there is an error, check the steps above, and read CoppeliaSim Matlab bindings help.
1. In Matlab Command Window, run the `startup_robot.m` file provided via the Git repository. If you cloned the Git repository in the `ws_emor` workspace directory, run in Matlab Command Window:
```
    run('~/ws_emor/emor_trs/matlab/startup_robot.m');
```
It will download and subsequently run the Peter Corke's Robotics, Vision and Control toolkit.
This line needs to be run every time Matlab restarts. You can add the script to your Matlab startup file.

Please follow the instructions from the next section in order to verify whether the setup works.
