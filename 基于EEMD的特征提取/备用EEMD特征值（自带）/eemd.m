function IMF=eemd(x)
n=2500;
%% eemd�ֽ�
M=200;
a=0.1*std(x);
IMF=zeros(6,n);
for i=1:M
    noise=wgn(1,n,a);
    X=x+noise;
    imf=emd(X);
    IMF=IMF+imf(1:6,:);
end
IMF=IMF/M;
end