function [pcaout]=feaext(yin)
y=yin;
% PCA
% k=3:1:902;
k=1:1:1000;
pcain=y(k);
x=reshape(pcain,100,10);   % ��10��ֵдΪ����ÿһ�д���һ������
N=1;
p=gen_pca(x, N, 'svd');
pcaout=p*x;
% %% ����ƽ���˲�
% L = length(pcaout);
% n=5;  % ���ڴ���
% k = 0;
% m =0 ;
% for i = 1:L
%     m = m+1;
%     if i+n-1 > L
%         break
%     else
%         for j = i:n+i-1
%             k = k+1;
%             W(k) = pcaout(j) ;
%         end
%        pcaout(m) = mean(W);
%         k = 0;
%     end
% end

% pcaout=sum(pcaout)./N;