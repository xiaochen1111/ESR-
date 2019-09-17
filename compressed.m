%% Compressed Sensing Method for IGBT High-Speed Switching Time On-Line Monitoring
function sig3=compressed(s,w,r,K)
%% �����������
% s ԭʼ�ź�
% n ����
% r ѹ����
% f=awgn(s,no,'measured',9);
f=s+w;
n=length(f);                   
m = double(int32(r*n)); 
%                    ������������֪����
randn('state',3)
Phi = sqrt(1/m) * randn(m,n);     % ��֪���󣨲�������   ��˹�������  R��normrnd(MU,SIGMA,m,n)��sigma ����
f2 = Phi * f;                 % ͨ����֪�����ò���ֵ   mx1
Psi =inv( (fft(eye(n,n))));       % ����Ҷ���任��Ƶ��ϡ����������ϡ���ʾ����
A=Phi*Psi;                         % m*n
%% �ؽ��ź�                  omp �ع�
theta=CS_OMP(f2,A,K);
sig3=real(ifft(full(theta)));
%% ����ָ��    
% CR=m/n;
% disp(['ѹ����',num2str(CR)]);
% PRD=sqrt(sum((s'-sig3).^2)./sum(s'.^2));
% disp(['ʧ����',num2str(PRD)]);
% RMSE=sqrt(sum((s'-sig3).^2)./n);
% disp(['���������',num2str(RMSE)]);
% sigpower=sum(abs(s).^2)/length(s);
% noisepower=sum(abs(sig3'-s).^2)/length(sig3'-s);
% SNR=10*log10(sigpower/noisepower);
% disp(['�����',num2str(SNR)])