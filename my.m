function [alpha,w,b]=my(X,e,c,D)
D=blkdiag(eye(40),-eye(40));%����diag��Ytrain�� 
HH=D*(X*X')*D;
HH=(HH+HH')/2;
f=-e;%%(110*1)
A=[];
B=[];
Aeq=e'*D;%%(1*110)
n=size(e,1);%%n=110
Beq=0;%%
%n=size(e,1); %�������ظ��ˡ�
xm=zeros(n,1);
Xm=c*ones(n,1);
opt=optimset('LargeScale', 'off', 'Algorithm', 'active-set','display','off');
[alpha]=quadprog(HH,f,A,B,Aeq,Beq,xm,Xm,[],opt);  %%���ι滮��������
w=X'*D*alpha;
epsilon=1e-12; %%����һ����ȣ�����С��10^-12����Ϊ��0
[id]=find(alpha>=epsilon); %id��alpha�����з���Ԫ�ص��±�
x1=id(1); %x1����ȡalpha�е�һ�����������±�
b=D(x1)-X(x1,:)*w;

