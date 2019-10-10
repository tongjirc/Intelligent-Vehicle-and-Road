Scaled-Vehicle-in-the-loop Testbed
====
This part mainly depends on [AtsushiSakai](https://github.com/AtsushiSakai/PythonRobotics) and [Barc](https://github.com/MPC-Berkeley/barc) work. we build a 10/1 scaled automated vehicle (SAV). This vehicle can control the steering and torque of the vehicle through the ESC. So we can assemble an autonomous vehicle by hand.<bar>

1）Onboard Hardware
----
<bar><div align=center><img width="800" height="250" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/hardware.png"/></div>
As shown in Figure, the SAV contains five sensors. It uses a 640*480 high-speed monocular camera to capture images in front of the vehicle. The IMU is one of the most important sensors in the modern vehicles. This study uses the SparkFun Razor IMU module to collect vehicle accelerations, angular velocities and orientations. The microcontroller is the Arduino Nano module to measure the manual controller PWM signals and to relay the control commands from the microcomputer to the vehicle base. The indoor GPS uses the Marvelmind indoor positioning kit to replace the differential global positioning system (DGPS) signal in the field. It can obtain a positioning signal with the frequency of 3-20 Hz and the error of 2 cm, which is one tenth of the widely used DGPS error in the field. This study uses rplidar-A2 to obtain point cloud signals in the 6 m range because LiDAR is the most accurate distance sensor. The IMU and LiDAR can be used for map construction and state estimation, which are packaged in a software package named gmapping . The charging treasure with 190 w power is used to supply power to the microcomputer to ensure stable operation of the microcomputer. The microcomputer uses Intel Nuc, which can complete most computing tasks.

 <bar>

2）Onboard Software
----
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/onboard_software.png"/></div>
We use the PyQt5 to estabulish the main form on board, which can monitor the status of the vehicle and do some motion control through the button.

+ Mapping Algorithm
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/mapping.png"/></div>
SAV uses gmapping algorithm to generate the map and at the same time as a electrical odometry.

+ Vehicle Model
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/ackman_model.png"/></div>
The ackerman bicycle model is a well-known method to simplify a vehicle. The vehicle center of the mass is assumed to be located at the midpoint of the rear axle. The state [X,Y,ψ,v] of the center can be obtained by solving the kinematic equations.
+ Trajectory Planning
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/planning.gif"/></div>
We use the quintic polynomials planning algorithm to generate an optimal trajectory.

+ Trajectory Control
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/trajectory_tracking.gif"/></div>
Base on the unicycle model, the vehicle control problem is formulated into a nonlinear model predictive control model.
