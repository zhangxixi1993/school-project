%����˵��������IMF����������Ľ�������
function y=mpe(x)
k=length(x);%�źų���
m=5;        %Ƕ��ά��
permlist=fun5(m);%�����б�
t=1;        %�ӳ�ʱ��
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
    p(i,:)=c/length(S);%�õ�����
end
p(find(p==0))=[];
H=-sum(p.*log(p));%���������
pe=H/log(length(permlist));%�����صĹ�һ��
y=pe;