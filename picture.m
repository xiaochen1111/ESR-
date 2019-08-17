%% ��ͼ figure1
figure
plot(y,'b','linewidth',1.2)
hold on
plot(y2,'r','linewidth',0.5)
% hold on
% plot(y2,'k','linewidth',0.5)
% axis([0 1024 9.382 9.45])
legend('un-aged','1.5x ESR    90%x C','2.0x ESR    80%x C');
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure2
plot(y,'b','linewidth',1.0)
hold on
plot(sig,'r','linewidth',0.5)
 axis([0 1024 9.39 9.44])
legend('original value of capacitor',' reconsitution value of capacitor')
ylabel('Ripple voltage(V)')
xlabel('Sample number')
%% figure3
plot(pcaout,'-b','linewidth',1.0)
hold on
plot(pcaout1,'-r','linewidth',1.0)
hold on
plot(pcaout2,'-m','linewidth',1.0)
% hold on
% plot(pcaout4,'-*r','linewidth',0.8)
% hold on
% plot(pcaout2,'-m','linewidth',1.0)

% yticks(-15:2:5);
legend('un-aged','1.5x ESR 90%x C','2.0x ESR 80%x C');
ylabel('characteristic value')
xlabel('Number of Cycles')
axis([1 10 9.395 9.435])
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
k=[2:2:169 ];
plot(k,cspca,'r','linewidth',1.5);
hold on
plot(k,pca,'b','linewidth',1.5);
xlabel('K')
ylabel('Dist')
legend('CS-PCA','PCA')
% title('ϡ���Kֵ��ŷ�Ͼ���')



