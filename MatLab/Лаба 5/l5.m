kk = 0:1e5-1;
am = 1;
ph = 10;
ww = 0.5;
sig = am * cos(ww * kk + ph);

xq = round(sig * 256) / 256;
noi = sig - xq;

figure(1);
subplot(2,2,1);
plot(noi(1:200));
xlabel('k');
ylabel('Уровень шума квантования');
title('Шум квантования, гармонический сигнал, шаг 1/256');
grid on;
grid minor;

subplot(2,2,2);
histogram(noi, 100, 'BinWidth', 0.1);
xlabel('Уровень шума квантования');
ylabel('Кол-во отсчётов');
title('Гистограмма шума квантования, гармонический сигнал, шаг 1/256');

subplot(2,2,3);
[rx, dd] = xcorr(noi, 100, 'unbiased');
plot(dd, rx);
xlabel('Сдвиг (в отсчётах)');
ylabel('R(x)');
title('АКФ шума квантования, гармонический сигнал, шаг 1/256');
grid on;
grid minor;

subplot(2,2,4);
pwelch(noi, 256);
title('Спектр мощности шума квантования, гармонический сигнал, шаг 1/256');
ylabel('Мощность');
xlabel('Частота');

xq = round(sig * 16) / 16;
noi = sig - xq;

figure(2);
subplot(2,2,1);
plot(noi(1:200));
xlabel('k');
ylabel('Уровень шума квантования');
title('Шум квантования, гармонический сигнал, шаг 1/16');
grid on;
grid minor;

subplot(2,2,2);
histogram(noi, 100, 'BinWidth', 0.1);
xlabel('Уровень шума квантования');
ylabel('Кол-во отсчётов');
title('Гистограмма шума квантования, шаг 1/16');

subplot(2,2,3);
[rx, dd] = xcorr(noi, 100, 'unbiased');
plot(dd, rx);
xlabel('Сдвиг (в отсчётах)');
ylabel('R(x)');
title('АКФ шума квантования, шаг 1/16');
grid on;
grid minor;

subplot(2,2,4);
pwelch(noi, 256);
title('Спектр мощности шума квантования, шаг 1/16');
ylabel('Мощность');
xlabel('Частота');

xq = round(sig);
noi = sig - xq;

figure(3);
subplot(2,2,1);
plot(noi(1:200));
xlabel('k');
ylabel('Уровень шума квантования');
title('Шум квантования, гармонический сигнал, шаг 1');
grid on;
grid minor;

subplot(2,2,2);
histogram(noi, 100, 'BinWidth', 0.1);
xlabel('Уровень шума квантования');
ylabel('Кол-во отсчётов');
title('Гистограмма шума квантования, шаг 1');

subplot(2,2,3);
[rx, dd] = xcorr(noi, 100, 'unbiased');
plot(dd, rx);
xlabel('Сдвиг (в отсчётах)');
ylabel('R(x)');
title('АКФ шума квантования, шаг 1');
grid on;
grid minor;

subplot(2,2,4);
pwelch(noi, 256);
title('Спектр мощности шума квантования, шаг 1');
ylabel('Мощность');
xlabel('Частота');

sn = randn(1, 1e5);
sig = sn / max(abs(sn));
xq = round(sig * 256) / 256;
noi = sig - xq;

figure(4);
subplot(2,2,1);
plot(noi(1:200));
xlabel('k');
ylabel('Уровень шума квантования');
title('Шум квантования, случайный шум, шаг 1/256');
grid on;
grid minor;

subplot(2,2,2);
histogram(noi, 100, 'BinWidth', 0.1);
xlabel('Уровень шума квантования');
ylabel('Кол-во отсчётов');
title('Гистограмма шума квантования, случайный шум, шаг 1/256');

subplot(2,2,3);
[rx, dd] = xcorr(noi, 100, 'unbiased');
plot(dd, rx);
xlabel('Сдвиг (в отсчётах)');
ylabel('R(x)');
title('АКФ шума квантования, случайный шум, шаг 1/256');
grid on;
grid minor;

subplot(2,2,4);
pwelch(noi, 256);
title('Спектр мощности шума квантования, случайный шум, шаг 1/256');
ylabel('Мощность');
xlabel('Частота');

load mtlb;
sig = mtlb / max(abs(mtlb));
xq = round(sig * 256) / 256;
noi = sig - xq;

figure(5);
subplot(2,2,1);
plot(noi(1:200));
xlabel('k');
ylabel('Уровень шума квантования');
title('Шум квантования, речевой сигнал, шаг 1/256');
grid on;
grid minor;

subplot(2,2,2);
histogram(noi, 100, 'BinWidth', 0.1);
xlabel('Уровень шума квантования');
ylabel('Кол-во отсчётов');
title('Гистограмма шума квантования, речевой сигнал, шаг 1/256');

subplot(2,2,3);
[rx, dd] = xcorr(noi, 100, 'unbiased');
plot(dd, rx);
xlabel('Сдвиг (в отсчётах)');
ylabel('R(x)');
title('АКФ шума квантования, речевой сигнал, шаг 1/256');
grid on;
grid minor;

subplot(2,2,4);
pwelch(noi, 256);
title('Спектр мощности шума квантования, речевой сигнал, шаг 1/256');
ylabel('Мощность');
xlabel('Частота');