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
%% �ų��Ƿ�Ԫ��
f(all(f>1,2),:)=[];%��ȥ����1����
for i=1:size(f,1)   %����ÿһ��
    if length(find(f(i,:)-m==0))>1           %���һ�������ֵ���ֳ���1�Σ����ų�
        f(i,:)=0;
    end
    if length(find(f(i,:)-(m-1)==0))>2       %���һ���ڴδ�ֵ���ֳ���2�Σ����ų�
        f(i,:)=0;
    end
    if length(find(f(i,:)-(m-2)==0))>3       %���һ���ڵ�����ֵ���ֳ���3�Σ����ų�
        f(i,:)=0;
    end
    for j=1:m
        a=find(f(i,:)==j);               %����Ԫ����ͬ���±ֻ꣬��һ��Ԫ����ͬ�����
        if length(a)==2&&a(2)-a(1)>1       %�������Ԫ����ͬ�Ҳ�����
            f(i,:)=0;
        end
        if length(a)==3&&max(a)-min(a)>2   %�������Ԫ����ͬ��������
            f(i,:)=0;
        end
        if length(a)==4&&max(a)-min(a)>3   %����ĸ�Ԫ����ͬ��������
            f(i,:)=0;
        end
        if length(a)==m&&i>1   %�������Ԫ����ͬ
            f(i,:)=0;
        end
    end
    if length(find(f(i,:)==m-1))==2&&(length(find(f(i,:)==m))>0) %�������2��4���ֳ�����5Ҳ�ų�
        f(i,:)=0;
    end
    if length(find(f(i,:)==m-2))==3&&(length(find(f(i,:)==m))>0||length(find(f(i,:)==m-1))>0) %�������3��3���ֳ�����4��5Ҳ�ų�
        f(i,:)=0;
    end
    if length(find(f(i,:)==m-2))==2&&((length(find(f(i,:)==m-1))==2)||(length(find(f(i,:)==m-1))>0&&length(find(f(i,:)==m))>0)) %�������2��3���ֳ�����2��4��1��4��1��5Ҳ�ų�
        f(i,:)=0;
    end
end
f(all(f==0,2),:)=[];
permlist=f;