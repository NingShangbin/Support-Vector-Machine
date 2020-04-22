function [acc]=mytest(testdata,testlabel,w,b)
[n]=size(testlabel,1);
pre=[];
for i1=1:n
    f=testdata(i1,:)*w+b; %%w是列向量，testdata是行向量
   
    if(f>0)
        pre(i1,1)=1;
    else
        pre(i1,1)=-1;
    end
end
t=testlabel-pre;
tt=find(t==0);
number=size(tt,1);
acc=number/n;