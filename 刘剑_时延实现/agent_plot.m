close all;

figure(1);
plot(t,y(:,[1 2 3 4 5 6]),'--','linewidth',2)
legend('x1','x2','x3','x4','x5','x6','FontSize',12);
xlabel('time(s)');ylabel('x_{i}(t)');
grid on

figure(2)
plot(t,ut(:,[1 2 3 4 5 6]),'linewidth',1.5)
xlabel('time(s)');ylabel('u_{i}(t)');
legend('u1','u2','u3','u4','u5','u6','FontSize',12);
grid on






