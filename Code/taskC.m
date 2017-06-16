function taskC(intervalStarts,intervalEnds)

%%% ode15s solver

disp('Time for ode15s');
tic
[t,Y15S] = ode15s(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(2,2,1);
semilogx(t,Y15S(:,1),'b',t,Y15S(:,2),'r',t,Y15S(:,3),'g');
legend('y_1 ode15s','y_2 ode15s','y_3 ode15s');

%%% ode23s solver

disp('Time for ode23s');
tic
[t,Y23S] = ode23s(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(2,2,2);
semilogx(t,Y23S(:,1),'b',t,Y23S(:,2),'r',t,Y23S(:,3),'g');
legend('y_1 ode23s','y_2 ode23s','y_3 ode23s');

%%% ode23t solver

disp('Time for ode23t');
tic
[t,Y23T] = ode23t(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(2,2,3);
semilogx(t,Y23T(:,1),'b',t,Y23T(:,2),'r',t,Y23T(:,3),'g');
legend('y_1 ode23t','y_2 ode23t','y_3 ode23t');

%%% ode23tb solver

disp('Time for ode23tb');
tic
[t,Y23TB] = ode23tb(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
toc

subplot(2,2,4);
semilogx(t,Y23TB(:,1),'b',t,Y23TB(:,2),'r',t,Y23TB(:,3),'g');
legend('y_1 ode23tb','y_2 ode23tb','y_3 ode23tb');

%%% ode45 solver - just for fun

% disp('Time for ode45');
% tic
% [t,Y45] = ode45(@HRobertson,[intervalStarts,intervalEnds],[1;0;0]);
% toc
% 
% subplot(2,2,4);
% semilogx(t,Y45(:,1),'b',t,Y45(:,2),'r',t,Y45(:,3),'g');
% legend('y_1 ode45','y_2 ode45','y_3 ode45');

end

function dYdt = HRobertson(t,Y)

alpha=0.04;
beta=1e4;
gamma=3e7;

dYdt = [-alpha*Y(1) + beta*Y(2)*Y(3);
         alpha*Y(1) - beta*Y(2)*Y(3) - gamma*Y(2)^2;
         gamma*Y(2)^2];
     
end