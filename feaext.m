function [pcaout]=feaext(yin)
y=yin;
% % PCA
% k=81:1:1000;
% % k=1:1:920;
% pcain=y(k);
% x=reshape(pcain,92,10);   % ��10��ֵдΪ����ÿһ�д���һ������
x=y;
N=1;
p=gen_pca(x, N, 'svd');
pcaout=p*x;