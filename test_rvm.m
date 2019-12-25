close all;
clear all;
clc;

%% parameters
N=200;     % 训练集样本数
Nts=1000;    % 测试集/预测集样本数

%% data generation and display
[x,t]=datagen(N);

figure(1);
hold on;
plot(x,t,'k.');

%% RVM
K=RBFkernal(x,x); %生成K矩阵：N*(N+1)
% 随机初始化 alpha（系数w的先验方差倒数） 和 
% beta（样本点误差的方差倒数，p(t|w,x,1/beta）=N(t|y(x),beta)=N(t|w*K,1/beta)
m=size(K,2);
alp=rand(1,m);
beta=rand();

for ii=1:1000,
    % 计算原理详见PRML 7.2节
    sig=pinv(diag(alp)+beta*(K'*K));    % 系数w的后验方差矩阵Sigma
    mu=sig*K'*t*beta;                   % 系数w的后验均值mu/u
    
    gamma=1-alp.*diag(sig)';
    
    alp_old=alp;
    beta_old=beta;
    idx=abs(alp)<1e3; % 部分alp会趋向于无穷大，对应的mu会趋向于会向于0，对于这部分alp不再更新
    alp(idx)=gamma(idx)./(mu(idx)'.^2);
    beta=(N-sum(gamma))/((t-K*mu)'*(t-K*mu));
    
    % 判断收敛则退出循环
    tmp_err=max(abs(alp(idx)-alp_old(idx))./abs(alp(idx)))+abs(beta-beta_old)/abs(beta);
    if tmp_err<0.1,
        break;
    end;
    
end;

% 计算并呈现训练集的预测结果，注意，这里在计算预测结果时仅使用了有效的mu值，即不为零的mu值
tpred=K(:,idx)*mu(idx);
figure(1);
plot(x,tpred,'b*');

% 呈现相关向量(Relevance Vectors)
figure(1);
plot(x(idx(2:end)),t(idx(2:end)),'ro');
title('Training Data');
xlabel('x');
ylabel('y');
legend('RAW Data','Predicted','Relevance Vector');

%% 测试集/验证集数据生成、预测及呈现
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
y=cos(x*5)-x+randn(N,1)/4;  % 注意：按照RVM算法，各数据点的误差方差应该一样

end

%%%%%%%%%%%%%%%%%%

function phi = RBFkernal( x, xb )
%RBFKERNAL Summary of this function goes here
%   Detailed explanation goes here
%   
%   x和xb之间的K矩阵：k(i,j)=exp(-(x(i)-xb(j))^2)

len=size(x,1);
lenb=size(xb,1);
phi=ones(len,lenb+1);

for ii=1:lenb,
    phi(:,ii+1)=exp(-(x-xb(ii)).^2);
end;

end
