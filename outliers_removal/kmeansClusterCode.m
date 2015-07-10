function [] = kmeansClusterCode(filename,N)

M = dlmread(filename);
idx = kmeans(M,N);

[m,n] = size(M);
clstr = zeros(1,N);

for i=1:N
    [clstr(i),o] = size(find(idx==i));
end

[argvalue, argmax] = max(clstr(:));

K = M((find(idx==argmax)),:);

csvwrite('clusteredImage1.csv',K);
savepcd('cluster1.pcd', K);
end