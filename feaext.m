function [pcaout]=feaext(yin)
y=yin;
% PCA
k=3:1:902;
% k=1:1:920;
pcain=y(k);
x=reshape(pcain,50,18);   % 将10组值写为矩阵，每一列代表一个周期
N=1;
p=gen_pca(x, N, 'svd');
pcaout=p*x;