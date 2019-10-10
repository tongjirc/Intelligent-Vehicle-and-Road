# -*- coding: utf-8 -*-
"""
Created on Sat Sep 21 09:09:38 2019

@author: lenovo
"""

#/usr/bin/python3
# -*- coding: utf-8 -*-
# author = chenzixuan
import math
import time
import matplotlib.pyplot as plt
import matplotlib as mat
import numpy as np
import pandas as pd
from gurobipy import *
from math import sin, asin, cos, radians, fabs, sqrt
from scipy.optimize import leastsq
from xlrd import *
#workbook=open_workbook("sheet1.xlsx")
#worksheet=workbook.sheet_by_index(0)
#data=[]
#for i in range(2,worksheet.nrows): #循环打印每一行
#    data.append(np.array(worksheet.row_values(i)))

#data=np.array(data)
THETA=20
ALPHA=[20,10]
BETA=[15,20]
EPSIL=0.001
LENGTH=data.shape[0]

w=[0.5,0.5,0.4]
Optimal=[109342.28180310303,13.0,4.0]

c=data[:,3]
t=data[:,4]
d=np.ones((LENGTH,LENGTH))
for i in range(0,LENGTH):
    for j in range(0,LENGTH):
        d[i,j]=np.sqrt((data[i,1]-data[j,1])**2+(data[i,2]-data[j,2])**2+(data[i,0]-data[j,0])**2)
        if(i==j):
            d[i,j]=float(10000000)


#x->point
def xRoute(x1):
    last=np.array(x1)
    cons=last.reshape(LENGTH+4,LENGTH)[0:LENGTH,:]
    points_tuple=np.where(cons==1)
    points=[]
    pointsNum=len(points_tuple[0])
    for i in range(pointsNum):
        points.append([points_tuple[0][i],points_tuple[1][i]])
    for i in range(pointsNum-1):
        for j in range(1,pointsNum):
            if points[j][0]==points[i][1]:
                t=points[j]
                points[j]=points[i+1]
                points[i+1]=t
    return(points)

#Search Circle
def Next_Point(Oi, Oj, vi, r):
    Oij=Oj-Oi
    Lij=np.linalg.norm(Oij)
    a=np.cross(vi,Oij)
    n=a/np.linalg.norm(a)
    psi=math.acos(np.inner(vi,Oij)/(np.linalg.norm(vi)*Lij))
    d_line=Lij-2*r*math.sin(psi)
    d_arc=2*r*psi
    d=d_line+d_arc
    vj=math.cos(2*psi)*vi+(1-math.cos(2*psi))*np.inner(vi,n)*n+math.sin(2*psi)*np.cross(n,vi)

    return (d,vj)

def For_ZX(traj, delta=EPSIL, alpha1=ALPHA[0], alpha2=ALPHA[1], beta1=BETA[0], beta2=BETA[1], theta=THETA, r=200):

    # 主函数
    # 返回值： True=可到达终点   False=炸

    traj=np.array(traj)
    nn=traj.shape[0]
    d=0
    V=0 #垂直
    L=0 #水平

    for n in range(0,nn):
        nOi=traj[n][0]
        nOj=traj[n][1]
        Oi=np.array([data[nOi,0],data[nOi,1],data[nOi,2]])
        Oj=np.array([data[nOj,0],data[nOj,1],data[nOj,2]])
        if n==0:
            v=Oj-Oi
            tmp_d=np.linalg.norm(v)
        else:
            res=Next_Point(Oi, Oj, v, r)
            tmp_d=res[0]
            v=res[1]
        d=d+tmp_d

        # Calibration check
        # 0：水平 1：垂直
        cal=data[nOj,3]
        V=V+tmp_d*delta
        L=L+tmp_d*delta

        if cal==0:  #水平
            if (V<=beta1) and (L<=beta2):
                L=0
        elif cal==1: #垂直
            if (V<=alpha1) and (L<=alpha2):
                V=0

        if (V>theta) and (L>theta):
            return (False)

    return (True)

# Define my callback function
def mycallback(model, where):
    if where == GRB.Callback.MIPSOL:
        # MIP solution callback
#        nodecnt = model.cbGet(GRB.Callback.MIPSOL_NODCNT)
#        obj = model.cbGet(GRB.Callback.MIPSOL_OBJ)
#        solcnt = model.cbGet(GRB.Callback.MIPSOL_SOLCNT)
#        x = model.cbGetSolution(model._vars)
        pos=[]
        for j in range(LENGTH):
            for k in range(LENGTH):
                if x[j,k].Xn==1:
                    pos.append([j,k])

        for k in range(len(pos)-1):
            for j in range(1,len(pos)):
                if pos[j][0]==pos[k][1]:
                    t=pos[j]
                    pos[j]=pos[k+1]
                    pos[k+1]=t
#        print("+++++",For_ZX(pos))
        input("Warit!!!")
#    if where == GRB.Callback.POLLING:
#        # Ignore polling callback
#        pass
#    elif where == GRB.Callback.PRESOLVE:
#        # Presolve callback
#        cdels = model.cbGet(GRB.Callback.PRE_COLDEL)
#        rdels = model.cbGet(GRB.Callback.PRE_ROWDEL)
#        if cdels or rdels:
#            print('%d columns and %d rows are removed' % (cdels, rdels))
#    elif where == GRB.Callback.SIMPLEX:
#        # Simplex callback
#        itcnt = model.cbGet(GRB.Callback.SPX_ITRCNT)
#        if itcnt - model._lastiter >= 100:
#            model._lastiter = itcnt
#            obj = model.cbGet(GRB.Callback.SPX_OBJVAL)
#            ispert = model.cbGet(GRB.Callback.SPX_ISPERT)
#            pinf = model.cbGet(GRB.Callback.SPX_PRIMINF)
#            dinf = model.cbGet(GRB.Callback.SPX_DUALINF)
#            if ispert == 0:
#                ch = ' '
#            elif ispert == 1:
#                ch = 'S'
#            else:
#                ch = 'P'
#            print('%d %g%s %g %g' % (int(itcnt), obj, ch, pinf, dinf))
#    elif where == GRB.Callback.MIP:
        # General MIP callback
#        nodecnt = model.cbGet(GRB.Callback.MIP_NODCNT)
#        objbst = model.cbGet(GRB.Callback.MIP_OBJBST)
#        objbnd = model.cbGet(GRB.Callback.MIP_OBJBND)
#        solcnt = model.cbGet(GRB.Callback.MIP_SOLCNT)
#        if nodecnt - model._lastnode >= 100:
#            model._lastnode = nodecnt
#            actnodes = model.cbGet(GRB.Callback.MIP_NODLFT)
#            itcnt = model.cbGet(GRB.Callback.MIP_ITRCNT)
#            cutcnt = model.cbGet(GRB.Callback.MIP_CUTCNT)
#            print('%d %d %d %g %g %d %d' % (nodecnt, actnodes, \
#                  itcnt, objbst, objbnd, solcnt, cutcnt))
#        if abs(objbst - objbnd) < 0.1 * (1.0 + abs(objbst)):
#            print('Stop early - 10% gap achieved')
#            model.terminate()
#        if nodecnt >= 10000 and solcnt:
#            print('Stop early - 10000 nodes explored')
#            model.terminate()
#    elif where == GRB.Callback.MIPNODE:
#        # MIP node callback
#        print('**** New node ****')
#        if model.cbGet(GRB.Callback.MIPNODE_STATUS) == GRB.Status.OPTIMAL:
#            x = model.cbGetNodeRel(model._vars)
#            model.cbSetSolution(model.getVars(), x)
#    elif where == GRB.Callback.BARRIER:
#        # Barrier callback
#        itcnt = model.cbGet(GRB.Callback.BARRIER_ITRCNT)
#        primobj = model.cbGet(GRB.Callback.BARRIER_PRIMOBJ)
#        dualobj = model.cbGet(GRB.Callback.BARRIER_DUALOBJ)
#        priminf = model.cbGet(GRB.Callback.BARRIER_PRIMINF)
#        dualinf = model.cbGet(GRB.Callback.BARRIER_DUALINF)
#        cmpl = model.cbGet(GRB.Callback.BARRIER_COMPL)
#        print('%d %g %g %g %g %g' % (itcnt, primobj, dualobj, \
#              priminf, dualinf, cmpl))
#    elif where == GRB.Callback.MESSAGE:
#        # Message callback
#        msg = model.cbGet(GRB.Callback.MSG_STRING)
#        model._logfile.write(msg)
    else:
        pass

#Model setup
m=Model('MILP')
x=m.addVars(LENGTH,LENGTH,vtype=GRB.BINARY,name='x')
v=m.addVars(LENGTH,vtype=GRB.CONTINUOUS,name='v')
v1=m.addVars(LENGTH,vtype=GRB.CONTINUOUS,name='v1')
l=m.addVars(LENGTH,vtype=GRB.CONTINUOUS,name='l')
l1=m.addVars(LENGTH,vtype=GRB.CONTINUOUS,name='l1')
M=GRB.INFINITY

# Objective
#for i in range(0,LENGTH):
#    for j in range(0,LENGTH):
#        s=x[i,j]*d[i,j]
#m.setObjective(s,GRB.MINIMIZE)

obj1=quicksum(x[i,j]*d[i,j]/Optimal[0] for i in range(LENGTH) for j in range(LENGTH))
obj2=quicksum(x[i,j]/Optimal[1] for i in range(LENGTH) for j in range(LENGTH))
obj3=quicksum(x[i,j]/Optimal[2] for i in range(LENGTH) for j in range(LENGTH))

m.setObjectiveN(obj1,index=0,weight=w[0],abstol=0.5,name='obj1')
m.setObjectiveN(obj2,index=1,weight=w[1],abstol=0.5,name='obj2')
#m.setObjectiveN(obj3,index=2,weight=w[2],abstol=0.5,name='obj3')
#m.setObjective(obj1,GRB.MINIMIZE)

# Parameter Settings
#m.setParam(GRB.Param.LogFile,'MILP.log')
#m.setParam(GRB.Param.MIPGap, 0.003)
m.setParam(GRB.Param.Threads, 8)
m.setParam(GRB.Param.TimeLimit, 3600)
m.setParam(GRB.Param.PoolSearchMode,1) #0 Optimal 1 all 2 N
m.setParam(GRB.Param.PoolSolutions,20) #N Search Number
#m.setParam(GRB.Param.PoolGap, 80000) #N Search  GAP
# New V = V1 L=L1
for i in range(LENGTH):
    for j in range(LENGTH):
        m.addGenConstrIndicator(x[i, j], 1, v[j] == v1[i] + d[i, j] * EPSIL,name='vv1')
        m.addGenConstrIndicator(x[i, j], 1, l[j] == l1[i] + d[i, j] * EPSIL,name='ll1')

#init and end Constrains
m.addConstr(v[0]==0,name='initv')
m.addConstr(l[0]==0,name='initl')
m.addConstr(v1[0]==0,name='initv1')
m.addConstr(l1[0]==0,name='initl1')
m.addConstr(v[LENGTH-1]<=THETA,name='endv')
m.addConstr(l[LENGTH-1]<=THETA,name='endl')

#Network Settings Constrains
for i in range(LENGTH):
    if i==0:
        cons=1
    elif i==LENGTH-1:
        cons=-1
    else:
        cons=0
    xij=quicksum(x[i,j] for j in range(LENGTH))
    xji=quicksum(x[j,i] for j in range(LENGTH))
    m.addConstr(xij-xji==cons,name='network'+str(i))

#Error Constrain
for j in range(1,LENGTH-1):
    if c[j]==0:
        for i in range(LENGTH-1):
            m.addGenConstrIndicator(x[i,j],1,l1[j]==0,name='calil10')
            m.addGenConstrIndicator(x[i,j],1,v1[j]==v[j],name='calivv1')
            m.addGenConstrIndicator(x[i,j],1,v[j]<=BETA[0],name='calialph0')
            m.addGenConstrIndicator(x[i,j],1,l[j]<=BETA[1],name='calialph1')
    elif c[j]==1:
        for i in range(LENGTH-1):
            m.addGenConstrIndicator(x[i,j],1,l1[j]==l[j],name='calill1')
            m.addGenConstrIndicator(x[i,j],1,v1[j]==0,name='caliv10')
            m.addGenConstrIndicator(x[i,j],1,v[j]<=ALPHA[0],name='calibeta10')
            m.addGenConstrIndicator(x[i,j],1,l[j]<=ALPHA[1],name='calibeta1')
# Edge constrain
m.addConstrs((x[i,j]*d[i,j]*EPSIL<=max(min(ALPHA),min(BETA)) for i in range(LENGTH) for j in range(LENGTH-1)), name='edgecons')
m.addConstrs((x[i,LENGTH-1]*d[i,LENGTH-1]*EPSIL<=THETA for i in range(LENGTH)) , name='edgecons_1')


m.update()
m.write('milp.lp')
m.optimize()
m.objVal

last=np.array(m.x)
other=last.reshape(LENGTH+4,LENGTH)[LENGTH:LENGTH+4,:]
cons=last.reshape(LENGTH+4,LENGTH)[0:LENGTH,:]
points_tuple=np.where(cons==1)
points=[]
ind=[]
pointsNum=len(points_tuple[0])
for i in range(pointsNum):
    points.append([points_tuple[0][i],points_tuple[1][i]])
for i in range(pointsNum-1):
    for j in range(1,pointsNum):
        if points[j][0]==points[i][1]:
            t=points[j]
            points[j]=points[i+1]
            points[i+1]=t
for i in range(pointsNum):
    ind.append(points[i][1])
#m.setParam(GRB.Param.SolutionNumber, 0)
#    m.SolCount
Possible={"Val":[],"Solution":[]}
for i in range(m.SolCount):
    m.setParam(GRB.Param.SolutionNumber, i)
    pos=[]
    Possible["Val"].append(m.PoolObjVal)
    for j in range(LENGTH):
        for k in range(LENGTH):
            if x[j,k].Xn==1:
                pos.append([j,k])

    for k in range(len(pos)-1):
        for j in range(1,len(pos)):
            if pos[j][0]==pos[k][1]:
                t=pos[j]
                pos[j]=pos[k+1]
                pos[k+1]=t
    Possible["Solution"].append(pos)
