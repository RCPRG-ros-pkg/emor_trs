---
title: Sensors
category: References
order: 6
brief: Instructions for using sensors
---

Additionally, you should gather and analyse data from the lidar sensors (the laser range sensors).
There are two variables that keep the LIDAR data:
* `pts` - a table containing LIDAR readings: the end-of-ray points, i.e. contact points of rays and obstacles in sensors's coordinates, each expressed as [x;y;z]
* `contacts` - a table of values (0 or 1) determining whether an obstactle was detected or the reading corresponds to the maximal sensor range (in this case it is set to 5m)

The input variables that describe the pose of the robot: `position` and `orientation` are not relevant in this tutorial.
The input data from the LIDAR sensor is sufficient to control the movements of the robot in a desired way.

To better understand the data acquired from LIDAR sensor, consider a simple example:
![lidar_small]({{ site.baseurl }}/images/lidar_small.jpg){:width="75%"}

In this example the LIRAR sends only three rays and one of them hits an obstacle. The array `pts` contains end-of-ray points
(the contact points of rays with obstacles), and in this particular case it is
```
-1.6  0.0   1.6
-1.6  -0.5   -1.6
0.08  0.08  0.08
```
where each column represents x, y and z coordinates of the contact point of the laser ray and an obstacle.
If a laser ray is not hitting an obstacle, its contact point is at the end of the ray within a specified range (in the example, the LIDAR range is set to 2 m, so the rays end 2 meters from the sensor).
The `contacts` array contains values indicating if rays hit obstacles. In the example, the array is `[0 1 0]`.
The central ray hits an obstacle, so its corresponding value in the `contacts` array is 1. Also, its contact point in the `pts` table is `[0, -0.5, 0.08]` (it is the central column in the `pts` array).
As the other two rays are not in contact with obstacles, their corresponding values in the `contacts` array are 0 and their corresponding end-of-ray points in the
`pts` table are at distance of 2 m from the sensor (the maximal range of the sensor in this example).

Please note that the LIDAR sensor used in the simulator has range of 5 m and sends 684 rays, so the lengths of <code>pts</code> table and <code>contacts</code> array are 684.

![lidar]({{ site.baseurl }}/images/lidar.jpg){:width="75%"}
