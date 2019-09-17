%% ��ͼ figure1
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
set(gca,'FontName','Helvetica');%%�������������СΪ18�ţ�����ΪHelverica
set(gca,'linewidth',1.5);%%����ͼ����߿�
set(gcf,'position',[0 0 650 450]);%%���û�����СΪ��650*��450
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
set(gca,'FontName','Helvetica');%%�������������СΪ18�ţ�����ΪHelverica
set(gca,'linewidth',1.5);%%����ͼ����߿�
set(gcf,'position',[0 0 650 450]);%%���û�����СΪ��650*��450
% axis([1 10 18 34])
% title('һ��������')
%% 
kw=y(1:92);
N=91;
yft=fftshift(fft(kw,N));
Fs=50;
w = linspace(0, Fs*2, N);%Ƶ�����꣬��λHz
bar(w,abs(yft));
% title('�źŵ�Ƶ��');
xlabel('Frequency(KHz)');
ylabel('Amplitude')
% plot(yft,'b','linewidth',1.0);
% hold on
% plot(ywft,'k','linewidth',0.8);
% hold on
% plot(sft,'r','linewidth',0.5);
%% ϡ���Kֵ��ŷ�Ͼ���
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
% title('ϡ���Kֵ��ŷ�Ͼ���')