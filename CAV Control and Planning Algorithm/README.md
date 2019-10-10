CAV Control and Planning Algorithm
====
This part have three stages, including traffic model establishment, solve algorithm, and GUI tools.

1）Model Establishment
----
This section controls the traffic subjects (including vehicles, signal lights, VMS, etc.) in the traffic environment from a system perspective. The control content includes trajectory control and trajectory planning. More information you can get from [Dr. Yu](http://mawanjing.com)

<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/network.png"/></div>

2）Solve Algorithm
----
This section solves model above. The solution includes solving with the solver ([Gurobi](https://www.gurobi.com/) ,[CPLEX](https://www.ibm.com/analytics/cplex-optimizer), [OR-tools](https://developers.google.com/optimization)) and solving algorithm (e.g., Tabu Search, Ant Colony Optimization, Particle Swarm Optimization etc.).
<bar><div align=center><img width="300" height="100" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/gurobi.png"/></div>
<bar>
3）GUI Tools
----
This section is used to better demonstrate the results of the model solution, including traffic operation display ([SUMO](http://sumo.sourceforge.net/)) and model effect display ([Echarts](https://www.echartsjs.com/zh/index.html)).
<bar><div align=center><img width="300" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/SUMO.png"/><img width="400" height="225" src="https://github.com/tongjirc/Intelligent-Vehicle-and-Road/blob/master/IMG/echarts.png"/></div>
