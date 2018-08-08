%----此函数用来求一组6维序列的排序序列号----基于改进的排列熵
function s=fun_s5(a)
x1=find(a==a(1));
x2=find(a==a(2));
x3=find(a==a(3));
x4=find(a==a(4));
x5=find(a==a(5));

c=min(x1);
x1=c*ones(1,length(x1));
[a1,s]=sort(a);
index=find(s==c);
s(index:index+length(x1)-1)=x1;

c=min(x2);
x2=c*ones(1,length(x2));
index=find(s==c);
s(index:index+length(x2)-1)=x2;

c=min(x3);
x3=c*ones(1,length(x3));
index=find(s==c);
s(index:index+length(x3)-1)=x3;

c=min(x4);
x4=c*ones(1,length(x4));
index=find(s==c);
s(index:index+length(x4)-1)=x4;

c=min(x5);
x5=c*ones(1,length(x5));
index=find(s==c);
s(index:index+length(x5)-1)=x5;


