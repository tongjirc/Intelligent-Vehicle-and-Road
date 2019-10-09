Tongji intelligent-Vehicle-and-Road
====
The intelligent-vehicle-and-road project is a development platform for the cooperative vehicle-infrastructure system from Tongji University. The main purpose of this project is to achieve vehicle-infrastructure integration in the near future. As we known, the vehicle-infrastructure integration will be completed in three steps:<br>

<ol>
<li> Information interaction</li>
<li> Perception and planning integration</li>
<li> Vehicle-infrastructure integration</li>
</ol>

<bar>This site is home to the repository. The main site of our group is [here](http://mawanjing.com/), our work include three parts.<bar>

CAV Test and Evaluation
----
We developed a testbed for cooperative vehicle-infrastructure system (CVIS). The testbed include two parts (i.e., A vehicle-in-the-loop test platform and a scaled-vehicle-in-the-loop test platform). Two testbeds used augmented reality technology to test connected and automated vehicle, which build a virtual environment in the [VISSIM](https://vision-traffic.ptvgroup.com/en-us/products/ptv-vissim/) (a powerful microscopic simulation software).
* The vehicle-in-the-loop platform

<bar><div align=center>![image](http://github.com/tongjirc/Intelligent-Vehicle-and-Road/raw/master/CAV%20Test%20and%20Evaluation/image/scaledvehicle.png =300x225)</div>
* The scaled-vehicle-in-the-loop test platform

<bar><div align=center>![image](http://github.com/tongjirc/Intelligent-Vehicle-and-Road/raw/master/CAV%20Test%20and%20Evaluation/image/real.png =300x225)</div>

1）CAV Vehicle Data
----
This part is mainly for data collection and storage. First, We developed a crawler to capture the data from Gaode Map. Using the developer API to get the online data from the web. Second, we store the data from the project above, including data from simulation software and the sensors.

2）CAV Control and Planning Algorithm
----
This part is mainly for CAV control and planning algorithm. This part will be the main part of our research. With the roadside joining the Automated vehicle system, the automated vehicle is going to find the new balance between the UE(user equilibrium) and SO(system optimum), which will lead to a huge reform in the automated vehicles.

3）Recommended reading and resources
----
+ [A Gentle Introduction to ROS](https://cse.sc.edu/~jokane/agitr/), by Jason M. O'Kane, and this [basic tutorial](http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28python%29) for writing ROS nodes in python
+ [Julia JuMP](https://jump.readthedocs.io/en/latest/), Mathematical Programming using the Julia programming language
+ [Git - the simple guide](http://rogerdudler.github.io/git-guide/), or for a more in-depth reading, consider [this](https://www.atlassian.com/git/tutorials/ ) tutorial by Atlassian
