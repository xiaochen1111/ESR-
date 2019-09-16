%% 作图 figure1
figure
plot(y,'g','linewidth',1.5)
hold on
plot(y1,'r','linewidth',1.5)
hold on
plot(y2,'k','linewidth',1.5)
axis([0 1000 10.48 10.97])

set(gca,'FontSize',15);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450
legend('un-aged','91%x C','82%x C');
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure2
plot(y,'b','linewidth',1.0)
hold on
plot(sig,'r','linewidth',0.5)
 axis([0 1024 9.37 9.44])
legend('original value of capacitor',' reconsitution value of capacitor')
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure3
plot(pcaout,'-g','linewidth',1.5)
hold on
plot(pcaout1,'-r','linewidth',1.5)
hold on
plot(pcaout2,'-k','linewidth',1.5)
% yticks(-15:2:5);
legend('un-aged','91%x C','82%x C');
ylabel('Characteristic value')
xlabel('Number of Cycles')
axis([1 18 -10 37])
set(gca,'FontSize',15);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450
set(gca,'xtick',[0,2,4,6,8,10,12,14,16,18]);
% set(gca,'ytick',[-6,-3,0,3,6,9]);
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
% title('稀疏度K值与欧氏距离')



