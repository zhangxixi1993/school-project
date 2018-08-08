clc
clear all
close all
tic
N=120000;         %截取数据长度
%--------数据说明——————————
%第一个数字代表故障直径的四种类型，第二个数字代表负载数，所有类型数据选取120000个样本
%% 正常数据
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\正常数据\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\正常数据\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\正常数据\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\正常数据\HP3.mat
N0=X097_DE_time(1:N);  %0负载正常数据
N1=X098_DE_time(1:N);  %1负载正常数据
N2=X099_DE_time(1:N);  %2负载正常数据
N3=X100_DE_time(1:N);  %3负载正常数据
%% 内圈故障
%故障直径0.007
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.007\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.007\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.007\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.007\HP3.mat
in_1_0=X105_DE_time(1:N);  %0负载故障数据
in_1_1=X106_DE_time(1:N);  %1负载故障数据
in_1_2=X107_DE_time(1:N);  %2负载故障数据
in_1_3=X108_DE_time(1:N);  %3负载故障数据

%故障直径0.014
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.014\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.014\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.014\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.014\HP3.mat
in_2_0=X169_DE_time(1:N);  %0负载故障数据
in_2_1=X170_DE_time(1:N);  %1负载故障数据
in_2_2=X171_DE_time(1:N);  %2负载故障数据
in_2_3=X172_DE_time(1:N);  %3负载故障数据

%故障直径0.021
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.021\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.021\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.021\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.021\HP3.mat
in_3_0=X209_DE_time(1:N);  %0负载故障数据
in_3_1=X210_DE_time(1:N);  %1负载故障数据
in_3_2=X211_DE_time(1:N);  %2负载故障数据
in_3_3=X212_DE_time(1:N);  %3负载故障数据

%故障直径0.028
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.028\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.028\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.028\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\内圈故障\故障直径0.028\HP3.mat
in_4_0=X056_DE_time(1:N);  %0负载故障数据
in_4_1=X057_DE_time(1:N);  %1负载故障数据
in_4_2=X058_DE_time(1:N);  %2负载故障数据
in_4_3=X059_DE_time(1:N);  %3负载故障数据

%% 外圈故障
%故障直径0.007
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.007\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.007\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.007\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.007\HP3.mat
out_1_0=X130_DE_time(1:N);  %0负载故障数据
out_1_1=X131_DE_time(1:N);  %1负载故障数据
out_1_2=X132_DE_time(1:N);  %2负载故障数据
out_1_3=X133_DE_time(1:N);  %3负载故障数据

%故障直径0.007
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.014\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.014\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.014\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.014\HP3.mat
out_2_0=X197_DE_time(1:N);  %0负载故障数据
out_2_1=X198_DE_time(1:N);  %1负载故障数据
out_2_2=X199_DE_time(1:N);  %2负载故障数据
out_2_3=X200_DE_time(1:N);  %3负载故障数据

%故障直径0.021
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.021\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.021\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.021\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\外圈故障\故障直径0.021\HP3.mat
out_3_0=X234_DE_time(1:N);  %0负载故障数据
out_3_1=X235_DE_time(1:N);  %1负载故障数据
out_3_2=X236_DE_time(1:N);  %2负载故障数据
out_3_3=X237_DE_time(1:N);  %3负载故障数据

%% 滚珠故障
%故障直径0.007
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.007\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.007\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.007\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.007\HP3.mat
ball_1_0=X118_DE_time(1:N);  %0负载故障数据
ball_1_1=X119_DE_time(1:N);  %1负载故障数据
ball_1_2=X120_DE_time(1:N);  %2负载故障数据
ball_1_3=X121_DE_time(1:N);  %3负载故障数据

%故障直径0.014
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.014\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.014\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.014\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.014\HP3.mat
ball_2_0=X185_DE_time(1:N);  %0负载故障数据
ball_2_1=X186_DE_time(1:N);  %1负载故障数据
ball_2_2=X187_DE_time(1:N);  %2负载故障数据
ball_2_3=X188_DE_time(1:N);  %3负载故障数据

%故障直径0.021
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.021\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.021\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.021\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.021\HP3.mat
ball_3_0=X222_DE_time(1:N);  %0负载故障数据
ball_3_1=X223_DE_time(1:N);  %1负载故障数据
ball_3_2=X224_DE_time(1:N);  %2负载故障数据
ball_3_3=X225_DE_time(1:N);  %3负载故障数据

%故障直径0.028
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.028\HP0.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.028\HP1.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.028\HP2.mat
load E:\毕业课题\我的进展\美国凯斯西储大学轴承数据\滚珠故障\故障直径0.028\HP3.mat
ball_4_0=X048_DE_time(1:N);  %0负载故障数据
ball_4_1=X049_DE_time(1:N);  %1负载故障数据
ball_4_2=X050_DE_time(1:N);  %2负载故障数据
ball_4_3=X051_DE_time(1:N);  %3负载故障数据
%% 数据载入完毕
%% 信号分割
%分割正常数据信号
k=2500;
Ndata0=zeros(48,k);
for i=1:48
    Ndata0(i,:)=N0(1+(i-1)*k:i*k)';   %0负载
end

Ndata1=zeros(48,k);
for i=1:48
    Ndata1(i,:)=N1(1+(i-1)*k:i*k)';   %1负载
end

Ndata2=zeros(48,k);
for i=1:48
    Ndata2(i,:)=N2(1+(i-1)*k:i*k)';   %2负载
end

Ndata3=zeros(48,k);
for i=1:48
    Ndata3(i,:)=N3(1+(i-1)*k:i*k)';   %3负载
end
%故障信号分割
%分割内圈故障信号
%故障直径0.007
Idata_1_0=zeros(48,k);
for i=1:48
    Idata_1_0(i,:)=in_1_0(1+(i-1)*k:i*k)';   %0负载
end

Idata_1_1=zeros(48,k);
for i=1:48
    Idata_1_1(i,:)=in_1_1(1+(i-1)*k:i*k)';   %1负载
end

Idata_1_2=zeros(48,k);
for i=1:48
    Idata_1_2(i,:)=in_1_2(1+(i-1)*k:i*k)';   %2负载
end

Idata_1_3=zeros(48,k);
for i=1:48
    Idata_1_3(i,:)=in_1_3(1+(i-1)*k:i*k)';   %3负载
end
%故障直径0.014
Idata_2_0=zeros(48,k);
for i=1:48
    Idata_2_0(i,:)=in_2_0(1+(i-1)*k:i*k)';   %0负载
end

Idata_2_1=zeros(48,k);
for i=1:48
    Idata_2_1(i,:)=in_2_1(1+(i-1)*k:i*k)';   %1负载
end

Idata_2_2=zeros(48,k);
for i=1:48
    Idata_2_2(i,:)=in_2_2(1+(i-1)*k:i*k)';   %2负载
end

Idata_2_3=zeros(48,k);
for i=1:48
    Idata_2_3(i,:)=in_2_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.021
Idata_3_0=zeros(48,k);
for i=1:48
    Idata_3_0(i,:)=in_3_0(1+(i-1)*k:i*k)';   %0负载
end

Idata_3_1=zeros(48,k);
for i=1:48
    Idata_3_1(i,:)=in_3_1(1+(i-1)*k:i*k)';   %1负载
end

Idata_3_2=zeros(48,k);
for i=1:48
    Idata_3_2(i,:)=in_3_2(1+(i-1)*k:i*k)';   %2负载
end

Idata_3_3=zeros(48,k);
for i=1:48
    Idata_3_3(i,:)=in_3_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.028
Idata_4_0=zeros(48,k);
for i=1:48
    Idata_4_0(i,:)=in_4_0(1+(i-1)*k:i*k)';   %0负载
end

Idata_4_1=zeros(48,k);
for i=1:48
    Idata_4_1(i,:)=in_4_1(1+(i-1)*k:i*k)';   %1负载
end

Idata_4_2=zeros(48,k);
for i=1:48
    Idata_4_2(i,:)=in_4_2(1+(i-1)*k:i*k)';   %2负载
end

Idata_4_3=zeros(48,k);
for i=1:48
    Idata_4_3(i,:)=in_4_3(1+(i-1)*k:i*k)';   %3负载
end

%分割外圈故障信号
%故障直径0.007
outdata_1_0=zeros(48,k);
for i=1:48
    outdata_1_0(i,:)=out_1_0(1+(i-1)*k:i*k)';   %0负载
end

outdata_1_1=zeros(48,k);
for i=1:48
    outdata_1_1(i,:)=out_1_1(1+(i-1)*k:i*k)';   %1负载
end

outdata_1_2=zeros(48,k);
for i=1:48
    outdata_1_2(i,:)=out_1_2(1+(i-1)*k:i*k)';   %2负载
end

outdata_1_3=zeros(48,k);
for i=1:48
    outdata_1_3(i,:)=out_1_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.014
outdata_2_0=zeros(48,k);
for i=1:48
    outdata_2_0(i,:)=out_2_0(1+(i-1)*k:i*k)';   %0负载
end

outdata_2_1=zeros(48,k);
for i=1:48
    outdata_2_1(i,:)=out_2_1(1+(i-1)*k:i*k)';   %1负载
end

outdata_2_2=zeros(48,k);
for i=1:48
    outdata_2_2(i,:)=out_2_2(1+(i-1)*k:i*k)';   %2负载
end

outdata_2_3=zeros(48,k);
for i=1:48
    outdata_2_3(i,:)=out_2_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.021
outdata_3_0=zeros(48,k);
for i=1:48
    outdata_3_0(i,:)=out_3_0(1+(i-1)*k:i*k)';   %0负载
end

outdata_3_1=zeros(48,k);
for i=1:48
    outdata_3_1(i,:)=out_3_1(1+(i-1)*k:i*k)';   %1负载
end

outdata_3_2=zeros(48,k);
for i=1:48
    outdata_3_2(i,:)=out_3_2(1+(i-1)*k:i*k)';   %2负载
end

outdata_3_3=zeros(48,k);
for i=1:48
    outdata_3_3(i,:)=out_3_3(1+(i-1)*k:i*k)';   %3负载
end

%分割滚珠故障信号
%故障直径0.007
balldata_1_0=zeros(48,k);
for i=1:48
    balldata_1_0(i,:)=ball_1_0(1+(i-1)*k:i*k)';   %0负载
end

balldata_1_1=zeros(48,k);
for i=1:48
    balldata_1_1(i,:)=ball_1_1(1+(i-1)*k:i*k)';   %1负载
end

balldata_1_2=zeros(48,k);
for i=1:48
    balldata_1_2(i,:)=ball_1_2(1+(i-1)*k:i*k)';   %2负载
end

balldata_1_3=zeros(48,k);
for i=1:48
    balldata_1_3(i,:)=ball_1_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.014
balldata_2_0=zeros(48,k);
for i=1:48
    balldata_2_0(i,:)=ball_2_0(1+(i-1)*k:i*k)';   %0负载
end

balldata_2_1=zeros(48,k);
for i=1:48
    balldata_2_1(i,:)=ball_2_1(1+(i-1)*k:i*k)';   %1负载
end

balldata_2_2=zeros(48,k);
for i=1:48
    balldata_2_2(i,:)=ball_2_2(1+(i-1)*k:i*k)';   %2负载
end

balldata_2_3=zeros(48,k);
for i=1:48
    balldata_2_3(i,:)=ball_2_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.021
balldata_3_0=zeros(48,k);
for i=1:48
    balldata_3_0(i,:)=ball_3_0(1+(i-1)*k:i*k)';   %0负载
end

balldata_3_1=zeros(48,k);
for i=1:48
    balldata_3_1(i,:)=ball_3_1(1+(i-1)*k:i*k)';   %1负载
end

balldata_3_2=zeros(48,k);
for i=1:48
    balldata_3_2(i,:)=ball_3_2(1+(i-1)*k:i*k)';   %2负载
end

balldata_3_3=zeros(48,k);
for i=1:48
    balldata_3_3(i,:)=ball_3_3(1+(i-1)*k:i*k)';   %3负载
end

%故障直径0.028
balldata_4_0=zeros(48,k);
for i=1:48
    balldata_4_0(i,:)=ball_4_0(1+(i-1)*k:i*k)';   %0负载
end

balldata_4_1=zeros(48,k);
for i=1:48
    balldata_4_1(i,:)=ball_4_1(1+(i-1)*k:i*k)';   %1负载
end

balldata_4_2=zeros(48,k);
for i=1:48
    balldata_4_2(i,:)=ball_4_2(1+(i-1)*k:i*k)';   %2负载
end

balldata_4_3=zeros(48,k);
for i=1:48
    balldata_4_3(i,:)=ball_4_3(1+(i-1)*k:i*k)';   %3负载
end

%% 对正常数据进行eemd
Ndata=[Ndata0;Ndata1;Ndata2;Ndata3];%所有正常数据
for i=1:size(Ndata,1)
    disp(['正在计算正常数据第',num2str(i),'个子样本的改进排列熵']);
    imf=ceemd(Ndata(i,:));
    for j=1:size(imf,1)
        pe(i,j)=mpe(imf(j,:));
    end
end
xlswrite('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值\正常数据',pe)
%% 对内圈故障数据进行eemd
INdata=[Idata_1_0;Idata_1_1;Idata_1_2;Idata_1_3;...
        Idata_2_0;Idata_2_1;Idata_2_2;Idata_2_3;...
        Idata_3_0;Idata_3_1;Idata_3_2;Idata_3_3;...
        Idata_4_0;Idata_4_1;Idata_4_2;Idata_4_3];%所有内圈故障数据
for i=1:size(INdata,1)
    disp(['正在计算内圈故障数据第',num2str(i),'个子样本的改进排列熵']);    
    imf=ceemd(INdata(i,:));
    for j=1:size(imf,1)
        pe1(i,j)=mpe(imf(j,:));
    end
end

xlswrite('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值\内圈故障',pe1)
%% 对内圈故障数据进行eemd
OUTdata=[outdata_1_0;outdata_1_1;outdata_1_2;outdata_1_3;...
         outdata_2_0;outdata_2_1;outdata_2_2;outdata_2_3;...
         outdata_3_0;outdata_3_1;outdata_3_2;outdata_3_3];%所有外圈故障数据
for i=1:size(OUTdata,1)
        disp(['正在计算外圈故障数据第',num2str(i),'个子样本的改进排列熵']);
    imf=ceemd(OUTdata(i,:));
    for j=1:size(imf,1)
        pe2(i,j)=mpe(imf(j,:));
    end
end
xlswrite('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值\外圈故障',pe2)
%% 对滚珠故障数据进行eemd
BALLdata=[balldata_1_0;balldata_1_1;balldata_1_2;balldata_1_3;...
          balldata_2_0;balldata_2_1;balldata_2_2;balldata_2_3;...
          balldata_3_0;balldata_3_1;balldata_3_2;balldata_3_3;...
          balldata_4_0;balldata_4_1;balldata_4_2;balldata_4_3]; 
for i=1:size(BALLdata,1)
        disp(['正在计算滚珠故障数据第',num2str(i),'个子样本的改进排列熵']);
    imf=ceemd(BALLdata(i,:));
    for j=1:size(imf,1)
        pe3(i,j)=mpe(imf(j,:));
    end
end
xlswrite('E:\毕业课题\我的进展\课题的改进算法研究\EMD和改进EMD的分类结果对比\基于EEMD的特征提取\备用EEMD特征值\滚珠故障',pe3)
toc

