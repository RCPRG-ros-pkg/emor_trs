---
title: Proportional regulator
category: References
order: 5
brief: Description of simple proportional regulator
---

The trajectories should be generaded using proportional regulators with limited output. The example of such regulator in pseudo-code:
```
error_x = dest_x - measured_x
u_x = gain_P * error_x
if u_x > u_max then
    u_x = u_max
else if u_x < u_min then
    u_x = u_min
end
```
where:
* `measured_x` is the current value of the controlled state variable *x*
* `dest_x` is its desired value
* `error_x` is the error
* `gain_P` is the proportional regulator gain
* `u_min` and `u_max` are the limits of the output `u_x`
