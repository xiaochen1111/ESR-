% ����CS������ʶboost��·�ĵ�����C��ESR��ֵ
clc 
clear all
%% ��������
% fs=10008;     %����Ƶ��
% N=5004;      %��������
% n=0:N-1;
% fn=n*fs/N;    %Ƶ������
V=buck1(1:1:2048,2);
I=buck1(1:1:2048,3);
% V=awgn(V1,40);
% I=awgn(I1,40);
% ESR �� Cֵ����ȡ
[V_fs1,V_fs2,V_fs3,V_fs4,V_fs5,V_fs6,thetaV]=value_extract(V);
[I_fs1,I_fs2,I_fs3,I_fs4,I_fs5,I_fs6,thetaI]=value_extract(I);
ESR1=V_fs1./I_fs1;
ESR2=V_fs2./I_fs2;
ESR3=V_fs3./I_fs3;
ESR4=V_fs4./I_fs4;
ESR5=V_fs5./I_fs5;
ESR6=V_fs6./I_fs6;
ESR=[ESR1,ESR3,ESR4,ESR5,ESR6];
ESR=min(ESR)
%% ����Ƶͼ
amp=abs(thetaV);
N=length(thetaV);
n=0:N-1;
fs=500*N;     %����Ƶ��  1600K 
fn=n*fs/N;    %Ƶ������
mag=amp/((N-1)/2);
plot(fn,mag)
%%
function [value1,value2,value3,value4,value5,value6,theta]=value_extract(x)
% CS��������ֵ
r=0.5;       % ѹ����
K=8;        % ϡ���
[theta]=compressed(x,r,K);
%% FFT��ȡ����ֵ
% [theta]=fft(x);
%% ���ݴ���
amp=abs(theta);
amp(1)=[];    % ȥ����һ������ֵ
[~,ii]=max(amp);
amp(ii)=[];
[value1,ij]=max(amp);
amp(ij)=[];
[value2,ik]=max(amp);
amp(ik)=[];
[value3,ip]=max(amp);
amp(ip)=[];
[value4,iq]=max(amp);
amp(iq)=[];
[value5,ir]=max(amp);
amp(ir)=[];
[value6,is]=max(amp);
% pha=angle(theta)/pi*180;%�����
% value3=pha(ij);
end
%% DCT 
function C = gen_dct(n)
alp = [sqrt(1/n) sqrt(2/n)*ones(1,n-1)];
ind = (1:2:(2*n-1))*pi/(2*n);
C = zeros(n,n);
for k = 1:n
C(k,:) = alp(k)*cos((k-1)*ind);
end
end