---
title: Matlab
category: References
order: 1
brief: Matlab references
---

## Docs

In your tasks you are going to use Matlab. Please get familiar at least with the following topics:
* [if-else](http://www.mathworks.com/help/matlab/ref/if.html){:target="_blank"},
* [variable argument list](http://www.mathworks.com/help/matlab/ref/varargin.html){:target="_blank"},
* [matrices and arrays](http://www.mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html){:target="_blank"},
* [transposition](http://www.mathworks.com/help/matlab/ref/transpose.html){:target="_blank"},
* [matrix multiplication](http://www.mathworks.com/help/matlab/ref/mtimes.html){:target="_blank"},
* [norm of a matrix or vector](http://www.mathworks.com/help/symbolic/norm.html){:target="_blank"}.

Also, feel free to search for other topics and learn commands of Matlab.

## Avoiding Loops

Matlab is an interpreted language. Despite recent progress in the JIT accelerator, running loops in Matlab is still much slower than running loops in native code. Since most Matlab functions rely on a C implementation of large loops, it is good practice to always prefer calling a function over writing a loop when handling large datatypes. In your tasks, the two datatypes that you need to handle with care are images and point clouds (from the RGB camera, or from the 2D/3D laser scanners). Handling images and point clouds with Matlab functions or MEX functions instead of Matlab loops will often make your code 100 times faster.

An example of the computational cost of flipping an image with a loop vs. a Matlab function is provided [here](https://github.com/ULgRobotics/trs/blob/master/matlab/test_loop_vs_native.m){:target="_blank"}.

## Running Code from Files

The Matlab JIT accelerator doesn't optimize code typed into the console. To verify this behavior, run the function above by typing `test_loop_vs_native` in the console, then by copy-pasting the contents of the `test_loop_vs_native` function directly into the console. As a result of this behavior, always run your code from .m files.
