%函数说明：输入IMF分量，输出改进排列熵
function y=mpe(x)
k=length(x);%信号长度
m=5;        %嵌入维度
permlist=fun5(m);%排序列表
t=1;        %延迟时间
for i=1:k-t*(m-1)
   for j=1:m
       X(i,j)=x(i+t*(j-1));
   end
   S(i,:)=fun_s5(X(i,:));    
end
p=zeros(length(permlist),1);
for i=1:length(permlist)
    c=0;
    for j=1:length(S)
        if permlist(i,:)-S(j,:)==0;
            c=c+1;
        end
    end
    p(i,:)=c/length(S);%得到概率
end
p(find(p==0))=[];
H=-sum(p.*log(p));%求得排列熵
pe=H/log(length(permlist));%排列熵的归一化
y=pe;