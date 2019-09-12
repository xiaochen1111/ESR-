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
%% 初始化
pca=[];
cspca=[];
% for w=30:5:65
w=30;               %信噪比
r=0.5;              %压缩率
pca=[];
pca1=[];
pca2=[];
pca3=[];
% 添加噪声
yw=awgn(y, w,'measured', 9);
yw1=awgn(y1,w,'measured', 9);
yw2=awgn(y2,w,'measured',9);
yw3=awgn(y3,w,'measured', 9);
yw4=awgn(y4,w,'measured',9);

%% 重构
% for r=0.2:0.1:0.8
% for K=2:2:169 
K=112;
sig=compressed(y,w,r,K);
sig1=compressed(y1,w,r,K);
sig2=compressed(y2,w,r,K);
sig3=compressed(y3,w,r,K);
sig4=compressed(y4,w,r,K);

%% 时域特征提取 退化指标的建立
[me,ma,mi,st,fc,pk ,rmse ,fgfz ,sf ,cf ,If ,Clf ,Kv]=time_feaext(sig);
[me1,ma1,mi1,st1,fc1,pk1,rmse1,fgfz1,sf1,cf1,If1,Clf1,Kv1]=time_feaext(sig1);
[me2,ma2,mi2,st2,fc2,pk2,rmse2,fgfz2,sf2,cf2,If2,Clf2,Kv2]=time_feaext(sig2);
[me3,ma3,mi3,st3,fc3,pk3,rmse3,fgfz3,sf3,cf3,If3,Clf3,Kv3]=time_feaext(sig3);
[me4,ma4,mi4,st4,fc4,pk4,rmse4,fgfz4,sf4,cf4,If4,Clf4,Kv4]=time_feaext(sig4);
yy=[me;ma;mi;st;fc;pk;rmse;fgfz;sf;cf;If;Clf;Kv];
yy1=[me1;ma1;mi1;st1;fc1;pk1;rmse1;fgfz1;sf1;cf1;If1;Clf1;Kv1];
yy2=[me2;ma2;mi2;st2;fc2;pk2;rmse2;fgfz2;sf2;cf2;If2;Clf2;Kv2];
yy3=[me3;ma3;mi3;st3;fc3;pk3;rmse3;fgfz3;sf3;cf3;If3;Clf3;Kv3];
yy4=[me4;ma4;mi4;st4;fc4;pk4;rmse4;fgfz4;sf4;cf4;If4;Clf4;Kv4];
%% PCA特征提取
[pcaout]=feaext(yy);
[pcaout1]=feaext(yy1);
[pcaout2]=feaext(yy2);
[pcaout3]=feaext(yy3);
[pcaout4]=feaext(yy4);
 
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