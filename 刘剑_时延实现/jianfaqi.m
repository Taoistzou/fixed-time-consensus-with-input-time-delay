function [sys,x0,str,ts] = jianfaqi(t,x,u,flag)
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




u_1=u(1);
u_2=u(2);
u_3=u(3);
u_4=u(4);
u_5=u(5);
u_6=u(6);

u_1tao=u(1+6);
u_2tao=u(2+6);
u_3tao=u(3+6);
u_4tao=u(4+6);
u_5tao=u(5+6);
u_6tao=u(6+6);


u1=u_1-u_1tao;
u2=u_2-u_2tao;
u3=u_3-u_3tao;
u4=u_4-u_4tao;
u5=u_5-u_5tao;
u6=u_6-u_6tao;

sys(1)=u1;
sys(2)=u2;
sys(3)=u3;
sys(4)=u4;
sys(5)=u5;
sys(6)=u6;
















