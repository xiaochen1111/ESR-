function [pcaout]=feaext(yin)
y=yin;
% PCA
k=61:1:980;
% k=1:1:910;
pcain=y(k);
x=reshape(pcain,92,10);   % ��10��ֵдΪ����ÿһ�д���һ������
N=1;
p=gen_pca(x, N, 'svd');
pcaout=p*x;