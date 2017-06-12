function taskB(intervalStarts,intervalEnds,h)

%%% ode45 solver

disp('Time for ode45');
tic
[t,Y45] = ode45(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(1,3,1);
plot(t,Y45(:,1),'r',t,Y45(:,2),'g',t,Y45(:,3),'b');
legend('y_1 ode45','y_2 ode45','y_3 ode45');

%%% ode23 solver

disp('Time for ode23');
tic
[t,Y23] = ode23(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(1,3,2);
plot(t,Y23(:,1),'r',t,Y23(:,2),'g',t,Y23(:,3),'b');
legend('y_1 ode23','y_2 ode23','y_3 ode23');

%%% rk4 solver

disp('Time for rk4');
tic
[t,YRK4] = rk4(intervalStarts,intervalEnds,h);
toc

subplot(1,3,3);
plot(t,YRK4(:,1),'r',t,YRK4(:,2),'g',t,YRK4(:,3),'b');
legend('y_1 rk4','y_2 rk4','y_3 rk4');

% semilogx - if needed, there is a logaritmic plot option too

end

function dYdt = HRobertson(t,Y)

alpha=0.04;
beta=1e4;
gamma=3e7;

dYdt = [-alpha*Y(1) + beta*Y(2)*Y(3);
         alpha*Y(1) - beta*Y(2)*Y(3) - gamma*Y(2)^2;
         gamma*Y(2)^2];
     
end