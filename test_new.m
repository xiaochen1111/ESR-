clc
clear all
%加载原始数据
load('boost1.mat');

%boost1
i=451000:452023;
j=450963:451986;
k=450979:452002;
m=450969:451992;
n=451020:452043;

y=boost1(i,1);
y1=boost1(j,2);
y2=boost1(k,3);
y3=boost1(m,4);
y4=boost1(n,5);
pca=[];
cspca=[];
% for w=30:5:65
w=45;               %信噪比
r=0.5;
pca=[];
pca1=[];
pca2=[];
pca3=[];
%%
% for r=0.2:0.1:0.8
% for K=2:2:169 
K=108;
sig=compressed(y,w,r,K);
sig1=compressed(y1,w,r,K);
sig2=compressed(y2,w,r,K);
sig3=compressed(y3,w,r,K);
sig4=compressed(y4,w,r,K);
% sig5=compressed(y5,w,r,K);
%% 特征提取
yw=awgn(sig, w,'measured', 9);
yw1=awgn(sig1,w,'measured', 9);
yw2=awgn(sig2,w,'measured',9);
yw3=awgn(sig3,w,'measured', 9);
yw4=awgn(sig4,w,'measured',9);
% yw5=y5+w;
% PCA
[pcaout]=feaext(yw);
[pcaout1]=feaext(yw1);
[pcaout2]=feaext(yw2);
[pcaout3]=feaext(yw3);
[pcaout4]=feaext(yw4);
% [pcaout4]=feaext(yw1);
% [pcaout5]=feaext(yw2);
%% 评价指标
D=evalution(pcaout,pcaout1);
D1=evalution(pcaout,pcaout2);
D2=evalution(pcaout,pcaout3);
D3=evalution(pcaout,pcaout4);
pca=[pca,D(2,:)];
pca1=[pca1,D1(2,:)];
pca2=[pca2,D2(2,:)];
pca3=[pca3,D3(2,:)];
% end
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