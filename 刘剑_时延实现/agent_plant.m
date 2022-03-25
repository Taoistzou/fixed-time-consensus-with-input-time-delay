function [sys,x0,str,ts]=agent_plant(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 6;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[5 0 4 9 -3 2];
str=[];
ts=[0 0];
function sys=mdlDerivatives(t,x,u)


% sys(1)=u(1)+0.2*cos(x(1));
% sys(2)=u(2)+0.2*cos(x(2));
% sys(3)=u(3)+0.2*cos(x(3));
% sys(4)=u(4)+0.2*cos(x(4));
% sys(5)=u(5)+0.2*cos(x(5));
% sys(6)=u(6)+0.2*cos(x(6));

sys(1)=u(1);
sys(2)=u(2);
sys(3)=u(3);
sys(4)=u(4);
sys(5)=u(5);
sys(6)=u(6);



function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
sys(5)=x(5);
sys(6)=x(6);






