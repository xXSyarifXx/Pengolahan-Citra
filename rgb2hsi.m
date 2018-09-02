% Kelompok 1 :
% -------------------------------------------
% Oemar Syarif Burhan / 160535611844
% Slametian Dewa Tegar Perkasa / 160535611826
% Wahyu Eka Praditia / 160535611861
% -------------------------------------------
% S1 Teknik Informatika 2016 B

% fungsi RGB to HSI didapatkan dari internet
% dan dimodifikasi sedikit

% URL:
% 1. https://searchcode.com/codesearch/view/89154002/
% 2. https://www.imageeprocessing.com/2013/05/converting-rgb-image-to-hsi.html

function [imgHSI] = rgb2hsi(imgRGB)
    [rows, columns, var] = size(imgRGB);
    
    if var ~= 3
        error('Gambar bukan dari nilai matriks RGB');
    end
    %menjadikan nilai rgb ke dalam tipe double
    imgRGB = double(imgRGB);
    imgRGB = imgRGB/255;
    %memisahkan nilai matriks imgRGB menjadi 3 matriks
    r = imgRGB(:,:,1);
    g = imgRGB(:,:,2);
    b = imgRGB(:,:,3);
    
    %menghitung hue
    num = 0.5*((r-g)+(r-b));
    denom = ((r-g).^2+((r-b).*(g-b))).^0.5; 
    theta = acos(num./(denom+eps));
    
    %eps digunakan untuk menghindari nilai NaN
    
    H = theta; 
    H(b > g) = 360 - H(b > g);
    % if nilai blue > green : nilai H = 360 - theta.
    % else maka nilai H = theta itu sendiri
    
    %mengatur Saturation
    
    minim = min(min(r,g),b);
    jml = r+g+b;
    jml(jml == 0) = eps;
    S = 1-3.*(minim ./ jml);
    I = jml./3;

    H(S == 0) = 0;
    %memasukkan nilai HSI
    imgHSI = zeros(rows, columns, var);
    imgHSI(:,:,1) = H;
    imgHSI(:,:,2) = S;
    imgHSI(:,:,3) = I;
end
    
    
    
    