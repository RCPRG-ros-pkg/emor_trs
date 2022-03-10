---
title: Software components
category: Setup
order: 1
brief: Description of software components needed for the tutorials.
---

Please read and follow the instruction carefully, to avoid errors and wasting your precious time!

The programming/simulation environment used in EMOR tutorials reiles on four software components:
 * Matlab
 * Peter Corke's RVC toolbox
 * The CoppeliaSim simulator (it was named V-REP in old times)
 * The Matlab bindings for CoppeliaSim

It is required to use a fairly recent version of Matlab. Please notice that Matlab versions older than 2011 may cause problems. 

Before installing CoppeliaSim and RVC, please take the time to read the tips below:

 * The installation process needs to be slightly adapted to your platform (Linux, Mac, Win), and to your Matlab version. At each step of the install procedure, I provide a set of commands that are tailored to a 64-bit Linux machine. If you use a different setup, you may have to adapt these commands.
 * If you are using Windows, you can pretty much follow the directives below. However, to ease the process, I suggest you install everything in `C:/emor` instead of your home directory.
 * In the setup instructions, the tilde `~` character stands for the home directory. If you are using Windows, use `C:/` instead of `~`. If you decide to go against this recommendation, please make sure that the path where you install the software does not contain spaces, accented characters, or other non-letter characters. Letters and numbers only please.
