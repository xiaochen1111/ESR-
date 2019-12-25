close all;
clear all;
clc;

%% parameters
N=200;     % ѵ����������
Nts=1000;    % ���Լ�/Ԥ�⼯������

%% data generation and display
[x,t]=datagen(N);

figure(1);
hold on;
plot(x,t,'k.');

%% RVM
K=RBFkernal(x,x); %����K����N*(N+1)
% �����ʼ�� alpha��ϵ��w�����鷽����� �� 
% beta�����������ķ������p(t|w,x,1/beta��=N(t|y(x),beta)=N(t|w*K,1/beta)
m=size(K,2);
alp=rand(1,m);
beta=rand();

for ii=1:1000,
    % ����ԭ�����PRML 7.2��
    sig=pinv(diag(alp)+beta*(K'*K));    % ϵ��w�ĺ��鷽�����Sigma
    mu=sig*K'*t*beta;                   % ϵ��w�ĺ����ֵmu/u
    
    gamma=1-alp.*diag(sig)';
    
    alp_old=alp;
    beta_old=beta;
    idx=abs(alp)<1e3; % ����alp������������󣬶�Ӧ��mu�������ڻ�����0�������ⲿ��alp���ٸ���
    alp(idx)=gamma(idx)./(mu(idx)'.^2);
    beta=(N-sum(gamma))/((t-K*mu)'*(t-K*mu));
    
    % �ж��������˳�ѭ��
    tmp_err=max(abs(alp(idx)-alp_old(idx))./abs(alp(idx)))+abs(beta-beta_old)/abs(beta);
    if tmp_err<0.1,
        break;
    end;
    
end;

% ���㲢����ѵ������Ԥ������ע�⣬�����ڼ���Ԥ����ʱ��ʹ������Ч��muֵ������Ϊ���muֵ
tpred=K(:,idx)*mu(idx);
figure(1);
plot(x,tpred,'b*');

% �����������(Relevance Vectors)
figure(1);
plot(x(idx(2:end)),t(idx(2:end)),'ro');
title('Training Data');
xlabel('x');
ylabel('y');
legend('RAW Data','Predicted','Relevance Vector');

%% ���Լ�/��֤���������ɡ�Ԥ�⼰����
[xts,tts]=datagen(Nts);
figure; hold;
plot(xts,tts,'.');

xtsK=RBFkernal(xts,x);
ttspred=xtsK(:,idx)*mu(idx);
plot(xts,ttspred,'o');
title('Testing Data');
xlabel('x');
ylabel('y');
legend('RAW Data','Predicted');

%% %%%%%%%%%%%%%%%%%%%%

function [ x, y ] = datagen( N )
%DATAGEN Summary of this function goes here
%   Detailed explanation goes here

x=(rand(N,1)-0.5)*4;
y=cos(x*5)-x+randn(N,1)/4;  % ע�⣺����RVM�㷨�������ݵ������Ӧ��һ��

end

%%%%%%%%%%%%%%%%%%

function phi = RBFkernal( x, xb )
%RBFKERNAL Summary of this function goes here
%   Detailed explanation goes here
%   
%   x��xb֮���K����k(i,j)=exp(-(x(i)-xb(j))^2)

len=size(x,1);
lenb=size(xb,1);
phi=ones(len,lenb+1);

for ii=1:lenb,
    phi(:,ii+1)=exp(-(x-xb(ii)).^2);
end;

end
