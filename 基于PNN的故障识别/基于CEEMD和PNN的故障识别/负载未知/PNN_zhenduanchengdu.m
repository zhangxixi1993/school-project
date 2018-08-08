clc
clear all
close all
%% 读入特征值
% E0=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\正常数据特征值');
% E1=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\内圈故障特征值');
% E2=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\外圈故障特征值');
% E3=xlsread('E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\轴承故障诊断程序\信号特征提取\小波包AR谱提取特征向量\滚珠故障特征值');
E0=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于CEEMD的特征提取\正常数据');
E1=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于CEEMD的特征提取\内圈故障');
E2=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于CEEMD的特征提取\外圈故障');
E3=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于CEEMD的特征提取\滚珠故障');


%% 训练数据和测试数据
%已经识别出故障类型，并且未知负载，现在开始识别故障程度
type=input('请输入故障类型(1、内圈故障 2、外圈故障 3、滚珠故障)\n');   
%1、故障类型是内圈故障，故障程度分为4种故障直径，选取每种故障直径下60%数据用于建模，其余预测
if type==1
    for i=1:16
        P_train(30*(i-1)+1:30*i,:)=E1(48*(i-1)+1:48*(i-1)+30,:);
        P_test(18*(i-1)+1:18*i,:)=E1(48*(i-1)+31:48*i,:);
    end
    T_train=[ones(1,120),2*ones(1,120),3*ones(1,120),4*ones(1,120)];
    T_test=[ones(1,72),2*ones(1,72),3*ones(1,72),4*ones(1,72)];
end
%2、故障类型是外圈故障，故障程度分为3种故障直径，选取每种故障直径下60%数据用于建模，其余预测
if type==2
    for i=1:12
        P_train(30*(i-1)+1:30*i,:)=E2(48*(i-1)+1:48*(i-1)+30,:);
        P_test(18*(i-1)+1:18*i,:)=E2(48*(i-1)+31:48*i,:);
    end
    T_train=[ones(1,120),2*ones(1,120),3*ones(1,120)];
    T_test=[ones(1,72),2*ones(1,72),3*ones(1,72)];
end     
%3、故障类型是滚珠故障，故障程度分为4种故障直径，选取每种故障直径下60%数据用于建模，其余预测
if type==3
    for i=1:16
        P_train(30*(i-1)+1:30*i,:)=E3(48*(i-1)+1:48*(i-1)+30,:);
        P_test(18*(i-1)+1:18*i,:)=E3(48*(i-1)+31:48*i,:);
    end
    T_train=[ones(1,120),2*ones(1,120),3*ones(1,120),4*ones(1,120)];
    T_test=[ones(1,72),2*ones(1,72),3*ones(1,72),4*ones(1,72)];
end
P_train=P_train';
P_test=P_test';
%% 建立PNN网络进行故障程度识别
%% 将输出转化为矢量
t_train=ind2vec(T_train);
spread=0.01;
net=newpnn(P_train,t_train,spread);%建立PNN
%% 训练网络
y_train=sim(net,P_train);
y1=vec2ind(y_train);%训练输出，矢量转化为指针
figure
i=1:length(y1);
plot(i,y1,'o',i,T_train,'--k')
xlabel('样本')
ylabel('故障程度')
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
i=1:length(y2);
plot(i,y2,'o',i,T_test,'--k')
xlabel('样本')
ylabel('故障程度')
title('测试结果')
legend('模型测试分类结果','实际类别')
disp('测试数据识别失败个数为：')
err2=length(y2)-length(find(y2-T_test==0))
disp('测试数据识别成功率：')
rate2=1-err2/length(y2)
