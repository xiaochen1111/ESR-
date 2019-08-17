function D=evalution(x1,x2)
X=[x1;x2];
D = pdist(X,'euclidean');
D=squareform(D);
D=D(:,1);