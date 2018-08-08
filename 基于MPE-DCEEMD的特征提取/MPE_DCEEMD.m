
function IMF=MPE_DCEEMD(x)
n=2500;
%% ceemd分解
M=200;
a=0.1*std(x);
IMF=zeros(6,n);
IMF2=zeros(6,n);
for i=1:M
    noise=wgn(1,n,a);
    noise2(i,:)=-noise;
    X=x+noise;
    imf=emd(X);
    IMF=IMF+imf(1:6,:);  
end
for i=1:M
    X=x+noise2(i,:);
    imf=emd(X);
    IMF2=IMF2+imf(1:6,:); 
end
IMF=(IMF+IMF2)/M/2; %CEEMD分解所得到的IMF分量
%% 解相关CEEMD  
a=1;
sigma=0.001;
for i=6:-1:2
    xn=IMF(i-1,:);
    yn=IMF(i,:);
    pe1(i-1)=ipe(xn);
    pe2(i-1)=ipe(yn);
    pesub(i-1)=pe1(i-1)-pe2(i-1);
    if pesub(i-1)<=0.05   %阈值设置为0.05，大于阈值则进行解相关，否则不进行解相关操作
        continue;
    end
    r=yn*xn'/(yn*yn');
    zn=xn+yn;
    while a==1
        vn=xn-r*yn;
        y1n=zn-vn;

        r1=y1n*vn'/(y1n*y1n');
        if r1<sigma
            IMF(i-1,:)=vn;
            break;
        else
            xn=vn;
            r=r1;
        end
    end
end
 
end

