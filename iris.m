%%%后10个用于测试，那么就交换行顺序。
clear;
clc;
load('iris.mat');

data=data(51:end,:);%取后2类用。
label=[ones(50,1);-ones(50,1)];
A=data(1:50,:);%A=data(1:59,:);
B=data(51:100,:);%B=data(60:130,:);
AA=A;
BB=B;
trainacc(5,1)=0;
for ii=1:5

    A1=AA(41:50,:);%A1=AA(50:59,:);
    A2=AA(1:40,:);%A2=AA(1:49,:);
    AA=[A1;A2];
    B1=BB(41:50,:);%B1=BB(62:71,:);
    B2=BB(1:40,:);%B2=BB(1:61,:);
    BB=[B1;B2];
    data1=[AA;BB];
    [acc]=SVMiris(label,data1);
    trainacc(ii,1)=acc;
end
varacc=100*var(trainacc)%%方差
acc=100*mean(trainacc)%%均值