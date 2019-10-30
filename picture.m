%% 作图 figure1
x=0:1:499;
figure
plot(y,'g','linewidth',1.8)
hold on
plot(y1,'b','linewidth',0.5)
hold on
plot(y2,'m','linewidth',0.5)
hold on
plot(y3,'r','linewidth',0.5)
hold on
plot(y4,'k','linewidth',1.5)
% axis([0 499 10.456 10.9])
legend('state 1','state 2','state 3');
ylabel('Ripple voltage(V)')
xlabel('Time(us)')
set(gca,'FontSize',12);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450
set(gca,'xtick',[0,50,50*2,50*3,50*4,50*5,50*6,50*7,50*8,50*9,50*10]);
set(gca,'xticklabel',{'0','25','50','75','100','125','150','175','200','225','250'});

%% figure2
plot(y,'b','linewidth',1.0)
hold on
plot(sig,'r','linewidth',0.5)
 axis([0 1024 9.37 9.44])
legend('original value of capacitor',' reconsitution value of capacitor')
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure3
x=1:1:10;
stairs(x,pcaout,'-g','linewidth',1.8)
hold on
stairs(x,pcaout1,'-b','linewidth',0.8)
hold on
stairs(x,pcaout2,'-m','linewidth',0.8)
hold on
stairs(x,pcaout3,'-r','linewidth',0.8)
hold on
stairs(x,pcaout4,'-k','linewidth',1.5)

legend('state 1','state 2','state 3','state 4','state 5');
ylabel('Characteristic Value')%Ripple voltage(V)
xlabel('Time Window')
set(gca,'FontSize',12);
set(gca,'FontName','Helvetica');%%设置所有字体大小为18号，字体为Helverica
set(gca,'linewidth',1.5);%%设置图框的线宽
set(gcf,'position',[0 0 650 450]);%%设置画幅大小为横650*纵450

% axes('position', [0.39 0.18, 0.50, 0.26])
% staris(pcaout,'-g','linewidth',1.2)
% hold on
% staris(pcaout1,'-b','linewidth',0.8)
% hold on
% staris(pcaout2,'-m','linewidth',0.8)
% hold on
% staris(pcaout3,'-r','linewidth',0.8)
% hold on
% staris(pcaout4,'-k','linewidth',0.8)
% xlim([1 10 8.063 8.077])
% axis([1 10 -3 8])
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
K=[2:2:169];
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