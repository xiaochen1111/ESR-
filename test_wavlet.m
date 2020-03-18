% 导入数据
V=boost(1:2048,2);
I=boost(1:2048,3);
% V=awgn(V1,40);
% I=awgn(I1,40);
N=length(V);
%% 小波变换矩阵
ww=gen_dwt(N);
%% 变换后的结果
V_theta=ww*V;
I_theta=ww*I;
[V_fs1,V_fs2,V_fs3,V_fs4,V_fs5,V_fs6]=value_extract(V_theta);
[I_fs1,I_fs2,I_fs3,I_fs4,I_fs5,I_fs6]=value_extract(I_theta);
ESR1=V_fs1./I_fs1;
ESR2=V_fs2./I_fs2;
ESR3=V_fs3./I_fs3;
ESR4=V_fs4./I_fs4;
ESR5=V_fs5./I_fs5;
ESR6=V_fs6./I_fs6;
ESR=[ESR1,ESR3,ESR4,ESR5,ESR6];
ESR=min(ESR)
%% 数值处理

function [value1,value2,value3,value4,value5,value6]=value_extract(x)
amp=abs(x);
amp(1)=[];    % 去掉第一个幅度值
% [~,ii]=max(amp);
% amp(ii)=[];
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
% V_mean=mean(V_theta(2:2048));
% I_mean=mean(I_theta(2:2048));
% ESR=V_mean./I_mean;
% V_theta(1)=[];
% V_out=max(abs(V_theta));
% I_theta(1)=[];
% I_out=max(abs(I_theta));
end
