function [t,y]=rk4(tstarts,tends,h)

N=(tends-tstarts)/h;
t(1)=tstarts;
y=zeros(3,N);
y(:,1)=[1,0,0];

for i=1:N-1
    
    t(i+1)=t(i)+h;
 
    Y1 = y(:,i);
    Y2 = y(:,i) + h/2 * HRobertson(t(i)       ,Y1);
    Y3 = y(:,i) + h/2 * HRobertson(t(i) + h/2 ,Y2);
    Y4 = y(:,i) +  h  * HRobertson(t(i) + h/2 ,Y3);
    
    y(:,i+1) = y(:,i) + (h/6) * (HRobertson(t(i)    ,Y1) +...
                             2 * HRobertson(t(i)+h/2,Y2) +...
                             2 * HRobertson(t(i)+h/2,Y3) +...
                                 HRobertson(t(i)+ h ,Y4));
end

y=y';

end


function dYdt = HRobertson(t,Y)

alpha=0.04;
beta=1e4;
gamma=3e7;

dYdt = [-alpha*Y(1) + beta*Y(2)*Y(3);
         alpha*Y(1) - beta*Y(2)*Y(3) - gamma*Y(2)^2;
         gamma*Y(2)^2];
     
end
