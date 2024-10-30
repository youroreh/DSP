U1 = 5;
U2 = -2;
U3 = 4;
U4 = -1;

T1 = 4;
T2 = 8;
Fd = 10;
S = 1 / Fd;

t = 0:S:T2;
t1 = 0:S:T1;
t2 = T1 + S:S:T2;

uf = U1 + (U2 - U1) / T1 * t1;
us = U3 + (U4 - U3) / (T2 - T1) * (t2 - T1);
ua = [uf us];

figure(1);
hold on;
plot(t, ua, 'r-');
stem(t, ua, 'b--');
title('Дискретный сигнал');
xlabel('Время, с');
ylabel('u(t), В');

n = 0:length(ua)-1;
ud = fft(ua);

figure(2);
subplot(2,1,1);
stem(n, abs(ud), 'r-*');
grid on;
title('Модуль спектральных отсчетов');
xlabel('n');
ylabel('|X(n)|');

subplot(2,1,2);
stem(n, angle(ud), 'r-*');
grid on;
title('Фаза спектральных отсчетов');
xlabel('n');
ylabel('arg(X(n))');

ud2 = ud;
nm = 2; 
ud2(nm+2:length(ud2)-nm) = 0;
uv = ifft(ud2);

figure(3);
hold on;
plot(t, ua, 'k-');
stem(t, uv, 'b--*');
title('Исходный и восстановленный сигнал');
xlabel('Время, с');
ylabel('u(t), В');

E0 = sum(abs(ua).^2);
E0v = sum(abs(uv).^2);

n = 0:2*length(ua)-1;
uaa = [ua zeros(1, length(ua))];
udd = fft(uaa);

figure(4);
subplot(2,1,1);
stem(n, abs(udd), 'r-*');
grid on;
title('Спектр дополненного нулями сигнала');
xlabel('n');
ylabel('|X(n)|');
xlim([0 2*length(ua)]);

subplot(2,1,2);
stem(n, angle(udd), 'r-*');
grid on;
xlim([0 2*length(ua)]);
title('Фаза дополненного нулями сигнала');
xlabel('n');
ylabel('arg(X(n))');