src = 'G:\MIT Redx\slit images across cornea\left eye, camera straight, slightly wider slit, lower mag\IA01729_006_0';
format = '.jpg';
numImg = 32;
startImg = 5;
midP = 17;
Fm = [];
width = 25;
for x = startImg:numImg
  colorImg = imread(strcat(src, sprintf('%02d', x),format));
  bw = rgb2gray(colorImg);
  threshold = 10;
  upperThreshold = 80;
  [r, c] = find((bw > threshold) & (bw < upperThreshold));
  if(x > midP) 
    c = 3530 - c;
  end
  tR = colorImg(:, :, 1);
  tG = colorImg(:, :, 2);
  tB = colorImg(:, :, 3);
  rC = tR(bw > threshold & bw < upperThreshold);
  gC = tG(bw > threshold & bw < upperThreshold);
  bC = tB(bw > threshold & bw < upperThreshold);
  len = length(r);
  if(x > startImg)
    Fm = [Fm;[r,c,ones(len,1)*((2*x - width)/2), double(rC), double(gC), double(bC)]];
  end
  Fm = [Fm;[r,c,ones(len,1)*x*width, double(rC), double(gC), double(bC)]];
end
csvwrite('dubbColorNewPo9.csv', Fm);
