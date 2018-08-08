%----------已知负载识别故障类型--------
clc
clear all
close all
%% 读入特征值
E0=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值（自带）\正常数据');
E1=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值（自带）\内圈故障');
E2=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值（自带）\外圈故障');
E3=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值（自带）\滚珠故障');
% E0=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\正常数据');
% E1=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\内圈故障');
% E2=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\外圈故障');
% E3=xlsread('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\滚珠故障');
%% 训练数据和测试数据
HP=input('请输入负载（0-3代表0HP-3HP）:');
%已知负载情况下，先识别故障类型
%% 
if HP==0
    P_train1=E0(1:30,:);%正常数据
    P_train2=[E1(1:30,:);E1(193:222,:);E1(385:414,:);E1(577:606,:)];%内圈故障
    P_train3=[E2(1:30,:);E2(193:222,:);E2(385:414,:)];%外圈故障
    P_train4=[E3(1:30,:);E3(193:222,:);E3(385:414,:);E3(577:606,:)];%滚珠故障
    P_train=[P_train1;P_train2;P_train3;P_train4]';
    
    P_test1=E0(31:48,:);%正常数据
    P_test2=[E1(31:48,:);E1(223:240,:);E1(415:432,:);E1(607:624,:)];%内圈故障
    P_test3=[E2(31:48,:);E2(223:240,:);E2(415:432,:)];%外圈故障
    P_test4=[E3(31:48,:);E3(223:240,:);E3(415:432,:);E3(607:624,:)];%滚珠故障
    P_test=[P_test1;P_test2;P_test3;P_test4]';
    
    T_train=[ones(1,30),2*ones(1,120),3*ones(1,90),4*ones(1,120)];
    T_test=[ones(1,18),2*ones(1,72),3*ones(1,54),4*ones(1,72)];
end
%% 
if HP==1
    P_train1=E0(48+1:48+30,:);%正常数据
    P_train2=[E1(48+1:48+30,:);E1(48+193:48+222,:);E1(48+385:48+414,:);E1(48+577:48+606,:)];%内圈故障
    P_train3=[E2(48+1:48+30,:);E2(48+193:48+222,:);E2(48+385:48+414,:)];%外圈故障
    P_train4=[E3(48+1:48+30,:);E3(48+193:48+222,:);E3(48+385:48+414,:);E3(48+577:48+606,:)];%滚珠故障
    P_train=[P_train1;P_train2;P_train3;P_train4]';
    
    P_test1=E0(48+31:48+48,:);%正常数据
    P_test2=[E1(48+31:48+48,:);E1(48+223:48+240,:);E1(48+415:48+432,:);E1(48+607:48+624,:)];%内圈故障
    P_test3=[E2(48+31:48+48,:);E2(48+223:48+240,:);E2(48+415:48+432,:)];%外圈故障
    P_test4=[E3(48+31:48+48,:);E3(48+223:48+240,:);E3(48+415:48+432,:);E3(48+607:48+624,:)];%滚珠故障
    P_test=[P_test1;P_test2;P_test3;P_test4]';
    
    T_train=[ones(1,30),2*ones(1,120),3*ones(1,90),4*ones(1,120)];
    T_test=[ones(1,18),2*ones(1,72),3*ones(1,54),4*ones(1,72)];
end
%% 
if HP==2
    P_train1=E0(96+1:96+30,:);%正常数据
    P_train2=[E1(96+1:96+30,:);E1(96+193:96+222,:);E1(96+385:96+414,:);E1(96+577:96+606,:)];%内圈故障
    P_train3=[E2(96+1:96+30,:);E2(96+193:96+222,:);E2(96+385:96+414,:)];%外圈故障
    P_train4=[E3(96+1:96+30,:);E3(96+193:96+222,:);E3(96+385:96+414,:);E3(96+577:96+606,:)];%滚珠故障
    P_train=[P_train1;P_train2;P_train3;P_train4]';
    
    P_test1=E0(96+31:96+48,:);%正常数据
    P_test2=[E1(96+31:96+48,:);E1(96+223:96+240,:);E1(96+415:96+432,:);E1(96+607:96+624,:)];%内圈故障
    P_test3=[E2(96+31:96+48,:);E2(96+223:96+240,:);E2(96+415:96+432,:)];%外圈故障
    P_test4=[E3(96+31:96+48,:);E3(96+223:96+240,:);E3(96+415:96+432,:);E3(96+607:96+624,:)];%滚珠故障
    P_test=[P_test1;P_test2;P_test3;P_test4]';
    
    T_train=[ones(1,30),2*ones(1,120),3*ones(1,90),4*ones(1,120)];
    T_test=[ones(1,18),2*ones(1,72),3*ones(1,54),4*ones(1,72)];
end
%% 
if HP==3
    P_train1=E0(144+1:144+30,:);%正常数据
    P_train2=[E1(144+1:144+30,:);E1(144+193:144+222,:);E1(144+385:144+414,:);E1(144+577:144+606,:)];%内圈故障
    P_train3=[E2(144+1:144+30,:);E2(144+193:144+222,:);E2(144+385:144+414,:)];%外圈故障
    P_train4=[E3(144+1:144+30,:);E3(144+193:144+222,:);E3(144+385:144+414,:);E3(144+577:144+606,:)];%滚珠故障
    P_train=[P_train1;P_train2;P_train3;P_train4]';
    
    P_test1=E0(144+31:144+48,:);%正常数据
    P_test2=[E1(144+31:144+48,:);E1(144+223:144+240,:);E1(144+415:144+432,:);E1(144+607:144+624,:)];%内圈故障
    P_test3=[E2(144+31:144+48,:);E2(144+223:144+240,:);E2(144+415:144+432,:)];%外圈故障
    P_test4=[E3(144+31:144+48,:);E3(144+223:144+240,:);E3(144+415:144+432,:);E3(144+607:144+624,:)];%滚珠故障
    P_test=[P_test1;P_test2;P_test3;P_test4]';
    
    T_train=[ones(1,30),2*ones(1,120),3*ones(1,90),4*ones(1,120)];
    T_test=[ones(1,18),2*ones(1,72),3*ones(1,54),4*ones(1,72)];
end
%% PNN故障识别
t_train=ind2vec(T_train);%将输出转化为矢量
spread=0.007;
net=newpnn(P_train,t_train,spread);
%% 
y_train=sim(net,P_train);
y1=vec2ind(y_train);%训练输出，矢量转化为指针
figure
i=1:360;
plot(i,y1,'o',i,T_train,'--k')
xlabel('训练样本')
ylabel('故障类型')
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
i=1:216;
plot(i,y2,'o',i,T_test,'--k')
xlabel('测试样本')
ylabel('故障类型')
title('测试结果')
legend('模型测试分类结果','实际类别')
disp('测试数据识别失败个数为：')
err2=length(y2)-length(find(y2-T_test==0))
disp('测试数据识别成功率：')
rate2=1-err2/length(y2)



