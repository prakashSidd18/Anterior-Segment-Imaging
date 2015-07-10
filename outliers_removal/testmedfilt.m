% >> 3-D median filtering <<
rand('state',0)
[x,y,z,V] = flow(50);
noisyV = V + 0.1*double(rand(size(V))>0.95);
clear V
figure
subplot(121)
hpatch = patch(isosurface(x,y,z,noisyV,0));
isonormals(x,y,z,noisyV,hpatch)
set(hpatch,'FaceColor','red','EdgeColor','none')
daspect([1,4,4]), view([-65,20]), axis tight off
camlight left; lighting phong
subplot(122)
%--------
denoisedV = medfilt3(noisyV,7);
%--------
hpatch = patch(isosurface(x,y,z,denoisedV,0));
isonormals(x,y,z,denoisedV,hpatch)
set(hpatch,'FaceColor','red','EdgeColor','none')
daspect([1,4,4]), view([-65,20]), axis tight off
camlight left; lighting phong