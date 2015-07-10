function [] = pcdtocsv(rfile, wfile)
    M = loadpcd(rfile);
    M = transpose(M);
    csvwrite(wfile,M);
end
    