function [lb,ub,dim,out] = Eng_Apps(Function)

switch Function
    case 'PVD'
        out = @PressureVesselDesign;
        dim=4;
        lb=[0.0625 0.0625 10 10];
        ub=[99*0.0625 99*0.0625 200 200];
    case 'TCSD'
        out = @StringDesign;
        dim=3;
        lb=[0.05 0.25 2];
        ub=[2 1.3 15];
    case '3BT'
        out = @ThreeBarTruss;
        dim=2;
        lb=[0 0];
        ub=[1 1];
    case 'GTD'
        out = @GearTrainDesign;
        dim=4;
        lb=[12 12 12 12];
        ub=[60 60 60 60];
    case 'CB'
        out = @CantileverBeam;
        dim=5;
        lb=[0.01 0.01 0.01 0.01 0.01];
        ub=[100 100 100 100 100];
    case 'WBD'
        out = @WeldedBeam;
        dim=4;
        lb=[0.1 0.1 0.1 0.1 ];
        ub=[2 10 10 2 ];
    case '5SCB'
        out = @FiveStageCantileverBeam;
        dim=10;
        lb=[1 30 2.4 45 2.4 45 1 30 1 30];
        ub=[5 65 3.1 60 3.1 60 5 65 5 65];
     
end
end
function out=PressureVesselDesign(x)

y1=x(:,1);%Ts
y2=x(:,2);%Th
y3=x(:,3);%R
y4=x(:,4);%L
%%% opt
fx=0.6224.*y1.*y3.*y4+...
    1.7781.*y2.*y3.^2+...
    3.1661.*y1.^2.*y4+...
    19.84.*y1.^2.*y3;
%%% const
g(:,1)=-y1+0.0193.*y3;
g(:,2)=-y2+0.0095.*y3;
g(:,3)=-pi.*y3.^2.*y4...
    -(4/3).*pi.*y3.^3 ...
    +1296000;
g(:,4)=y4-240;

%%% Penalty
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp.*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end

out=fx+sum(penalty,2);


end
function out=WeldedBeam(x)
y1=x(:,1);%W
y2=x(:,2);%L
y3=x(:,3);%d
y4=x(:,4);%h
%%% opt
fx=(y2.*1.1047.*y1.^2)+(0.04811.*y3.*y4.*(14+y2));
%%% const
sigm=504000./(y4.*y3.^2);
q=6000*(14+(y2./2));
dim=0.5.*((y2.^2)+(y1+y3).^2).^0.5;
j=2*sqrt(2).*y1.*y2.*((y2.^2./6)+((y1+y3).^2)./2);
delta=65856./(30000.*y4.*y3.^3);
beta=(q.*dim)./j;
alfa=6000./(sqrt(2).*y1.*y2);
toa=(alfa.^2+beta.^2+(alfa.*beta.*y2)./dim).^0.5;
p=(0.61423*10^6).*((y3.*y4.^3)./6).*(1-(y3.*sqrt(y4.^6.*30/48))./28);

g(:,1)=toa-13600;
g(:,2)=sigm-30000;
g(:,3)=y1-y4;
g(:,4)=(0.1047.*y1.^2.*y2)+(0.04811.*y4.*y3.*(14+y2))-5;
g(:,5)=0.125-y1;
g(:,6)=delta-0.25;
g(:,7)=6000-p;
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp.*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end

out=fx+sum(penalty,2);

end

function out=StringDesign(x)

y1=x(1);%W
y2=x(2);%d
y3=x(3);%N
%%% opt
fx=(y3+2)*y2*((y1)^2);
%%% const
g(1)=1-((y2^3*(y3))/(71785*(y1^4)));
g(2)=((4*(y2^2)-(y1*y2))/(12566*(y2*(y1^3)-(y1^4))))+(1/(5108*(y1^2)))-1;
g(3)=1-(140.45*y1/((y2^2)*y3));
g(4)=((y1+y2)/1.5)-1;
%%% Penalty
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end
%out=fx;
out=fx+sum(penalty,2);

end
function out=ThreeBarTruss(x)

A1=x(:,1);
A2=x(:,2);
%%%opt
fx=(2*sqrt(2).*A1+A2).*100;
%%% const
g(:,1)=2.*(sqrt(2).*A1+A2)./...
    (sqrt(2).*A1.^2+2.*A1.*A2)-2;
g(:,2)=2.*A2./(sqrt(2).*A1.^2+...
    2.*A1.*A2)-2;
g(:,3)=2./(A1+sqrt(2).*A2)-2;
%%% Penalty
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp.*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end

out=fx+sum(penalty,2);

end
function out=GearTrainDesign(x)

y1=x(:,1);%A
y2=x(:,2);%B
y3=x(:,3);%C
y4=x(:,4);%D
%%% opt
fx=((1/6.931)-((y1.*y2)./(y3.*y4))).^2;
out=fx;
end
function out=CantileverBeam(x)
y1=x(:,1);%1
y2=x(:,2);%2
y3=x(:,3);%3
y4=x(:,4);%4
y5=x(:,5);%5
%%% opt
fx=0.0624.*(y1+y2+y3+y4+y5);
%%%% const
g(:,1)=(61./y1.^3)+(37./y2.^3)+(19./y3.^3)+(7./y4.^3)+(1./y5.^3)-1;
%%% Penalty
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp.*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end

out=fx+sum(penalty,2);

end

function out=FiveStageCantileverBeam(x)
y1=x(:,1);%1
y2=x(:,2);%2
y3=x(:,3);%3
y4=x(:,4);%4
y5=x(:,5);%5
y6=x(:,6);%6
y7=x(:,7);%7
y8=x(:,8);%8
y9=x(:,9);%9
y10=x(:,10);%10
%%% other parameters
L = 500; %Total beam length cm
l = 100; %Length of the individual section cm
P = 50000; %Load N
delta = 2.7; % maximum deflection of beam cm
sigma = 14000; % allowable stress in each section N/cm2
E = 20000000; %youngs modulus N/cm2
%%% opt
fx=l.*(y1.*y2+y3.*y4+y5.*y6+y7.*y8+y9.*y10);
%%%% const
g(:,1)=(6*P*l)./(y9.*y10.^2)-sigma;
g(:,2)=(6*P*2*l)./(y7.*y8.^2)-sigma;
g(:,3)=(6*P*3*l)./(y5.*y6.^2)-sigma;
g(:,4)=(6*P*4*l)./(y3.*y4.^2)-sigma;
g(:,5)=(6*P*5*l)./(y1.*y2.^2)-sigma;
g(:,6)=((P*l^3)/E).*((244/(y1.*y2.^3))+(148./(y3.*y4.^3))+(76./(y5.*y6.^3))+(28./(y7.*y8.^3))+(4./(y9.*y10.^3)))-delta;
g(:,7)=(y2./y1)-20;
g(:,8)=(y4./y3)-20;
g(:,9)=(y6./y5)-20;
g(:,10)=(y8./y7)-20;
g(:,11)=(y10./y9)-20;

%%% Penalty
pp=10^9;
for i=1:size(g,1)
    for j=1:size(g,2)
        if g(i,j)>0
            penalty(i,j)=pp.*g(i,j);
        else
            penalty(i,j)=0;
        end
    end
end

out=fx+sum(penalty,2);

end