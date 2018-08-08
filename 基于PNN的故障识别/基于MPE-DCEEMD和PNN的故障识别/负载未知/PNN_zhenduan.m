clc
clear all
close all
%% 读入特征值
% E0=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\正常数据特征值');
% E1=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\内圈故障特征值');
% E2=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\外圈故障特征值');
% E3=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\滚珠故障特征值');

E0=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于MPE-DCEEMD的特征提取\正常数据');
E1=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于MPE-DCEEMD的特征提取\内圈故障');
E2=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于MPE-DCEEMD的特征提取\外圈故障');
E3=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于MPE-DCEEMD的特征提取\滚珠故障');
%% 训练数据和测试数据
%未知负载和故障程度,先识别故障类型
%所有数据共48种状态，提取各个状态30组进行训练，其余用于测试
for i=1:4
    P_train1(30*(i-1)+1:30*i,:)=E0(48*(i-1)+1:48*(i-1)+30,:);
    P_test1(18*(i-1)+1:18*i,:)=E0(48*(i-1)+31:48*i,:);
end
for i=1:16
    P_train2(30*(i-1)+1:30*i,:)=E1(48*(i-1)+1:48*(i-1)+30,:);
    P_test2(18*(i-1)+1:18*i,:)=E1(48*(i-1)+31:48*i,:);
end
for i=1:12
    P_train3(30*(i-1)+1:30*i,:)=E2(48*(i-1)+1:48*(i-1)+30,:);
    P_test3(18*(i-1)+1:18*i,:)=E2(48*(i-1)+31:48*i,:);
end
for i=1:16
    P_train4(30*(i-1)+1:30*i,:)=E3(48*(i-1)+1:48*(i-1)+30,:);
    P_test4(18*(i-1)+1:18*i,:)=E3(48*(i-1)+31:48*i,:);
end
P_train=[P_train1;P_train2;P_train3;P_train4]';
P_test=[P_test1;P_test2;P_test3;P_test4]';
T_train=[ones(120,1);2*ones(480,1);3*ones(360,1);4*ones(480,1)]';
T_test=[ones(72,1);2*ones(288,1);3*ones(216,1);4*ones(288,1)]';

%% 
t_train=ind2vec(T_train);%将输出转化为矢量
spread=0.006;
net=newpnn(P_train,t_train,spread);
%% 
y_train=sim(net,P_train);
y1=vec2ind(y_train);%训练输出，矢量转化为指针
figure
i=1:1440;
plot(i,y1,'o',i,T_train,'--k')
xlabel('样本')
ylabel('类别')
title('训练结果')
legend('模型训练分类结果','实际类别')
disp('训练数据识别失败个数为：')
err1=length(y1)-length(find(y1-T_train==0))
disp('训练数据识别成功率：')
rate1=1-err1/length(y1)

%% 测试
y_test=sim(net,P_test);
y2=vec2ind(y_test);
figure
i=1:864;
plot(i,y2,'o',i,T_test,'--k')
xlabel('样本')
ylabel('类别')
title('测试结果')
legend('模型测试分类结果','实际类别')
disp('测试数据识别失败个数为：')
err2=length(y2)-length(find(y2-T_test==0))
disp('测试数据识别成功率：')
rate2=1-err2/length(y2)



