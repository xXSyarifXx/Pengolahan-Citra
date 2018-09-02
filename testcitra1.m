img = imread('rx7.jpg');
figure(1), imshow(img), title('normal RGB');
hsimg = rgb2hsi(img);
figure(2), imshow(hsimg), title('RGB to HSI');
