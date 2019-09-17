%% 作图 figure1
figure
plot(y,'g','linewidth',1.2)
hold on
plot(y1,'b','linewidth',0.5)
hold on
plot(y2,'m','linewidth',0.5)
hold on
plot(y3,'r','linewidth',0.5)
hold on
plot(y4,'k','linewidth',0.5)
axis([0 1024 9.353 9.47])
legend('state 1','state 2','state 3','state 4','state 5');
ylabel('Ripple voltage(V)')
xlabel('Sample number')
set(gca,'FontSize',12);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450
%% figure2
plot(y,'b','linewidth',1.0)
hold on
plot(sig,'r','linewidth',0.5)
 axis([0 1024 9.37 9.44])
legend('original value of capacitor',' reconsitution value of capacitor')
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure3
plot(pcaout,'-g','linewidth',1.2)
hold on
plot(pcaout1,'-b','linewidth',0.8)
hold on
plot(pcaout2,'-m','linewidth',0.8)
hold on
plot(pcaout3,'-r','linewidth',0.8)
hold on
plot(pcaout4,'-k','linewidth',0.8)

legend('state 1','state 2','state 3','state 4','state 5');
ylabel('Ripple voltage(V)')
xlabel('Time Window')
set(gca,'FontSize',12);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450
% axis([1 10 18 34])
% title('一个半周期')
%% 
kw=y(1:92);
N=91;
yft=fftshift(fft(kw,N));
Fs=50;
w = linspace(0, Fs*2, N);%频率坐标，单位Hz
bar(w,abs(yft));
% title('信号的频谱');
xlabel('Frequency(KHz)');
ylabel('Amplitude')
% plot(yft,'b','linewidth',1.0);
% hold on
% plot(ywft,'k','linewidth',0.8);
% hold on
% plot(sft,'r','linewidth',0.5);
%% 稀疏度K值与欧氏距离
K=[2:2:169 ];
plot(K,pca,'r','linewidth',1.5);
hold on
plot(K,pca1,'b','linewidth',1.5);
hold on
plot(K,pca2,'k','linewidth',1.5);
hold on
plot(K,pca3,'g','linewidth',1.5);
xlabel('K')
ylabel('Dist')
legend('CS-PCA','PCA')
% title('稀疏度K值与欧氏距离')