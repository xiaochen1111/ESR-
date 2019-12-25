clc
clear all
%加载原始数据
load('normal.mat');
load('fault1.mat');
load('fault2.mat');
load('fault3.mat');
load('fault4.mat');
load('fault5.mat');
load('fault6.mat');
load('fault7.mat');
load('fault8.mat');
% i=451000:454000;
% j=450963:453963;
% k=450979:453979;
% m=450969:453969;
% n=451020:454020;
% p=5:3005;



% y=boost1(i,1);
% y1=boost1(j,2);
% y2=boost1(k,3);
% y3=boost1(m,4);
% y4=boost1(n,5);
y=fault8;
[eigenvalue]=faultdictionary(y);
function [eigenvalue]=faultdictionary(y)
w=100;               %信噪比
r=0.5;
% pca=[];
% pca1=[];
% pca2=[];
% pca3=[];
% pca4=[];
% smooth=[];
%%
% for r=0.3:0.1:0.8
% for w=30:5:65

yw=awgn(y, w,'measured', 10);
% yw=y;
% yw1=awgn(y1,w,'measured',10);
% yw2=awgn(y2,w,'measured',10);
% yw3=awgn(y3,w,'measured',10);
% yw4=awgn(y4,w,'measured',10);
% 
% yw=y+zStable;
% yw1=y1+zStable;
% yw2=y2+zStable;
% yw3=y3+zStable;
% yw4=y4+zStable;

%%
% for K=40:2:160
% for ii=1:92:920
%     j=ii:1:ii+1840;
K=1;                    %70;124
[theta]=compressed(yw,r,K);
% [sig1,theta1]=compressed(yw1,r,K);
% [sig2,theta2]=compressed(yw2,r,K);
% [sig3,theta3]=compressed(yw3,r,K);
% [sig4,theta4]=compressed(yw4,r,K);
% %%
eigenvalue=max(abs(theta));

% theta1=max(abs(theta1));
% theta2=max(abs(theta2));
% theta3=max(abs(theta3));
% theta4=max(abs(theta4));
end
% % 
% theta= max(xcorr(theta));
% theta1=max(xcorr(theta1));
% theta2=max(xcorr(theta2));
% theta3=max(xcorr(theta3));
% theta4=max(xcorr(theta4));
% 
% theta=mean(yw(j));
% theta1=mean(yw1(j));
% theta2=mean(yw2(j));
% theta3=mean(yw3(j));
% theta4=mean(yw4(j));



% theta=abs(fft(theta));
% ssum=mean(theta(2:end));
% theta(2:end)=0;
% theta(1)=theta(1)-ssum;
% theta=ifft(abs(theta));
% % theta1=abs(fft(theta1));
% ssum1=mean(theta1(2:end));
% theta1(2:end)=0;
% theta1(1)=theta1(1)-ssum1;
% theta1=ifft(abs(theta1));
% % theta2=abs(fft(theta2));
% ssum2=mean(theta2(2:end));
% theta2(2:end)=0;
% theta2(1)=theta2(1)-ssum2;
% theta2=ifft(abs(theta2));
% % theta3=abs(fft(theta3));
% ssum3=mean(theta3(2:end));
% theta3(2:end)=0;
% theta3(1)=theta3(1)-ssum3;
% theta3=ifft(abs(theta3));
% % theta4=abs(fft(theta4));
% ssum4=mean(theta4(2:end));
% theta4(2:end)=0;
% theta4(1)=theta4(1)-ssum4;
% theta4=ifft(abs(theta4));
% 
% theta=max(abs(theta));
% theta1=max(abs(theta1));
% theta2=max(abs(theta2));
% theta3=max(abs(theta3));
% theta4=max(abs(theta4));

% pca=[pca,theta];
% pca1=[pca1,theta1];
% pca2=[pca2,theta2];
% pca3=[pca3,theta3];
% pca4=[pca4,theta4];
% end
% %% 特征提取
% % PCA
% 
% [pcaout,p]=feaext(sig);
% [pcaout1,p1]=feaext(sig1);
% [pcaout2,p2]=feaext(sig2);
% [pcaout3,p3]=feaext(sig3);
% [pcaout4,p4]=feaext(sig4);


% %% 评价指标
% D=evalution(pcaout,pcaout1);
% D1=evalution(pcaout,pcaout2);
% D2=evalution(pcaout,pcaout3);
% D3=evalution(pcaout,pcaout4);
% pca=[pca,D(2,:)];
% pca1=[pca1,D1(2,:)];
% pca2=[pca2,D2(2,:)];
% pca3=[pca3,D3(2,:)];
% d1=abs(mean(pcaout2)-mean(pcaout1));
% d2=abs(mean(pcaout2)-mean(pcaout1));
% dd=[d1,d2];
% smooth1=sqrt(sum(diff(pcaout2).^2)./(8*(min(dd).^2)));
% smooth=[smooth,smooth1];
% % end
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