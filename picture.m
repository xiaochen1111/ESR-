%% ��ͼ figure1
figure
plot(y,'g','linewidth',1.5)
hold on
plot(y1,'r','linewidth',1.5)
hold on
plot(y2,'k','linewidth',1.5)
axis([0 1000 10.48 10.97])

set(gca,'FontSize',15);
set(gca,'FontName','Helvetica');%%�������������СΪ18�ţ�����ΪHelverica
set(gca,'linewidth',1.5);%%����ͼ����߿�
set(gcf,'position',[0 0 650 450]);%%���û�����СΪ��650*��450
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
set(gca,'FontName','Helvetica');%%�������������СΪ18�ţ�����ΪHelverica
set(gca,'linewidth',1.5);%%����ͼ����߿�
set(gcf,'position',[0 0 650 450]);%%���û�����СΪ��650*��450
set(gca,'xtick',[0,2,4,6,8,10,12,14,16,18]);
% set(gca,'ytick',[-6,-3,0,3,6,9]);
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
% title('ϡ���Kֵ��ŷ�Ͼ���')



