clc
clear all
%加载原始数据
load('boost.mat');


% boost
i=452121:453144;
% j=452166:453189; 
k=452114:453137;
%buck
% i=180000:181023;
% j=179983:181006;
%buck-boost
% i=182000:183023;
% j=182018:183041;
%boost 5
% i=432000:433023;
% j=432013:433036;
%boost 2
% i=442000:443023; 
% j=442034:443057
%boost 10
% j=400050:401073; 
% i=400000:401023; 
% boost 16
% i=361000:362023;
% j=361025:362048;

y=boost(i,1);
% y1=boost(j,2);
y2=boost(k,3);
% y3=boostnew(i,5);
% y4=boostnew(i,6);
% y5=boostnew(i,7);
pca=[];
cspca=[];
% for w=30:5:65
w=40;               %信噪比
r=0.5;
%%
% for r=0.2:0.1:0.8
for K=2:2:169 

% K=54;
sig=compressed(y,w,r,K);
% sig1=compressed(y1,w,r,K);
sig2=compressed(y2,w,r,K);
% sig3=compressed(y3,w,r,K);
% sig4=compressed(y4,w,r,K);
% sig5=compressed(y5,w,r,K);
%% 特征提取
yw=awgn(y, w,'measured', 9);
% yw1=awgn(y1,w,'measured', 9);
yw2=awgn(y2,w,'measured',9);
% yw3=y3+w;
% yw4=y4+w;
% yw5=y5+w;
% PCA
[pcaout]=feaext(yw);
[pcaout1]=feaext(yw2);
[pcaout2]=feaext(sig);
[pcaout3]=feaext(sig2);
% [pcaout3]=feaext(yw);
% [pcaout4]=feaext(yw1);
% [pcaout5]=feaext(yw2);
%% 评价指标
D=evalution(pcaout,pcaout1);
D1=evalution(pcaout2,pcaout3);
% % D2=evalution(pcaout,pcaout3);
% % D3=evalution(pcaout,pcaout4);
% % D4=evalution(pcaout,pcaout5);
pca=[pca,D(2,:)];
cspca=[cspca,D1(2,:)];
end
%%
% sigpower=sum(abs(y).^2)/length(y);
% noisepower=sum(abs(sig-y).^2)/length(sig-y);
% SNR=10*log10(sigpower/noisepower);
% S=[S,SNR];
% % disp(['信噪比',num2str(SNR)])
% PRD=sqrt(sum((y-sig).^2)./sum(y.^2));
% P=[P,PRD];
% % disp(['失真率',num2str(PRD)]);
% RMSE=sqrt(sum((y-sig).^2)./1024);
% R=[R,RMSE]
% % disp(['均方根误差',num2str(RMSE)]);


