function permlist=fun5(m)
for i=1:m
    a(1)=i;
    for j=1:m
        a(2)=j;
        for k=1:m
            a(3)=k;
            for l=1:m
                a(4)=l;
                for p=1:m
                    a(5)=p;
                    b(p,:)=a;
                end
                c((l-1)*m+1:l*m,:)=b;
            end
            d((k-1)*m^2+1:k*m^2,:)=c;
        end
        e((j-1)*m^3+1:j*m^3,:)=d;
    end
    f((i-1)*m^4+1:i*m^4,:)=e;
end
%% 排除非法元素
f(all(f>1,2),:)=[];%除去不含1的行
for i=1:size(f,1)   %遍历每一行
    if length(find(f(i,:)-m==0))>1           %如果一行内最大值出现超过1次，则排除
        f(i,:)=0;
    end
    if length(find(f(i,:)-(m-1)==0))>2       %如果一行内次大值出现超过2次，则排除
        f(i,:)=0;
    end
    if length(find(f(i,:)-(m-2)==0))>3       %如果一行内第三大值出现超过3次，则排除
        f(i,:)=0;
    end
    for j=1:m
        a=find(f(i,:)==j);               %此行元素相同的下标，只有一种元素相同的情况
        if length(a)==2&&a(2)-a(1)>1       %如果两个元素相同且不连续
            f(i,:)=0;
        end
        if length(a)==3&&max(a)-min(a)>2   %如果三个元素相同但不连续
            f(i,:)=0;
        end
        if length(a)==4&&max(a)-min(a)>3   %如果四个元素相同但不连续
            f(i,:)=0;
        end
        if length(a)==m&&i>1   %如果所有元素相同
            f(i,:)=0;
        end
    end
    if length(find(f(i,:)==m-1))==2&&(length(find(f(i,:)==m))>0) %如果出现2个4但又出现了5也排除
        f(i,:)=0;
    end
    if length(find(f(i,:)==m-2))==3&&(length(find(f(i,:)==m))>0||length(find(f(i,:)==m-1))>0) %如果出现3个3但又出现了4或5也排除
        f(i,:)=0;
    end
    if length(find(f(i,:)==m-2))==2&&((length(find(f(i,:)==m-1))==2)||(length(find(f(i,:)==m-1))>0&&length(find(f(i,:)==m))>0)) %如果出现2个3但又出现了2个4或1个4和1个5也排除
        f(i,:)=0;
    end
end
f(all(f==0,2),:)=[];
permlist=f;