function [alpha,w,b]=my(X,e,c,D)
D=blkdiag(eye(40),-eye(40));%等于diag（Ytrain） 
HH=D*(X*X')*D;
HH=(HH+HH')/2;
f=-e;%%(110*1)
A=[];
B=[];
Aeq=e'*D;%%(1*110)
n=size(e,1);%%n=110
Beq=0;%%
%n=size(e,1); %和上面重复了。
xm=zeros(n,1);
Xm=c*ones(n,1);
opt=optimset('LargeScale', 'off', 'Algorithm', 'active-set','display','off');
[alpha]=quadprog(HH,f,A,B,Aeq,Beq,xm,Xm,[],opt);  %%二次规划函数调用
w=X'*D*alpha;
epsilon=1e-12; %%定义一个测度，凡是小于10^-12都认为是0
[id]=find(alpha>=epsilon); %id是alpha中所有非零元素的下标
x1=id(1); %x1就是取alpha中第一个正分量的下标
b=D(x1)-X(x1,:)*w;

