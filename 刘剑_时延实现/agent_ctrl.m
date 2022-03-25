function [sys,x0,str,ts] = agent_ctrl(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[]; 
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

aij=[0 1 0 1 0 0;
     1 0 1 0 0 0;
     0 1 0 0 0 1;
     1 0 0 0 1 0;
     0 0 1 1 0 1;
     0 0 1 0 1 0];
 

 


k1=0.5;k2=0;k3=4;mu=7/5;


x_1=u(1);
x_2=u(2);
x_3=u(3);
x_4=u(4);
x_5=u(5);
x_6=u(6);

x_1tao=u(1+6);
x_2tao=u(2+6);
x_3tao=u(3+6);
x_4tao=u(4+6);
x_5tao=u(5+6);
x_6tao=u(6+6);

x1=x_1+x_1tao;
x2=x_2+x_2tao;
x3=x_3+x_3tao;
x4=x_4+x_4tao;
x5=x_5+x_5tao;
x6=x_6+x_6tao;

sys(1)=real(-k1*(aij(1,1)*(x1-x1)^mu+aij(1,2)*(x1-x2)^mu+aij(1,3)*(x1-x3)^mu+aij(1,4)*(x1-x4)^mu+aij(1,5)*(x1-x5)^mu+aij(1,6)*(x1-x6)^mu)-...
       k2*(aij(1,1)*sign(x1-x1)+aij(1,2)*sign(x1-x2)+aij(1,3)*sign(x1-x3)+aij(1,4)*sign(x1-x4)+aij(1,5)*sign(x1-x5)+aij(1,6)*sign(x1-x6))-...
       k3*(aij(1,1)*(x1-x1)+aij(1,2)*(x1-x2)+aij(1,3)*(x1-x3)+aij(1,4)*(x1-x4)+aij(1,5)*(x1-x5)+aij(1,6)*(x1-x6)));
sys(2)=real(-k1*(aij(2,1)*(x2-x1)^mu+aij(2,2)*(x2-x2)^mu+aij(2,3)*(x2-x3)^mu+aij(2,4)*(x2-x4)^mu+aij(2,5)*(x2-x5)^mu+aij(2,6)*(x2-x6)^mu)-...
       k2*(aij(2,1)*sign(x2-x1)+aij(2,2)*sign(x2-x2)+aij(2,3)*sign(x2-x3)+aij(2,4)*sign(x2-x4)+aij(2,5)*sign(x2-x5)+aij(2,6)*sign(x2-x6))-...
       k3*(aij(2,1)*(x2-x1)+aij(2,2)*(x2-x2)+aij(2,3)*(x2-x3)+aij(2,4)*(x2-x4)+aij(2,5)*(x2-x5)+aij(2,6)*(x2-x6)));
sys(3)=real(-k1*(aij(3,1)*(x3-x1)^mu+aij(3,2)*(x3-x2)^mu+aij(3,3)*(x3-x3)^mu+aij(3,4)*(x3-x4)^mu+aij(3,5)*(x3-x5)^mu+aij(3,6)*(x3-x6)^mu)-...
       k2*(aij(3,1)*sign(x3-x1)+aij(3,2)*sign(x3-x2)+aij(3,3)*sign(x3-x3)+aij(3,4)*sign(x3-x4)+aij(3,5)*sign(x3-x5)+aij(3,6)*sign(x3-x6))-...
       k3*(aij(3,1)*(x3-x1)+aij(3,2)*(x3-x2)+aij(3,3)*(x3-x3)+aij(3,4)*(x3-x4)+aij(3,5)*(x3-x5)+aij(3,6)*(x3-x6)));
sys(4)=real(-k1*(aij(4,1)*(x4-x1)^mu+aij(4,2)*(x4-x2)^mu+aij(4,3)*(x4-x3)^mu+aij(4,4)*(x4-x4)^mu+aij(4,5)*(x4-x5)^mu+aij(4,6)*(x4-x6)^mu)-...
       k2*(aij(4,1)*sign(x4-x1)+aij(4,2)*sign(x4-x2)+aij(4,3)*sign(x4-x3)+aij(4,4)*sign(x4-x4)+aij(4,5)*sign(x4-x5)+aij(4,6)*sign(x4-x6))-...
       k3*(aij(4,1)*(x4-x1)+aij(4,2)*(x4-x2)+aij(4,3)*(x4-x3)+aij(4,4)*(x4-x4)+aij(4,5)*(x4-x5)+aij(4,6)*(x4-x6)));
sys(5)=real(-k1*(aij(5,1)*(x5-x1)^mu+aij(5,2)*(x5-x2)^mu+aij(5,3)*(x5-x3)^mu+aij(5,4)*(x5-x4)^mu+aij(5,5)*(x5-x5)^mu+aij(5,6)*(x5-x6)^mu)-...
       k2*(aij(5,1)*sign(x5-x1)+aij(5,2)*sign(x5-x2)+aij(5,3)*sign(x5-x3)+aij(5,4)*sign(x5-x4)+aij(5,5)*sign(x5-x5)+aij(5,6)*sign(x5-x6))-...
       k3*(aij(5,1)*(x5-x1)+aij(5,2)*(x5-x2)+aij(5,3)*(x5-x3)+aij(5,4)*(x5-x4)+aij(5,5)*(x5-x5)+aij(5,6)*(x5-x6)));
sys(6)=real(-k1*(aij(6,1)*(x6-x1)^mu+aij(6,2)*(x6-x2)^mu+aij(6,3)*(x6-x3)^mu+aij(6,4)*(x6-x4)^mu+aij(6,5)*(x6-x5)^mu+aij(6,6)*(x6-x6)^mu)-...
       k2*(aij(6,1)*sign(x6-x1)+aij(6,2)*sign(x6-x2)+aij(6,3)*sign(x6-x3)+aij(6,4)*sign(x6-x4)+aij(6,5)*sign(x6-x5)+aij(6,6)*sign(x6-x6))-...
       k3*(aij(6,1)*(x6-x1)+aij(6,2)*(x6-x2)+aij(6,3)*(x6-x3)+aij(6,4)*(x6-x4)+aij(6,5)*(x6-x5)+aij(6,6)*(x6-x6)));












