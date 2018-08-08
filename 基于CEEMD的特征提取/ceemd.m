function IMF=ceemd(x)
n=2500;
%% eemd分解
M=200;
a=0.1*std(x);
IMF=zeros(6,n);
IMF2=zeros(6,n);
for i=1:M
    noise=wgn(1,n,a);
    X=x+noise;
    imf=emd(X);
    IMF=IMF+imf(1:6,:); 
    X1=x-noise;
    imf1=emd(X1);
    IMF2=IMF2+imf1(1:6,:);   
end
IMF=(IMF+IMF2)/M/2; %EEMD分解所得到的IMF分量
end